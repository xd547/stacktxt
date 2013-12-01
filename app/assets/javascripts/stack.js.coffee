# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

share_content = $("share_content")
share_content.focus()

share = ->
  shareForm = document.createElement("form")
  shareForm.setAttribute("method", "post")
  shareForm.setAttribute("action", "/")

  shareForm.appendChild(share_content)
  document.body.appendChild(shareForm)
  shareForm.submit()
  document.body.removeChild(shareForm)
  return

new_share = ->
  location.href = "/"

$("share").addEventListener("click", share) if $("share") 

$("new").addEventListener("click", new_share) if $("new")


share_content.innerHTML = make_link(share_content.innerHTML) if share_content and share_content.tagName == "PRE"

show_expire_time = ->
  seconds = parseInt($("expire_time").innerHTML)
  if seconds > 0
    seconds -= 1
    $("expire_time").innerHTML = seconds
  else if seconds <= 0
    location.reload()

  return

setInterval(show_expire_time, 1000) if $("expire_time")