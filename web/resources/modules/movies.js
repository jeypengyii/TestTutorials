
$(document).ready(function () {

  var title, genre, date_;

  var context_url = $('#context').val();

  $('#btn_confirm').click(function () {

    title = $('#movie_title').val();
    genre = $('#genre').val();
    date_ = $('#released_date').val();

    if (isNullOrEmpty(title)) {
      swal("Title is required", "Please input title", 'error')
    } else if (isNullOrEmpty(genre)) {
      swal("Genre is required", "Please input genre", 'error')
    } else if (isNullOrEmpty(date_)) {
      swal("Release Date is required", "Please input Release Date", 'error')
    } else {
      save(title, genre, date_);
    }

  });


  function save(title, genre, date_) {

    swal({
      title: 'Are you sure?',
      text: "You want to save?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, save it!',
      cancelButtonText: 'No, cancel!',
      confirmButtonClass: 'btn btn-success',
      cancelButtonClass: 'btn btn-danger m-l-10',
      buttonsStyling: false
    }, function () {

      $.ajax({
        url: context_url + "/ajax/movie/save",
        type: "post",
        cache: false,
        dataType: "json",
        data: {
          title_of_the_movie: title,
          genre_of_the_movie: genre,
          released_date: date_
        },

        success: function (res) {
          //alert(res)
          if (res == "1") {
            swal('Sucessfully Saved', 'success', 'success');

          } else {
            swal('Error Saving', 'error', 'error');

          }
        }
      }).complete(function () {
        location.reload();
      });

    });


  }


  function isNullOrEmpty(mod) {
    return (mod === null || mod === "" || mod === 0);
  }



});


