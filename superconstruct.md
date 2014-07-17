#Constructors Just Because
Just another document on constructors because I think they're pretty cool, and somebody asked about prototype yesterday.

##Function / variable hoisting
We'll take a short look at this behavior of instantiating a constructor in a way which appears to be prior to declaration. But first, just a bit of info on types of functions in JavaScript, namely, named functions and anonymous functions:
* `function someFn() {}` // _Named function, will be hoisted within scope_
* `var someFn = function() {}` // _Anonymous function with pointer. Will not be hoisted. Available only after declaration_
* `var someFn = function someFn() {}` // _Named function with pointer. Will not be hoisted (var nor function). It may help in stack tracing, but not sure why you would use this_
* ~~`someFn = function() {}`~~ // _Anonymous function with pointer. Will be hoisted because of violation of scope, will always be global, and will throw exception in strict mode. __Don't do this___

##Without Further Ado…
Actors:
* littleCon (Con)
* superduper (SuperCon)
* Con (getProp, shared)
* SuperCon (getProp, shared, getName)
Not that it's relavant to the topic, but as an aside…. Due to the write-only nature of `obj`, it means that all instances of SuperCon will have unchangeable and shared obj.prop1 and obj.prop2 values.

````
var littleCon = new Con("littleCon prop1", "littleCon prop2");
littleCon.getProp(1); 
	// "littleCon prop1"
littleCon.getProp(2); 
	// "littleCon prop2"

littleCon.shared(); 
	// "TypeError: 'undefined' is not a function (evaluating 'littleCon.shared()')"

Con.prototype.shared = function() {
	return "prototype shared object after object creation and instantiation. Open for extension….";
};

littleCon.shared(); 
	// "prototype shared object after object creation and instantiation. Open for extension…."

SuperCon.prototype = new Con("super con prop 1", "super con prop2");

var superduper = new SuperCon("superman");

function SuperCon(_name) {
	var name = _name || null;
	this.getName = function() {
		return name;
	};
}
 
function Con(_prop1, _prop2) {
	var obj = {
		prop1: _prop1 || null,
		prop2: _prop2 || null
	};

	this.getProp = function(n) {
		return obj["prop" + n];
	};
}
````
