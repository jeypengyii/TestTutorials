$(function () {
  Date.prototype.monthNames = [
    "January", "February", "March",
    "April", "May", "June",
    "July", "August", "September",
    "October", "November", "December"
  ];
  Date.prototype.getMonthName = function () {
    return this.monthNames[this.getMonth()];
  };
  Date.prototype.getShortMonthName = function () {
    return this.getMonthName().substr(0, 3);
  };
  Date.prototype.getFullDate = function () {
    var month = this.getMonth() + 1;
    var day = this.getDate();
    var year = this.getFullYear();
    month = month <= 9 ? '0' + month : month;
    day = day <= 9 ? '0' + day : day;
    return year + "-" + month + "-" + day;
  };
  Date.prototype.getFullProperDate = function () {
    var month = this.getMonthName();
    var day = this.getDate();
    var year = this.getFullYear();
    day = day <= 9 ? '0' + day : day;
    return month + " " + day + ", " + year;
  };
  Date.prototype.getTime = function () {
    var hours = this.getHours();
    var minutes = this.getMinutes();
    hours = hours <= 9 ? '0' + hours : hours;
    minutes = minutes <= 9 ? '0' + minutes : minutes;
    return hours + ":" + minutes;
  };
  Date.prototype.getFullDateTime = function () {
    var month = this.getMonth() + 1;
    var day = this.getDate();
    var year = this.getFullYear();
    month = month <= 9 ? '0' + month : month;
    day = day <= 9 ? '0' + day : day;
    var full_date = year + "-" + month + "-" + day;

    var hours = this.getHours();
    var minutes = this.getMinutes();
    hours = hours <= 9 ? '0' + hours : hours;
    minutes = minutes <= 9 ? '0' + minutes : minutes;
    var full_time = hours + ":" + minutes;

    return full_date + ' ' + full_time;
  };

  if (window.$) {
    window.$.setCookie = function (name, value, days) {
      var expires = "";
      if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
      }
      document.cookie = name + "=" + (value || "") + expires + "; path=/";
    };

    window.$.getCookie = function (name) {
      var nameEQ = name + "=";
      var ca = document.cookie.split(';');
      for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ')
          c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0)
          return c.substring(nameEQ.length, c.length);
      }
      return null;
    };

    window.$.eraseCookie = function (name) {
      document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    };

    window.$.show_alert = function (type, title, message) {
      swal({
        title: title,
        text: "",
        type: type,
        confirmButtonColor: '#4a5fc6'
      }, function () {
//        if (isConfirm) {
        window.onkeydown = null;
        window.onfocus = null;
//        }
      });


      $('.sweet-alert').css('z-index', '9999999999');
      $('.sweet-alert').css('box-shadow', '0px 0px 0px 10000px rgba(0,0,0,0.4)');
      $('.sweet-alert').css('position', 'absolute !important');
      $('.sweet-alert').children('p').eq(0).empty().append(message);

      $('.sweet-alert').animate({scrollTop: '0px'}, 0);
      $(".sweet-alert").css("margin-top", -$(".sweet-alert").outerHeight() / 2);
    };

    window.$.show_loading = function (title, message) {
      if (!$.is_empty(title)) {
        $('#modal_wait_title').text(title);
      }
      if (!$.is_empty(message)) {
        $('#global_modal_msg').text(message);
      }
      $('#global_modal_wait').modal('show');
    };

    window.$.hide_loading = function () {
      $('#modal_wait_title').text('Please wait...');
      $('#global_modal_msg').text('Loading...');
      $('#global_modal_wait').modal('hide');
    };
    window.$.is_empty = function (str) {
      return ((str === null) || (str === '') || (str === undefined) || (str === '0'));
    };


    window.$.is_zero = function (int) {
      return (int === 0);
    };

    window.$.is_required = function (obj_name, val) {
      var error = '';
      if ($.is_empty(val)) {
        error = '<p class="m-1"><span class="text-primary">' + obj_name + '</span> is required</p>';
      }
      return error;
    };


    window.$.is_email = function (email) {
      var regex = /^([a-zA-Z0-9\u00f1\u00d1_.+-])+\@(([a-zA-Z0-9\u00f1\u00d1-])+\.)+([a-zA-Z0-9\u00f1\u00d1]{2,4})+$/;
      return regex.test(email);
    };

    window.$.get_age = function (date) {
      var dob = new Date(date);
      var diff_ms = Date.now() - dob.getTime();
      var age_dt = new Date(diff_ms);

      return Math.abs(age_dt.getUTCFullYear() - 1970);
    };

    window.$.isNullOrEmpty = function (str) {
      return ((str === null) || (str === '') || (str === undefined));
    };

    window.$.includeCommas = function (num) {
      var origNum = num.toString();
      var newNum = "";
      var wholeNum = "";
      var decNum = "";
      if (origNum.indexOf('.') >= 0) {
        var numArray = origNum.split('.');
        wholeNum = numArray[0];
        decNum = '.' + numArray[1];
      } else {
        wholeNum = origNum;
        decNum = "";
      }

      if (wholeNum.length > 3) {
        var ctr = 0;
        for (var x = wholeNum.length - 1; x >= 0; x--) {
          ctr += 1;
          if (ctr === 4) {
            newNum = ',' + newNum;
            ctr = 1;
          }
          newNum = wholeNum.charAt(x) + newNum;
        }
      } else {
        newNum = wholeNum;
      }
      newNum = newNum + decNum;
      return newNum;
    };

    window.$.removeCommas = function (str) {
      if ($.isNullOrEmpty(str)) {
        str = '0.00';
      }
      return str.toString().replace(/\,/g, "");
    };

    window.$.toMoney = function (num) {
      return $.includeCommas($.toQty(num));
    };

    window.$.toQty = function (str) {
      str = $.removeCommas(str);
      if ($.isNullOrEmpty(str) || isNaN(str)) {
        return 0;
      } else {
        return parseFloat($.removeCommas(str)).toFixed(2);
      }
    };

    window.$.isMoney = function (e, str) {
      var result = false;
      var regexAmount = /[0-9.]/;
      if (regexAmount.test(String.fromCharCode(e.keyCode))) {
        var currText = str + String.fromCharCode(e.keyCode);
        var regex = /^([1-9]{0,9})([0-9]{0,9})(\.{0,1})[0-9]{0,3}$/;
        var isValid = regex.test(currText) && currText.length < 15;
        result = isValid;
      }
      return result;
    };

    window.$.jsonEscape = function (str) {
      return str.replace(/\n/g, "\\\\n").replace(/\r/g, "\\\\r").replace(/\t/g, "\\\\t");
    };
  }
//  function validate_money(e) {
//    console.log('asd');
//    if (!isMoney(e, $(this).val())) {
//      $("#err_money").html("Please input figures of money. Only a single period(.) is allowed.").show();
//      $("#err_money").delay(2000).fadeOut();
//      return false;
//    }
//  }
//
//  $(".money_only").keypress(validate_money);
//  $(".money_only").focusout(function () {
//    $(this).val($.toMoney($(this).val()));
//  }).focusin(function () {
//    $(this).val($.removeCommas($(this).val()));
//  });

  $(".text_number_only").on('keyup', function (e) {
    var val = $(this).val();
    if (val.match(/[^a-zA-Z0-9]/g)) {
      $(this).val(val.replace(/[^a-zA-Z0-9]/g, ''));
    }
  });

  $(".text_only").on('keyup', function (e) {
    var val = $(this).val();
    if (val.match(/[^a-zA-Z\u00f1\u00d1. ]/g)) {
      $(this).val(val.replace(/[^a-zA-Z\u00f1\u00d1. ]/g, ''));
    }
  });

  $(".number_only").on('keyup', function (e) {
    var val = $(this).val();
    if (val.match(/[^0-9]/g)) {
      $(this).val(val.replace(/[^0-9]/g, ''));
    }
  });


  $(".number_dash_only").on('keyup', function (e) {
    var val = $(this).val();
    if (val.match(/[^0-9-]/g)) {
      $(this).val(val.replace(/[^0-9-]/g, ''));
    }
  });


  $(window).resize(function () {
    $(".sweet-alert").css("margin-top", -$(".sweet-alert").outerHeight() / 2);
  });

  $("[href]").each(function () {
    if (this.href === window.location.href) {
      $(this).addClass("active");
    }
  });

  $('#main_navbar_toggler').click(function () {
    $('#main_navbar').collapse('toggle');
  });

  $('#main_navbar').on('show.bs.collapse', function () {
    $('.padlab_title').addClass('mt-3');
  }).on('hidden.bs.collapse', function () {
    $('.padlab_title').removeClass('mt-3');
  });

});
