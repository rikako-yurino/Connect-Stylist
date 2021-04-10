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
        $('#messages').append(data['message']);
        if ($('#messages').data('user_id').length) {
          $('#messages').find('.#me').addClass('justify-content-end')
          $('#messages').find('#my-photo').addClass('.rounded-circle')
          $('#messages').find('#my-message').addClass('.message')
          $('#messages').find('#my-time').addClass('.msg_time_send')
        } 
        else if ($('#messages').data('stylist_id').length) {
          $('#messages').find('.#you').addClass('justify-content-start')
          $('#messages').find('#my-photo').addClass('.rounded-circle')
          $('#messages').find('#my-message').addClass('.message')
          $('#messages').find('#my-time').addClass('.msg_time_send')
        }
      },

      speak: function(message) {
        return this.perform('speak', {message: message});
      },
      
    });
    $(document).on('click', '#send-button', function() {
      const input = $('#input').val();
      appRoom.speak(input);
      $('#input').val('')
      e.preventDefault();
      // const messageArea = $('.message-wrapper')
      $('#input').animate({ scrollTop: $('#input')[0].scrollHeight});
      return false
    // window.document.onkeydown = function(e) {
    //   if (e.key === 'Enter') {
    //     appRoom.speak(e.target.value);
    //     e.target.value = '';
    //     e.preventDefault();
    //   };
    // };
    });
    
  });

// }); 
