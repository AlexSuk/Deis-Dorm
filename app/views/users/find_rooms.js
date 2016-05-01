$('#room_results').html("<%= escape_javascript (render(partial: 'room_results')) %>");
document.getElementById('room_results').scrollIntoView();