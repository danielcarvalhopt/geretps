register_change_student_type = ->
  type = $(".login-wrapper #_type option:selected").val()
  if type=="student"
    register_show_identifier()
  else
    register_hide_identifier()

register_show_identifier = ->
  $(".login-wrapper #identifier").show()

register_hide_identifier = ->
  $(".login-wrapper #identifier").hide()

$(".login-wrapper #_type").change(register_change_student_type)
