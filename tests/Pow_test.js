import {Pow} from '../app/scripts/Pow'

console.log('pow test');
var pow = new Pow();

describe("pow", function() {
  describe('возведение в степень', function(){

    function testPow (x) {
      let expected = x * x * x;
      it("при возведении " + x + " в степень 3 результат: " + expected, function() {
        assert.equal(pow.calc(x, 3), expected);
      });
    }

    for (var x = 1; x <= 5; x++) {
      testPow(x);
    }

  });

});
