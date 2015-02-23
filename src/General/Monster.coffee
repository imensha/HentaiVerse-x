class Monster
  constructor: (el) ->
    @root = el

    @name = Parse.text el.querySelector(".btm3 .fd2").querySelectorAll ":not(.c)"
    @debuffs = []
    # Check if monster has the nbardead.png image
    # this means it's dead
    @isDead = !!@root.querySelector "img[src='http://ehgt.org/v/s/nbardead.png']"

    # Only calculate stats if monster is not dead
    if @isDead
      @HP = 0
      @MP = 0
      @SP = 0
    else
      stats = [@root.querySelectorAll(".btm4 .btm5")...]
      if healthRoot = stats[0]
        @HP = @statPercent healthRoot

      if manaRoot = stats[1]
        @MP = @statPercent manaRoot

      if spiritRoot = stats[2]
        @SP = @statPercent spiritRoot

      for debuff in [@root.querySelectorAll(".btm6 img")...]
        @debuffs.push Parse.buff debuff

  Monster::statPercent = (root) ->
    current = root.querySelector(".chb2").width
    max = root.querySelector(".chb3").width
    (current / max) * 100
