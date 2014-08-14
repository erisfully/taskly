//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui

$(document).ready(function() {


var button = $('button');

  button.on('click', function(){
    var button = $(this);
    var ul = button.parents('.task-list').find('ul');
    ul.toggle();

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
});




