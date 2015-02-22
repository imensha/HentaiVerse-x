Parser =
  # HV uses http://ehgt.org/v/font/10b.png and indexed background offsets for
  # its characters
  # elements have a class in the style of f2<num>
  # where <num> is the offset+index in the image
  #
  # numbers and symbols   0 through 28
  # space                 39
  # letters               40 through 65
  characters:
    numsym:     "0123456789.,!?%+--/\\'\":;()[]_"
    characters: " ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    # Helper function to retrieve characters based on their HV image index
    get: (num) ->
      filler = []
      for i in [0...10]
        filler[i] = null

      chars = [].concat @numsym.split(""), filler, @characters.split("")
      chars[num]


  text: (elements) ->
    # Slice NodeList to Array
    if elements instanceof NodeList
      elements = [elements...]
    # Put single element into an Array
    unless elements instanceof Array
      elements = [elements]

    chars = []
    for el in elements
      klass = el.className.match(/\w*$/)[0]
      num = klass.replace /^f\d/, ""
      chars.push Parser.characters.get num

    chars.join ""
