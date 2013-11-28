$ = (elm) ->
  document.getElementById(elm)

make_link = (text) ->
  exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
  text.replace(exp,"<a href='$1'>$1</a>");

window.$ = $
window.make_link = make_link