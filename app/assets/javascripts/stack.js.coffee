# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

share_content = $("share_content")
share_content.focus()

share = ->
  shareForm = document.createElement("form")
  shareForm.setAttribute("method", "post")
  shareForm.setAttribute("action", "")

  shareForm.appendChild(share_content)
  shareForm.submit()
  return

new_share = ->
  location.href = "/"

$("share").addEventListener("click", share) if $("share") 

$("new").addEventListener("click", new_share) if $("new")


share_content.innerHTML = make_link(share_content.innerHTML) if share_content and share_content.tagName == "PRE"