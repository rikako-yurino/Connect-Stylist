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
        const currentUser = $('#messages').data('current_user');
        const messageId = data['message_id'];
        const userId = data['user_id'];
        const stylistId = data['stylist_id'];
        $('#messages').append(data['message']);
        const message = $('#messages').find('#message-' + messageId + '');
        const messageSend =  $('.message').find('.message-send');
        const messageLeft =  $('.message').find('.message-left');
        const messageFrame = $('.message').find('.message-frame');
        if (currentUser == 'user'){ //見ているのがuserであれば
          if (userId == null){ //stylistからのメッセージ
            messageLeft.addClass('justify-content-start');
            messageFrame.addClass('msg_container');
            $('.time').addClass('msg_time');
          } else if (stylistId == null) { //userのメッセージ
            messageSend.addClass('justify-content-end');
            messageFrame.addClass('msg_container_send');
            $('.time').addClass('msg_time_send');
          }
        } else { //見ているのがstylistであれば
          if (userId == null){ //stylistのメッセージ
            messageSend.addClass('justify-content-end');
            messageFrame.addClass('msg_container_send');
            $('.time').addClass('msg_time_send');
          } else if (stylistId == null) { //userからのメッセージ
            messageLeft.addClass('justify-content-start');
            messageFrame.addClass('msg_container');
            $('.time').addClass('msg_time');
          }
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
