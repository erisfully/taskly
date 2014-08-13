//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {


var button = $('button');
  button.on('click', function(){
    var button = $(this);
    var ul = button.parents('.task-list').find('ul');
    ul.toggle();

    $('button').click(function () {
      $(this).html('Close')
    });
  });


});




