Player =
  init: ->
    sidepane = d.querySelector ".clb"
    statRoots = sidepane.querySelectorAll ".cwbdv"

    @recover =
      form: sidepane.querySelector "#recoverForm"
      field: sidepane.querySelector "#recover"

    @healthRoot = statRoots[0]
    @manaRoot = statRoots[1]
    @spiritRoot = statRoots[2]
    @overchargeRoot = statRoots[3]

    @HP = Player.statPercent @healthRoot
    @MP = Player.statPercent @manaRoot
    @SP = Player.statPercent @spiritRoot
    @OC = Player.statPercent @overchargeRoot

    @buffs = []
    for buff in [d.querySelectorAll(".bte img")...]
      @buffs.push Parse.buff buff

    @isSpiritActive = d.getElementById("ckey_spirit").src == "http://ehgt.org/v/battle/spirit_a.png"

  statPercent: (root) ->
    current = root.querySelector(".cwb2").width
    max = root.querySelector(".cwb3").width
    (current / max) * 100

  recoverAll: ->
    @recover.field.value = "all"
    @recover.form.submit()
