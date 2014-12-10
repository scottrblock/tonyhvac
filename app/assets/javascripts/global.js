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
    var default_view = $(window).width() < 514 ? 'basicDay' : 'month'

    $('#calendar').fullCalendar({
      events: jobs_url,
      defaultView: default_view,
      windowResize: function(view) {
              if ($(window).width() < 514){
                  $cal.fullCalendar( 'changeView', 'basicDay' );
              } else {
                  $cal.fullCalendar( 'changeView', 'month' );
              }
      },

      eventAfterAllRender: function(view){
        console.log(view);
        window.view = view;

        if ( view.dayNumbersVisible === false && view.getSegs().length === 0 ){
          $('.fc-widget-content').last().append('<div class="alert alert-success">You have no scheduled jobs!</div>');
        }

      }
    });
  }

  var $item_price = $('#item_price');
  if($item_price.length > 0){
    $item_price.attr('step', '.01')
  }

  var $job_cost = $('#job_price');
  if($job_cost.length > 0){
    $job_cost.attr('step', '.01')
  }

  var $item_detail_form = $('#new_item_detail')
  if ($item_detail_form.length > 0){
    $('#add-item-detail').click(function(){
      $item_detail_form.slideToggle('fast');
      return false;
    }); 
  }

  $('.job_price, .item_price').each(function(){
    $('.controls', $(this)).removeClass('controls').addClass('input-group').prepend('<div class="input-group-addon">$</div>');
  });

  $send_invoice = $('#send-invoice-btn');
  if ($send_invoice.length > 0) {
    $send_invoice.click(function(){
      $('.send-invoice-wrap .edit_job').slideToggle('fast');
      return false;
    })
  }


});







