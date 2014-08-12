//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {


  var button = $('button')
    $(button).click(function() {
      $(this).parent('.task-list').find('.tasks').toggleClass('show')
  });



});