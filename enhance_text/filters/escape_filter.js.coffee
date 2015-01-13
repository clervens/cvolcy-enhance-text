@EscapeFilter = (options) ->
  @options = options
  return

@EscapeFilter::apply = (text) ->
  regex = /['"><]/gi
  options = @options
  lookup = 
    "'": "&#39;"
    "\"": "&quot;"
    ">": '&gt;'
    "<": '&lt;'
  text.replace regex, (match, elm, n) ->
    return lookup[match] if lookup[match]
    match
