<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html lang=""en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 


<main class="content">
    <div class="container-fluid p-0">
        <div class="row page-header py-4 no-gutters">
            <div class="text-center text-sm-left mb-4 mb-sm-0 col-sm-12 col">
                <span class="text-uppercase page-subtitle"> </span>
                <h2 class="page-title">Change Flight</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-12 auto">
                <div class="card">
                    <div class="card-body">
                        <input type="hidden" id="isSplitLoad" value="${is_split_load}">
                        <form:form method="get" name="search_mawb_form" id="form_searchMAWB" >
                            <div class="mini-stat-desc my-3 color">
                                <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <div class="form-group row">
                                            <label for="mawbNumber" class="col-sm-3 col-form-label">Airway Bill No.</label>
                                            <div class="col-sm-9">
                                                <form:input type="text" path="mawb_no" id="mawbNumber" class="form-control number_dash_only" placeholder="MAWB #" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="flightNumber" class="col-sm-3 col-form-label">Flight No.</label>
                                            <div class="col-sm-9">
                                                <form:input type="text" path="flight_no" id="flight_number" class="form-control text_number_only"  maxlength="50"/>
                                            </div>
                                        </div>
                                            <div class="form-group row">
                                            <label for="flightDate" class="col-sm-3 col-form-label">Flight Date</label>
                                            <div class="col-sm-9">
                                                <form:input type="date" path="flight_date" id="flight_date" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="status" class="col-sm-3 col-form-label">Status</label>
                                            <div class="col-sm-9">
                                                <form:select path="flight_status_id" id="flight_status_id" class="form-control select2">
                                                    <form:option value="0" selected="true">Select Status</form:option>
                                                    ${flight_status}
                                                </form:select>
                                            </div>
                                        </div>
                                        <!--ACTIONS-->                            
                                        <div class="col-md-6 mx-auto text-center">
                                            <button class="btn btn-m btn-warning"  id="btnSearch" type="submit">Search</button>              
                                            <button class="btn btn-m btn-outline-secondary"  id="btnClear" type="button">Clear</button> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                        <div class="table-responsive">
                            <table id="changeflight-tbl" class="table table-striped table-bordered nowrap w-100">
                                <thead>
                                    <tr>
                                        <th class="text-center">Operation</th>
                                        <th>MAWB #</th>
                                        <th>Flight No.</th>
                                        <th>Flight Date</th>
                                        <c:if test="${is_split_load == 'true'}">
                                            <th>Screened Pieces</th>
                                            <th>Loaded Pieces</th>
                                            <th>Remaining Pieces</th>
                                        </c:if>
                                        <th>Status</th>
                                        <th class="d-none">Weight</th>
                                        <th class="d-none">Destination</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="flt">
                                        <tr>
                                            <td class="text-center" ><a href="#" class="mawb-item--edit" data-toggle="modal" data-target="#EditFlightModal" data-booking_id="${flt.booking_id}" data-mawb_id="${flt.mawb_id}" data-mawb_no="${flt.mawb_no}">Change Flight</a> </td>
                                            <td>${flt.mawb_no}</td>
                                            <td>${flt.flight_no}</td>
                                            <td>${flt.flight_date}</td>
                                            <c:if test="${is_split_load == 'true'}">
                                                <td>${flt.screened_pieces}</td>
                                                <td>${flt.loaded_pieces}</td>
                                                <td>${flt.remaining_pieces}</td>
                                            </c:if>
                                            <td>${flt.booking_status}</td>
                                            <td class="d-none">${flt.remaining_weight}</td>
                                            <td class="d-none">${flt.airport_destination}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Modal -->
<div class="modal fade" id="editFlightModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editFlightModalTitle">Edit Flight No. and/or Date</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="POST"  action="#" name="myform" id="form_updateFlight">
                <input type="hidden" name="mawb_id" id="mawbId">
                <input type="hidden" name="airwaybill_no" id="mawbNo">
                <input type="hidden" name="booking_id" id="bookingId">
                <div class="modal-body pb-2">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">MAWB No.</label> 
                        <div class="col-sm-8 my-auto">
                            <span id="spanMawbNo"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Flight No.</label> 
                        <div class="col-sm-8">
                            <input type="text" name="flight_no" id="flightNo" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Flight Date</label> 
                        <div class="col-sm-8">
                            <input type="date" name="flight_date" id="flightDate" class="form-control"/>
                        </div>
                    </div>

                    <c:if test="${is_split_load == 'true'}">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Destination</label> 
                            <div class="col-sm-8 my-auto">
                                <span id="spanAirportDestination"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Remaining Pieces</label> 
                            <div class="col-sm-8 my-auto">
                                <input type="hidden" name="pieces" id="pieces" class="form-control" />
                                <span id="spanPieces"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Weight</label> 
                            <div class="col-sm-8 my-auto">
                                <input type="hidden" name="weight" id="weight" class="form-control" />
                                <span id="spanWeight"></span>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Loaded Pieces</label> 
                            <div class="col-sm-8 my-auto">
                                <span id="spanLoadedPieces"></span>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="modal-footer justify-content-center align-items-center">
                    <button type="submit" id="update" class="btn btn-primary">Update</button>
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                </div>
            </form:form>
        </div>
    </div>
</div>