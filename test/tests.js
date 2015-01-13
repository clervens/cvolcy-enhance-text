var expect = chai.expect;

describe('HtmlParser', function(){
	var hp;
	var testStr = "lorem ipsum https://www.youtube.com/watch?v=zKx2B8WCQuw";
	beforeEach(function(done){
		hp = new HtmlParser();
		done();
	})
	it("class should exists", function(){
		expect(hp instanceof HtmlParser).to.equal(true);
	})
	describe('should be able to', function(){
		it('returns his filters', function(){
			var filters = hp.filters // an Array of HtmlParser Filters
			expect(filters).to.be.a("Array");
		})
		it('add a filter', function(){
			var filters_count = hp.filters.length;
			hp.add_filter("Youtube");
			expect(hp.filters).to.have.length(filters_count+1);
		})
		it('add a filter w/ options', function(){
			var filters_count = hp.filters.length;
			var width = 600;
			hp.add_filter("Youtube", {
				width: width
			});
			expect(hp.filters).to.have.length(filters_count+1);
			expect(hp.parse(testStr).indexOf("width=\""+width+"\"") != -1).to.equal(true);
		})
		it('add many filters', function(){
			var filters_count = hp.filters.length;
			hp.add_filters(["Youtube", "escape"]);
			expect(hp.filters).to.have.length(filters_count+2);
		})
	})
	describe('should return', function(){
		it("the same string when no filters given", function(){
			expect(hp.parse(testStr)).to.equal(testStr);
		});
		it("parse string when atleast one filters is given", function(){
			hp.add_filter("Youtube");
			expect(hp.parse(testStr).indexOf("<iframe") != -1).to.equal(true);
		})
	})
	describe('should throw error when', function(){
		it('everything but an array is given to add_filters', function(){
			expect(function(){hp.add_filters("lorem")}).to.throw();
			expect(function(){hp.add_filters([])}).to.not.throw();
		})
	})
})
