Main =
  init: ->
    # Don't run the script if we're not battling
    params = Main.getParams()
    return unless !!d.getElementById "monsterpane"

    if cont = d.getElementById "ckey_continue"
      # Encounter has ended, click Continue
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
