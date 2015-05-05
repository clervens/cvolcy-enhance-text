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
    'image',
    {
      height: 150 //Size in pixel
    }
  ],
	[
		'youtube',
		{
			width: 600 //Size in pixel
		}
	]
]);
var str = "Lorem <span>ipsum</span> foo.jpg https://www.youtube.com/watch?v=zKx2B8WCQuw";
et.parse(str); 
	#=> Lorem &lt;span&gt;ipsum&lt;/span&gt; <img src="foo.jpg" height="150"> <div class="youtube_video"><iframe width="600"...
```

## How to run the test suite

Open `/test/index.html` in your browser

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

run `bash compile_et.sh` to compile final js file.
