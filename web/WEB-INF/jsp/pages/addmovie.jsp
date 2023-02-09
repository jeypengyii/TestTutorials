<!doctype html>
<html lang="en">
  <%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


  <style>
    legend{
      text-align:center;
      color:black;
    }
    #card{
      background-color:#E5BA73;
    }
    #btn_confirm{
      background-color: #C58940;
      width:100%;
      margin-top:10px;
    }


  </style>


  <div class="account-pages"> </div>
  <div class="content-page ">
    <div class="content">
      <div class="container-fluid pt-4">
        <div class="card mb-5 border">

          <div id="card" class="card-body">
            <legend class="cust-legend">Add New Movie</legend>
            <input type="hidden" id="context" value="${pageContext.request.contextPath}" disabled="true"></input>
            <%--<form:form action="${pageContext.request.contextPath}/Addmovie/save" method="POST">--%>
            <form:form id="form_movie"  method="POST">
              <div class="mb-3">
                <label for="genre">Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <input path="movie_title"  type="text" class="form-control" id="movie_title" placeholder="Enter title" maxlength="2055">
              </div>
              <div class="mb-3">
                <label for="genre">Genre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <input path="genre" type="text" class="form-control" id="genre" maxlength="2055" placeholder="Enter genre">
              </div>
              <div class="mb-3">
                <label for="monthreleased">Date Released:</label> 
                <input type="date" class="form-control"  id="released_date" name="lastname"><br /><br />      
              </div>
            </form:form>
            <button type="button" id ="btn_confirm" class="btn btn-primary rounded-4 me-2">Save</button> 
          </div>

        </div>
      </div>
    </div>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->

  <script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/resources/modules/movies.js"></script>

  <!--//  $(function () {
  //    $("[data-toggle=tooltip").tooltip();
  //  });-->




