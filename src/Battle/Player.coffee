Player =
  init: ->
    c.log "Init player"
    sidepane = d.querySelector ".clb"
    statRoots = sidepane.querySelectorAll ".cwbdv"

    @healthRoot = statRoots[0]
    @manaRoot = statRoots[1]
    @spiritRoot = statRoots[2]
    @overchargeRoot = statRoots[3]

    @HP = Player.statPercent @healthRoot
    @MP = Player.statPercent @manaRoot
    @SP = Player.statPercent @spiritRoot
    @OC = Player.statPercent @overchargeRoot

  statPercent: (root) ->
    current = root.querySelector(".cwb2").width
    max = root.querySelector(".cwb3").width
    (current / max) * 100
