//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui

$(document).ready(function() {


var button = $('button');

  button.on('click', function(){
    var button = $(this);
    var ul = button.parents('.task-list').find('ul');
    ul.slideToggle();
    $('.task-list').find('ul').not(ul).slideUp();
    var hideButton = $('button').not(button);
    hideButton.text('Show');
    hideButton.removeClass('open');


    if(button.hasClass('open') ){
      button.text('Show');
      button.removeClass('open');
    }
    else {
      button.text('Hide');
      button.addClass('open');
    }
  });

  var notice = $('.notice');
  var noticeButton = $('.notice-button');
   notice.fadeOut(5000);
   noticeButton.on('click', function(){
   notice.remove();
  });

  $("#task_date").datepicker({dateFormat: "yy-m-d"});

  var todaysDate = $('.tasks').data('today');
  $('.tasks').each(function(){
    var dueDate = $(this).data('time');
    if (dueDate == todaysDate) {
      $(this).addClass('due-today');
    }
    if (dueDate < todaysDate) {
      $(this).addClass('past-due');
    }
  });


//    $('.task-list h1').jMagnify();



//  keep stuff open by adding animations on click for delete and complete
});




