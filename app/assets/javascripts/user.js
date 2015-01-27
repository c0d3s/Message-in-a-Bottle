$(document).ready(function(){
  $('.message_sender').click(function(e){
    e.preventDefault();
    $(this).children('div').slideDown(500);
  });

  $('.rate_message').submit(function(e){
    e.preventDefault();
    console.log(this);
    var request = $.ajax({
      url: '/messages',
      method: 'post'
    })
  });
});