class Monster
  constructor: (el) ->
    @root = el
    @name = Parser.text el.querySelector(".btm3 .fd2").querySelectorAll ":not(.c)"
