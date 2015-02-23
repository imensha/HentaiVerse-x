Main =
  init: ->
    # Don't run the script if we're not in battle
    return unless !!d.getElementById "monsterpane"

    # Check if battle has ended, click Continue
    if cont = d.getElementById "ckey_continue"
      cont.click()
      return

    @initFeatures()

  initFeatures: ->
    initFeature = (name, module) ->
      try
        module.init()
      catch err
        c.log "Error initializing #{name}", err

    initFeature "Player",     Player
    initFeature "Encounter",  Encounter
    
  getParams: ->
    return if location.search.lenght is 0
    params = location.search.substring(1).split "&"
    paramObj = {}
    for param in params
      key = param.split("=")[0]
      val = param.split("=")[1]
      paramObj[key] = val
    paramObj

Main.init()
