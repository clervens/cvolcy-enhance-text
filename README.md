README | CVolcy - ENHANCE TEXT
----

Things you may want to cover:

## System dependencies

## Usage

```javascript
var et = new EnhanceText();
et.add_filters([
	'escape',
	[
		'youtube',
		{
			width: 600
		}
	]
]);
var str = "Lorem <span>ipsum</span> https://www.youtube.com/watch?v=zKx2B8WCQuw";
et.parse(str); 
	#=> Lorem &lt;span&gt;ipsum&lt;/span&gt; <div class="youtube_video"><iframe width="600"...
```

## Database creation

## Database initialization

## How to run the test suite

Open `/test/index.html` in your browser

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

run `cat enhance_text/enhance_text.js.coffee enhance_text/filters/*.js.coffee | coffee --compile --stdio > enhance_text.js` to compile final js file.
