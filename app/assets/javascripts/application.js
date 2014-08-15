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

  $( "#task_date" ).datepicker({dateFormat: "yy-mm-dd"});


//  keep shit open by adding animations on click for delete and complete
});




