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
        const messageFrame = $('.message').find('.message-frame');
        if (currentUser == 'user'){ //見ているのがuserであれば
          if (userId == null){ //stylistからのメッセージ
            console.log('userがスタイリストのメッセージを見てる')
            messageSend.addClass('justify-content-start');
            messageFrame.addClass('msg_container');
            $('.time').addClass('msg_time');
            // $('.img_cont_msg').children('image_tag').attr('src', '../app/assets/images/stylist_photo01.jpg');
          } else if (stylistId == null) { //userのメッセージ
            console.log('userが自分のメッセージを見てる')
            messageSend.addClass('justify-content-end');
            messageFrame.addClass('msg_container_send');
            $('.time').addClass('msg_time_send');
            // $('.img_cont_msg').children('image_tag').attr('src', '../app/assets/images/user_photo01.jpg');
          }
        } else { //見ているのがstylistであれば
          if (userId == null){ //stylistのメッセージ
            console.log('スタイリストが自分のメッセージを見てる')
            messageSend.addClass('justify-content-end');
            messageFrame.addClass('msg_container_send');
            $('.time').addClass('msg_time_send');
            // $('.img_cont_msg').children('image_tag').attr('src', '../app/assets/images/user_photo01.jpg');
          } else if (stylistId == null) { //userからのメッセージ
            console.log('スタイリストがuserのメッセージを見てる')
            messageSend.addClass('justify-content-start');
            messageFrame.addClass('msg_container');
            $('.time').addClass('msg_time');
            // $('.img_cont_msg').children('image_tag').attr('src', '../app/assets/images/stylist_photo01.jpg');
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
