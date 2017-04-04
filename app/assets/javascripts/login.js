execute = function() {
  if($(".neighbourhoods.index").length > 0)
    $('#submit_login_form').on('click', function() {
      $('#login_form').submit();
    });
}

$(document).ready(execute);