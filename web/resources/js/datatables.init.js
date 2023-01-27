/*
 Template Name: Agroxa - Responsive Bootstrap 4 Admin Dashboard
 Author: Themesbrand
 File: Datatable js
 */

$(document).ready(function () {
  $('#datatable').DataTable();

  //Buttons examples
  var table = $('#datatable-buttons').DataTable({
    columnDefs: [{
        targets: '_all',
        defaultContent: ""
      }],
    lengthChange: false,
    buttons: ['copy', 'excel',
      {
        extend: 'pdfHtml5',
        orientation: 'landscape',
        pageSize: 'LEGAL'
      }, 'colvis'
    ]
  });

  table.buttons().container()
          .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');

  var table = $('#datatable-buttons-excel').DataTable({
    lengthChange: false,
    buttons: ['copy', 'excel', 'pdf']
  });

  table.buttons().container()
          .appendTo('#datatable-buttons-excel_wrapper .col-md-6:eq(0)');
});