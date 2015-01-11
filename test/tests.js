var expect = chai.expect;

describe('HtmlParser', function(){
	var hp;
	beforeEach(function(done){
		hp = new HtmlParser();
		done();
	})
	it("class should exists", function(){
		expect(hp instanceof HtmlParser).to.equal(true);
	})
	describe('should be able to', function(){
		it.skip('returns his filters', function(){
			var filters = hp.filters() // an Array of HtmlParser Filters
			expect(filters).to.be.a("Array");
		})
		it.skip('add a filter', function(){
			var filters_count = hp.filters().length;
			hp.add_filter("Youtube");
			expect(hp.filters()).to.have.length(filters_count+1);
		})
		it.skip('add many filters', function(){
			var filters_count = hp.filters().length;
			hp.add_filters(["Youtube", "AnOtherFilter"]);
			expect(hp.filters()).to.have.length(filters_count+2);
		})
	})
	describe('should return', function(){
		it("the same string when no filters given", function(){
			var str = "lorem ipsum";
			expect(hp.parse(str)).to.equal(str);
		});
		it("parse string when atleast one filters is given", function(){
			var str = "lorem ipsum https://www.youtube.com/watch?v=zKx2B8WCQuw";
			hp.add_filter("Youtube");
			expect(hp.parse(str).indexOf("<iframe") != -1).to.equal(true);
		})
	})
	describe('should throw error when', function(){
		it('everything but an array is given to add_filters', function(){
			expect(function(){hp.add_filters("lorem")}).to.throw();
			expect(function(){hp.add_filters([])}).to.not.throw();
		})
	})
})
