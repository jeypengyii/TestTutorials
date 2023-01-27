


<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<style  nonce="EpnMLrQ37L">


  .morris-hover{
    position:absolute;z-index:1000
  }
  .morris-hover.morris-default-style
  {
    border-radius:10px;
    padding:6px;color:#666;
    background:rgba(255,255,255,0.8);
    border:solid 2px rgba(230,230,230,0.8);
    font-family:sans-serif;
    font-size:12px;
    text-align:center
  }
  .morris-hover.morris-default-style .morris-hover-row-label{
    font-weight:bold;margin:0.25em 0
  }
  .morris-hover.morris-default-style .morris-hover-point{
    white-space:nowrap;margin:0.1em 0
  }

  #logo{

    width:400px; 
    display: block;
    margin-left: auto;
    margin-right: auto;
    width:110%;  
  }
  .bg {
    /* The image used */


    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
  .test {
    padding-top: 500px;
    padding-bottom: 150px;
    padding-left: 50px;
  }

  .menu-title {
    margin-top: 20px;
    margin-bottom: 0rem !important;
    padding: 12px 20px !important;
    letter-spacing: 1px;
    font-size: 11px;
    font-weight: bolder;
    list-style: none;
    text-transform: uppercase;
    color: #013157;
    background: #f0f8ff7d;
    text-align: center;
  }
  .forlogo {
    padding-top: 1px;
  }
  .abcs{
    color:black;
    text-align: center;
    font-size: 30px;
  }
  .gma{
    text-align: center;
    padding-top: 5px;
    font-size: 20px;
  }
  .tv5{
    text-align: center;  
    font-size: 15px;
  }  

  .navbar-custom {
    background-color: #C58940;
    border-radius: 0;
    margin-bottom: 0;
    padding: 0 10px 0 0;
    -webkit-box-shadow: 0 5px 5px -3px rgba(0, 0, 0, 0.15);
    box-shadow: 0 5px 5px -3px rgba(0, 0, 0, 0.15);
    margin-left: 240px;
    min-height: 60px;
  }
  .button-menu-mobile {
    border: none;
    color: #ffffff;
    display: inline-block;
    height: 60px;
    width: 60px;
    background-color: #C58940;
    font-size: 24px;
  }
  .bg-primary123 {
    color: #f16c69;

  }
  .logut{
    padding-left: 500px;
  }
  #sidebar-menu > ul > li > a {
    color: #70767b;
    display: block;
    padding: 12px 22px;
    font-size: 15px;
    position: relative;
    -webkit-transition: all 0.5s;
    transition: all 0.5s;
  }
  .qwe{
    font-size: 15px;
  }
  #sidebar-menu li {
    margin-bottom:0.5em;
  }
  .enlarged .slimscroll-menu {
    overflow: hidden !important;
  }
  .fa {
    font-size:20px;
  }
  .i_welcome {
    font-size:50px;
  }
  .fs-20px{
    font-size:20px!important;
  }
</style>


<div id="wrapper">
  <div class="topbar">
    <!-- LOGO -->

    <div class="topbar-left center forlogo">
      <a href="${pageContext.request.contextPath}/Homepage" class="logo">
        <span>
          <img src="${pageContext.request.contextPath}/resources/images/logo-light.png" height="65" alt="logo" class="m5">
        </span>
        <i>
          <img src="${pageContext.request.contextPath}/resources/images/logo-light.png" height="20" alt="logo" class=" forlogo">
        </i>
      </a>

    </div>
    <nav class="navbar-custom">

      <ul class="list-inline menu-left mb-0">
        <li class="float-left">
          <button class="button-menu-mobile open-left">
            <span class="fa fa-bars"></span>
          </button>
        </li>                        
      </ul>
    </nav>

  </div>

  <!-- Top Bar End -->

  <!-- ========== Left Sidebar Start ========== -->
  <div class="left side-menu">
    <div class="slimscroll-menu" id="remove-scroll">

      <!--- Sidemenu -->
      <div id="sidebar-menu">
        <!-- Left Menu Start -->

        <ul class="metismenu" id="side-menu">

          <li>
            <hr class="mb-1">
            <a href="${pageContext.request.contextPath}/Homepage" class=" p-0">
              <div class="card bg-primary123 mini-stat position-relative mb-0">
                <i class="i_welcome"></i> <span class="abcs"> Welcome!</span>
                <span class="gma">${sessionScope.sess_first_name} ${sessionScope.sess_last_name}</span>
                <span class="tv5">${sessionScope.sess_company_name}</span>
                <span class="tv5" id="txt"></span>
              </div>
            </a>
            <hr>
          </li>

          <li class="menu-title">Main</li>

          <li>
<!--            <a href="${pageContext.request.contextPath}/Homepage" class="">
              <i class="fa fa-home"></i><span>Homepage </span>
            </a>
          </li>-->

          <li>
            <a href="${pageContext.request.contextPath}/Viewmovie" class="">
              <i class="fa fa-home"></i><span>View Movie </span>
            </a>
          </li>

          <li>
            <a href="${pageContext.request.contextPath}/Addmovie" class="">
              <i class="fa fa-home"></i><span>Add Movie </span>
            </a>
          </li>                   

          <li>
            <a href="${pageContext.request.contextPath}/Searchmovie" class="">
              <i class="fa fa-home"></i><span>Search Movie </span>
            </a>
          </li>          



          <!--          <li>
                      <a href="${pageContext.request.contextPath}/Test" class="">
                        <i class="fa fa-home"></i><span>Test</span>
                      </a>
                    </li>-->


          <!--          <li class="menu-title">MISCELLANEOUS</li>
          
                    <li>
                      <a href="javascript:void(0);" class=""><i class="fa fa-user-circle"></i> <span>User<span class="float-right menu-arrow"><i class="fa fa-plus"></i></span></span> </a>
                      <ul class="submenu qwe">
                        <li><a href="${pageContext.request.contextPath}/ChangePassword">Change Password</a></li>
                      </ul>
                    </li>
          
                    <li>
                      <a id="btnConfirmLogout" href="#">
                        <i class="fa fa-sign-out" id="btnConfirm"></i><span>Logout</span>
                      </a>  
                    </li>-->

        </ul>
      </div>
      <div class="clearfix"></div>
      <!-- Sidebar -->
    </div>
  </div>
</div>


<!--<script>

  document.getElementById('btnConfirmLogout').onclick = function () {
    swal({
      title: "Are you sure you want to log-out?",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: 'Yes',
      closeOnConfirm: false
    }, function () {
      window.location.replace('${pageContext.request.contextPath}/logout?type=softLogout');
      return false;
    });
  };

</script>-->
