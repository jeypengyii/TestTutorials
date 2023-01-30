<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

  <head>
    <style>
      body{
        background-color: #FAF8F1;
      }
      ORSTable{
        background-color: #FAEAB1;
      }
      thead{
        background-color: black;
      }
      tr{
        background-color: #FAEAB1;
      }
      #button_edit{
        background-color: #C58940;
      }
      #button_delete{
        background-color: #C58940;
      }
      #table1{
        background-color: #E5BA73;
      }
      #update{
        background-color: #C58940;
      }
      #close{
        background-color: #C58940;
      }
      #btn_confirm{
        background-color: #C58940;
        width:100%;
        margin-top:10px;
        margin-bottom:20px;
      }
    </style>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Movies</title>
    <link rel="stylesheet" href=""https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css"<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>>

<div class="account-pages"> </div>
<div class="content-page ">
  <div class="content">
    <div class="container-fluid pt-4">
      <div class="card mb-5 border">

        <center>

          <div id=table1 class="card">
            <div class="card-body">

              <div class="table-responsive">
                <table id="ORSTable" class="table table-striped table-hover dt-responsive nowrap w-100 border ">
                  <thead>
                    <tr>
                      <th class=" text-center">Id</th>
                      <th class=" text-center">Title</th>
                      <th class=" text-center">Release Date</th>
                      <th class=" text-center">Genre</th>

                      <th style="width: 122px;" class=" text-center">Action</th>
                    </tr>
                  </thead>

                  <tbody>

                  <a id ="btn_confirm" class="btn btn-primary rounded-4 me-2" href="${pageContext.request.contextPath}/Addmovie">Add Movie</a>


                  <c:forEach var="item" items="${list}">
                    <tr>
                      <td class=" text-center">${item.id}</td>
                      <td class=" text-center">${item.movie_title}</td>
                      <td class=" text-center">${item.release_date}</td>
                      <td class=" text-center">${item.genre}</td>
                      <td class=" text-center">
                        <a href="#" data-toggle="modal" data-target="#editFlightModal" id ="button_edit" class="btn btn-primary btn_edit" data-id="${item.id}" data-test="${item.movie_title}" data-test1="${item.genre}" data-test2="${item.release_date}">EDIT</a> |
                        <a href="./Deletemovie/${item.id}" id ="button_delete" class="btn btn-primary btn_update" data-id="${item.id}">DELETE</a>
                      </td>
                    </tr>

                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </center>

      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="editFlightModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editFlightModalTitle">Edit Movie</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form action="${pageContext.request.contextPath}/Updatemovie" method="POST">
        <input type="hidden" name="id" id="id">
        <!--        <input type="text" name="movie_title" id="movieTitle">
                <input type="text" name="genre" id="genre">
                <input type="text" name="release_date" id="releaseDate">-->

        <div class="modal-body pb-2">
          <div class="form-group row">
            <label class="col-sm-4 col-form-label">Movie Title: </label> 
            <div class="col-sm-8">
              <input type="text" name="movie_title" id="movieTitle1" class="form-control" />
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-4 col-form-label">Genre: </label> 
            <div class="col-sm-8">
              <input type="text" name="genre" id="genre1" class="form-control" />
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-4 col-form-label">Release Date: </label> 
            <div class="col-sm-8">
              <input type="date" name="release_date" id="releaseDate1" class="form-control"/>         
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center align-items-center">
          <button type="submit" id="update" class="btn btn-primary">Update</button>
          <button type="button" id="close1" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        </div>
      </form:form>
    </div>
  </div>
</div>


<script>

//  console.log("tteste");
//  $(".btn_delete").off("click");
//  $(".btn_delete").on("click", function () {
//    var pid = $(this).data("id");
//    $("#primary_id").val(pid);
//    console.log(">>>: ", $(this).data("id"));
//  });
//  $(".btn_update").off("click");
//  $(".btn_update").on("click", function () {
//    var pid = $(this).attr("data-id");
//    $("#primary_id").val(pid);
//    console.log(">>>: ", $(this).data("id"));
//    console.log("pid", pid)
//      $('#ORSTable').DataTable();

  var DT_importer = $('#ORSTable').DataTable({
    columnDefs: [
      {
        orderable: false,
        className: "d-none"

      }
    ],
    fnDrawCallback: function () {

      $('.btn_edit').off('click');
      $('.btn_edit').click(function () { // edit click event

        var id = $(this).data()['id'];
        var test = $(this).data('test');
        var test1 = $(this).data('test1');
        var test2 = $(this).data('test2');


        console.log(id)
        console.log(test)
        console.log(test1)
        console.log(test2)


        $("#id").val(id);
        $("#movieTitle1").val(test);
        $("#genre1").val(test1);
        $("#releaseDate1").val(test2);
        console.log("id", id);

      });
    }
  });
//
//  fnDrawCallback: function () {
//
//    /**
//     * VIEW REMARKS
//     */e
//    $('.his-buildup-item-remarks-view').off('click');
//    $('.his-buildup-item-remarks-view').click(function () {
//      showLoader();
//      var remarks = $(this).data()['itemRemarks'];
//      remarksModal(remarks, "Build-up Remarks");
//    });
//
//  }
//  ,

</script>