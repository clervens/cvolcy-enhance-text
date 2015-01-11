@HtmlParser = ->
  @filters = []
  return

@HtmlParser::add_filter = (filter) ->
  filter_klass = window[@_parse_filter_name_to_className(filter)]
  @filters.push new filter_klass if typeof filter_klass == "function"
  return

@HtmlParser::add_filters = (filters) ->
  if filters instanceof Array
    for filter_name in filters
      @add_filter filter_name
  else
    throw "Wrong parameter type. Expected an Array"
  return

@HtmlParser::parse = (text) ->
  for index of @filters
    text = @filters[index].apply(text)
  text

@HtmlParser::_parse_filter_name_to_className = (filter_name) ->
  filter_name.charAt(0).toUpperCase() + filter_name.slice(1).toLowerCase() + "Filter"
