@ImageFilter = (options) ->
  @options = $.extend(
    width: false
    height: 150
  , options)
  return

@ImageFilter::apply = (text) ->
  regex = /((https?:\/\/)?.+\.(gif|png|jpeg|jpg)(\?\S+|#\S+)?)/
  options = @options
  text.replace regex, (match, full_url, protocole, extension, query) ->
    console.log("protocole: %s\nurl: %s\nextension: %s\nquery:%s", protocole, full_url, extension, query)
    params = []
    params.push "width=\""+options.width+"\"" if options.width
    params.push "height=\""+options.height+"\""

    '<img src="'+full_url+'" '+params.join(' ')+' />'

