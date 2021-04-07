import consumer from "./consumer"

$(document).on('turbolinks:load', function() {
  $(function() {
    const appRoom = consumer.subscriptions.create({ channel:"RoomChannel",room: $('#messages').data('room_id') }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },
    
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
    
      received: function(data) {
        $('#messages').append(data['message']);
        if ($('#messages').data('user_id').length) {
          $('#messages').children('.div').addClass('justify-content-end')
          $('#messages').find('#my-photo').addClass('.rounded-circle')
          $('#messages').find('#my-message').addClass('.message')
          $('#messages').find('#my-time').addClass('.msg_time_send')
        } 
        else if ($('#messages').data('stylist_id').length) {
          $('#messages').children('.div').addClass('justify-content-start')
          $('#messages').find('#my-photo').addClass('.rounded-circle')
          $('#messages').find('#my-message').addClass('.message')
          $('#messages').find('#my-time').addClass('.msg_time_send')
        }
      },

      speak: function(message) {
        return this.perform('speak', {message: message});
      }
    });
    $(document).on('click', '#send', function() {
        // console.log(e);
        const input = document.getElementById('input')
        const content = input.value
        appRoom.speak(content);
        e.target.value = '';
        e.preventDefault();
      });
    }
  );
}); 