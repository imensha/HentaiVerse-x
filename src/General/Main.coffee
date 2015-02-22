Main =
  init: ->
    # Don't run the script if we're not battling
    params = Main.getParams()
    return unless params?.s is "Battle"

    initFeatures()

  initFeatures: ->
    initFeature = (name, module) ->
      try
        module.init()
      catch err
        c.log "Error initializing #{name}", err

    initFeature "Player",   Player
    
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
