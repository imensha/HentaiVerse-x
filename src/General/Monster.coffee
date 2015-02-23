class Monster
  constructor: (el) ->
    @root = el

    @name = Parse.text el.querySelector(".btm3 .fd2").querySelectorAll ":not(.c)"
    @debuffs = []
      for debuff in [@root.querySelectorAll(".btm6 img")...]
        @debuffs.push Parse.buff debuff
