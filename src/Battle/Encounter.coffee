Encounter =
  init: ->
    @root = d.querySelector "#monsterpane"
    @monsters = []

    monsters = @root.querySelectorAll ".btm1"
    for m in monsters
      @monsters.push new Monster m
