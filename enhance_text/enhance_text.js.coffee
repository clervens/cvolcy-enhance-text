@EnhanceText = ->
  @filters = []
  return

@EnhanceText::add_filter = (filter, options) ->
  filter_klass = window[@_parse_filter_name_to_className(filter)]
  @filters.push new filter_klass(options||{}) if typeof filter_klass == "function"
  return

@EnhanceText::add_filters = (filters) ->
  if filters instanceof Array
    for filter in filters
      options = {}
      if filter instanceof Array
        filter_name = filter[0]
        options = filter[1]
      else
        filter_name = filter
      @add_filter filter_name, options
  else
    throw "Wrong parameter type. Expected an Array"
  return

@EnhanceText::parse = (text) ->
  for index of @filters
    text = @filters[index].apply(text)
  text

@EnhanceText::_parse_filter_name_to_className = (filter_name) ->
  filter_name.charAt(0).toUpperCase() + filter_name.slice(1).toLowerCase() + "Filter"
