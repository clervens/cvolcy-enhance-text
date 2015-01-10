@HtmlParser = ->
  @filters = []
  return

@HtmlParser::add_filter = (filter) ->
  @filters.push filter
  return

@HtmlParser::parse = (text) ->
  for index of @filters
    text = @filters[index].apply(text)
  text
