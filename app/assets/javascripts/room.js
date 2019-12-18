$(function() {
    $('#new_room_message').on('ajax:success', function(a, b,c ) {
      $(this).find('input[type="text"]').val('');
      document.getElementById("room_message_message").value="";
    });
  });