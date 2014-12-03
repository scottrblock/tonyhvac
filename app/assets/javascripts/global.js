$(document).ready(function(){
  $('.datetimepicker').datetimepicker({
    pickTime: true,
    sideBySide: true,
    minuteStepping: 15
  });

  $('.timepicker').datetimepicker({
    pickTime: true,
    pickDate: false,
    minuteStepping: 15
  });

  jQuery(".best_in_place").best_in_place();

  $('span.best_in_place').each(function(){
    $(this).append(" <i class='fa fa-edit'></i>");
  });

  var $cal = $('#calendar')
  if($cal.length > 0){
    var contractor_id = $cal.attr('data-contractor-id');
    var jobs_url = '/contractors/' + contractor_id + '/jobs.json';
    $('#calendar').fullCalendar({
      events: jobs_url
    });
  }


})