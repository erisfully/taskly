//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {


var button = $('button');

  button.on('click', function(){
    var button = $(this);
    var ul = button.parents('.task-list').find('ul');
    ul.toggle();

    if( button.hasClass('open') ){
      button.text('Show');
      button.removeClass('open');
    }
    else {
      button.text('Hide');
      button.addClass('open');
    }
  });

  var notice = $('.notice');

    notice.fadeOut(5000);
    button = $("<button>X</button>");
    notice.append(button);
    button.on('click', function(){
    notice.hide()
  });

});




