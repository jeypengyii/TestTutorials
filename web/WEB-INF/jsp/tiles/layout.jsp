<%-- 
    Document   : layout
    Created on : 
    Author     : Keith
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
  <head> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/required/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/required/css/font-awesome.min.css"/>

    <!-- FOR THE DATE TIME PICKER -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-material-datetimepicker.css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/required/css/select2.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.bootstrap-touchspin.min.css"> 

    <!-- FOR THE ALERT -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sweet-alert.css"/>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metismenu.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/required/css/jquery-ui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/required/css/bootstrap-datetimepicker.css"/>


    <!-- DATA TABLES -->

<!--    <link rel="stylesheet" href="<c:url value="/resources/template/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/template/js/select.dataTables.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/template/vendors/sweetalert2/sweetalert2.min.css"/>" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/vendors/calendar/calendar-main.css" type="text/css">-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buttons.bootstrap4.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.bootstrap4.min.css"/>


    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="${pageContext.request.contextPath}/resources/template/required/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/required/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/base.js"></script>


    <title><tiles:insertAttribute name="title" ignore="true" /></title>  
  </head>

  <body> 
    <input type="hidden" id="context" value="${pageContext.request.contextPath}">
    <small class="build_style">BUILD#1</small>

    <header><tiles:insertAttribute name="header"/></header>
    <div><tiles:insertAttribute name="menu" /></div>
    <div id="overlay"></div>

    <section id="mainBody"><tiles:insertAttribute name="body"/></section>            

  </body>

  <div class="modal" id="global_modal_wait" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modal_wait" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title w-100 text-center" id="modal_wait_title">Please wait...</h4>
        </div>
        <div class="modal-body center-block">
          <h5 class="w-100 text-center text-muted" id="global_modal_msg">Loading...</h5> 
          <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <!-- MAIN JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>   

    <!-- FOR THE DATA TABLE-->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buttons.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jszip.min.js"></script>


    <script src="${pageContext.request.contextPath}/resources/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buttons.colVis.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/responsive.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables.init.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/required/js/jquery.maskedinput.js"></script>

    <!-- FOR THE ALERT-->
    <script src="${pageContext.request.contextPath}/resources/js/sweet-alert.min.js"></script>

    <!-- FOR THE DATE TIME PICKER-->
    <script src="${pageContext.request.contextPath}/resources/template/required/js/moment-with-locales.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/required/js/bootstrap-datetimepicker.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/template/required/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/required/js/popper.js"></script>


  </footer>
</html>  
