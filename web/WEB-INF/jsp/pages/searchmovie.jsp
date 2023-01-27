<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
  <style type="text/css">
    label{
      width:120px;
      display:inline-block;
      margin: 4px;
    }
    form{
      border-radius: 10px;
      background-color: #FAEAB1;
      color:white;

      padding: 10px;
    }
    legend{
      text-align:center;
      color:black;
    }
    #btn_confirm{
      background-color: #C58940;
      width:100%;
      margin-top:10px;
    }
    label{
      color:black;
    }
    #form{
      background-color: #FAEAB1;
    }
    body{
      background-color: #FAF8F1;
    }
    #ORSTable{
      background-color:#E5BA73;
    }
    thead{
      background-color: #E5BA73;
    }
    #card1{
      background-color: #FAEAB1;
    }

  </style>
</head>
<div class="account-pages"> </div>
<div id="content1" class="content-page ">
  <div class="content">
    <div class="container-fluid pt-4">
      <div class="card mb-5 border">

        <div id="form">
          <div class="card-body">
            <form:form action="${pageContext.request.contextPath}/linkDescList" method="POST"> 
              <legend class="cust-legend">Search Movie</legend>

              <label for="genre">Title:</label>
              <form:input type="text" placeholder="Title " path="movie_title" name="title"/><br /><br />

              <label for="genre">Release Date:</label>
              <form:input type="date" placeholder="Release Date " path="release_date" name="release_date"/><br /><br />

              <button type="submit" id ="btn_confirm" class="btn btn-primary rounded-4 me-2">Search</button> 
            </form:form>
          </div>
        </div>

        <center>
          <div id="card1" class="card">
            <div id="card2" class="card-body">
              <div id="card3" class="table-responsive">
                <table id="ORSTable" class="table table-striped table-hover dt-responsive nowrap w-100 border ">
                  <thead>
                    <tr>
                      <th class=" text-center">Id</th>
                      <th class=" text-center">Title</th>
                      <th class=" text-center">Release Date</th>
                      <th class=" text-center">Genre</th>
                      <!--                        <th style="width: 122px;" class=" text-center">Action</th>-->
                    </tr>
                  </thead>

                  <tbody>

                    <c:forEach var="item" items="${list}">

                      <tr>
                        <td class=" text-center">${item.id}</td>
                        <td class=" text-center">${item.movie_title}</td>
                        <td class=" text-center">${item.release_date}</td>
                        <td class=" text-center">${item.genre}</td>
                        <td class=" text-center">
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


