function promote_user(event) {
  event.preventDefault();
  var button = $(this);
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
    $(button).removeClass('btn-success btn-p').addClass('btn-primary btn-d').html('Demote');
    $(button).parent().next().html('admin');
  });
}

function demote_user(event) {
  event.preventDefault();
  var button = $(this);
  var tableRow = $(this).parent().parent();

  var userId = tableRow.data('id');

  $.ajax({
    type: "PUT",
    url: "users/" + userId + ".json",
    data: JSON.stringify({
      user: { admin: false }
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    $(button).removeClass('btn-primary btn-d').addClass('btn-success btn-p').html('Promote');
    $(button).parent().next().html('student');
  });
}

$(document).ready(function() {
  $('.btn-p').bind('click', promote_user);
  $('.btn-d').bind('click', demote_user);
})
