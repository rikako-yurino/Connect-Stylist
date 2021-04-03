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
        return $('#messages').append(data['message']);
        // const messages = document.getElementById('messages');
        // messages.insertAdjacentHTML('beforeend', data['message']);
        },
    
      speak: function(message) {
        // return this.perform('speak', {message: message});
        return $(this).perform('speak', {message: message});
      }
    });
  window.document.onkeydown = function(e) {
      if (e.key === 'Enter') {
        appRoom.speak(e.target.value);
        e.target.value = '';
        e.preventDefault();
      };
    }
  });
}); 