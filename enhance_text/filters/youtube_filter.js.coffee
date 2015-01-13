@YoutubeFilter = (options) ->
  @options = $.extend(
    width: 420
    height: 315
    frameborder: 0
    wmode: null
    autoplay: 0
    hide_related: 1
  , options)
  return

@YoutubeFilter::apply = (text) ->
  regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
  options = @options
  text.replace regex, (match, protocole, subdomain, url, youtube_id) ->
    width = options["width"]
    height = options["height"]
    frameborder = options["frameborder"]
    wmode = options["wmode"]
    autoplay = options["autoplay"]
    hide_related = options["hide_related"]
    src = "//www.youtube.com/embed/" + youtube_id
    params = []
    params.push "wmode=" + wmode  if wmode
    params.push "autoplay=1"  if autoplay
    params.push "rel=0"  if hide_related
    src += "?" + params.join("&")  if params.length > 0
    "<div class=\"youtube_video\"><iframe width=\"" + width + "\" height=\"" + height + "\" src=\"" + src + "\" frameborder=\"" + frameborder + "\" allowfullscreen></iframe></div>"
