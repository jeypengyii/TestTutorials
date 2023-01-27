<%-- 
    Document   : error-404
    Created on : 11 25, 21, 5:12:45 PM
    Author     : Christian Cornejo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*,java.text.*" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Tutorials | Error Page</title>

    <!-- plugins:css -->
    <link rel="stylesheet" href="<c:url value="/resources/template/vendors/feather/feather.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/template/vendors/ti-icons/css/themify-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/template/vendors/css/vendor.bundle.base.css"/>" type="text/css">
    <!-- endinject -->

    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->

    <!-- inject:css -->
    <link rel="stylesheet" href="<c:url value="/resources/template/css/vertical-layout-light/style.css"/>" type="text/css">
    <!-- endinject -->
    <link rel="shortcut icon" href="<c:url value="/resources/template/images/favicon.png"/>"/>
    <style  nonce="EpnMLrQ37L">
      html, body {
        height:100%;
      }
      .error-page h1 {
        font-size: 8rem;
      }
      .mh-0 {
        min-height: 0;
      }
      .bg-custom {
        background-color: #f16c69!important;
      }
    </style>
  </head>

  <body>
    <div class="container-fluid p-0 m-0 h-100 w-100 overflow-hidden">
      <div class="container-fluid page-body-wrapper full-page-wrapper h-100 mh-0">
        <div class="content-wrapper d-flex align-items-center text-center error-page bg-custom px-0">
          <div class="row flex-grow">
            <div class="col-lg-8 mx-auto text-white">
              <div class="row align-items-center">
                <div class="col-sm-6 text-sm-right pr-lg-4">
                  <h1 class="display-1 mb-0">${errorTitle}</h1>
                </div>
                <div class="col-sm-6 error-page-divider text-lg-left pl-lg-4">
                  <h3>SORRY!</h3>
                  <h4 class="font-weight-light">${errorDesc}</h4>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 text-center mt-xl-2">
                  <a class="text-white font-weight-medium" href="${pageContext.request.contextPath}/Login">Back to home</a>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 mt-xl-2">
                  <p class="text-white font-weight-medium text-center my-0">Copyright &copy; <% out.print((new SimpleDateFormat("yyyy")).format(new Date()).toString());%>.  All rights reserved.</p>
                  <p class="my-0 text-secondary">${errorMsg}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
    </div>
    <!-- page-body-wrapper ends -->

    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}/resources/template/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->

    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->

    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/js/template.js"></script>
    <!-- endinject -->
  </body>

</html>

