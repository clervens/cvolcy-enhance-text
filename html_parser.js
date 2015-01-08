(function() {
	this.HtmlParser = function() {
		this.filters = [];
	}
	HtmlParser.prototype.add_filter = function(filter) {
		this.filters.push(filter);
	}
	HtmlParser.prototype.parse = function(text) {
		for( index in this.filters) {
			text = this.filters[index].apply(text);
		}
		return text;
	}
}).call(this)