import consumer from "./consumer"

// $(document).on('turbolinks:load', function() {
  $(function() {
    const appRoom = consumer.subscriptions.create({ channel:"RoomChannel",room: $('#messages').data('room_id') }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },
    
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
    
      received: function(data) {
        console.log(data);
        const messageId = data['message_id'];
        const userId = data['user_id'];
        const stylistId = data['stylist_id'];
        $('#messages').append(data['message']);
        const message = $('#messages').find('#message-' + messageId + '')
          if (userId != null){
            $('.justify-content-end').children('.div').addClass('msg_container_send');
            $('#time').addClass('msg_time_send');
          } else if (stylistId != null) {
            $('.justify-content-end').children('msg_container_send');
            $('#time').addClass('msg_time_send');
          }
          if (userId == null) {
            $('.justify-content-end').children('msg_container');
            $('#time').addClass('msg_time');
          } else if (stylistId == null) {
            $('.justify-content-end').children('msg_container');
            $('#time').addClass('msg_time');
          }
        },

      speak: function(message) {
        return this.perform('speak', {message: message});
      },
      
    });
    $(document).on('click', '#send-button', function(e) {
      // console.log('発火');
      const input = $('#input').val();
      appRoom.speak(input);
      $('#input').val('')
      e.preventDefault();
      $('#input').animate({ scrollTop: $('#input')[0].scrollHeight});
      return false
    });
    
  });

// }); 
