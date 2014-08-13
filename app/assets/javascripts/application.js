//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {


  var button = $('button');
  var tasks = $('.tasks');
    $(button).click(function() {
      (tasks).removeClass('show');
      $(this).parent('.task-list').find('.tasks').toggleClass('show');


    });




});