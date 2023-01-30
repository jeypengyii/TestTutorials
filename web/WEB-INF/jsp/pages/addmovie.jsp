<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 

<!doctype html>
<html lang="en">
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


            <!--            path papalitan ng id 
                        movie title gagawing id
                        un ung tatawagin sa javascript
            -->


            <form onsubmit=ajaxCall();>
              Enter the values <input type="text" value="text"><br>
              <input type="submit" value="Submit">

              <div class="mb-3">
                <label for="genre" class="mr-4">Title:</label>

                <input type="text"  name="movie_title" id="movie_title" class="form-control alphanumericwithbasicfunc" onkeyup="this.value = this.value.toUpperCase();"/>
              </div>
              <div class="mb-3">
                <label for="genre" class="mr-4">Genre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>

                <input type="text"  name="genre" id="genre" class="form-control alphanumericwithbasicfunc" onkeyup="this.value = this.value.toUpperCase();"/>
              </div>
              <div class="mb-3">
                <label for="monthreleased" class="mr-4">Date Released:</label> 

                <input type="date" name="release_date" id="release_date" class="form-control alphanumericwithbasicfunc" onkeyup="this.value = this.value.toUpperCase();"/>
              </div>
              <button type="submit" id ="btn_confirm" class="btn btn-primary rounded-4 me-2">Save</button> 
            </form>


            <!--            <div class="form-group row mb-3">
                          <label class="col-sm-3 offset-sm-1 col-form-label BookNowLabel">Title:</label> 
                          <div class="col-sm-7">
                            <input type="text"  name="title" id="title" class="form-control alphanumericwithbasicfunc" onkeyup="this.value = this.value.toUpperCase();"/>
                          </div>
                        </div>
            
                        <div class="form-group row mb-3">
                          <label class="col-sm-3 offset-sm-1 col-form-label BookNowLabel">Genre:</label> 
                          <div class="col-sm-7">
                            <input type="text"  name="genre" id="genre" class="form-control alphanumericwithbasicfunc" onkeyup="this.value = this.value.toUpperCase();"/>
                          </div>
                        </div>
            
                        <div class="form-group row mb-3">
                          <label class="col-sm-3 offset-sm-1 col-form-label BookNowLabel">Date Released:</label> 
                          <div class="col-sm-7">
                            <input type="date" name="datereleased" id="datereleased" class="form-control alphanumericwithbasicfunc" onkeyup="this.value = this.value.toUpperCase();"/>
                          </div>
                        </div>
                          <div class="justify-content-center">
                            <button type="button"  class="btn btn-warning add_fields_edit">Add</button>
                          </div>-->


          </div>

        </div>
      </div>
    </div>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <!--//  $(function () {
  //    $("[data-toggle=tooltip").tooltip();
  //  });-->

  <script>
                  function() {
                    $.ajax({

                      url:
                              'https://jsonplaceholder.typicodecom/todos/1',

                      type: POST,

                      success: function (data) {
                        var x = JSON.stringify(data);
                        console.log(x);
                      },

//error handling

                      error: function (error) {
                        console.log('Error ${error}`);
                      }
                    });
                  }

  </script>

