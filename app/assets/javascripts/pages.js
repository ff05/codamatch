function promote_user(event) {
  event.preventDefault();
  var tableRow = $(this).parent().parent();

  var userId = tableRow.data('id');

  $.ajax({
    type: "PUT",
    url: "users/" + userId + ".json",
    data: JSON.stringify({
      user: { admin: true }
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log(data);
  });
}


$(document).ready(function() {
  $('#btn-p').bind('click', promote_user);
})
