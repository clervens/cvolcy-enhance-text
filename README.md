README | CVolcy - HTML PARSER
----

Things you may want to cover:

## System dependencies

## Usage

```javascript
var hp = new HtmlParser();
hp.add_filters([
	'escape',
	[
		'youtube',
		{
			width: 600
		}
	]
]);
var str = "Lorem <span>ipsum</span> https://www.youtube.com/watch?v=zKx2B8WCQuw";
hp.parse(str); 
	#=> Lorem &lt;span&gt;ipsum&lt;/span&gt; <div class="youtube_video"><iframe width="600"...
```

## Database creation

## Database initialization

## How to run the test suite

Open `/test/index.html` in your browser

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

run `cat html_parser/html_parser.js.coffee html_parser/filters/*.js.coffee | coffee --compile --stdio > html_parser.js` to compile final js file.
