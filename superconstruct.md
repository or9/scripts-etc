#Constructors Just Because
Just another document on constructors because I think they're pretty cool, and somebody asked about prototype yesterday.

##Function / variable hoisting
We'll take a short look at this behavior of instantiating a constructor in a way which appears to be prior to declaration. But first, just a bit of info on types of functions in JavaScript, namely, named functions and anonymous functions:
* `function someFn() {}` // Named function, will be hoisted within scope
* `var someFn = function() {}` // Anonymous function with pointer. Will not be hoisted. Available only after declaration
* `var someFn = function someFn() {}` // Named function with pointer. Will not be hoisted if the pointer name is the same as function name which overwrites function name, and if the variable name is not the same, then this just seems like a bad idea. It may help in stack tracing.
* ~~`someFn = function() {}`~~ // Anonymous function with pointer. Will be hoisted because of violation of scope, will always be global, and will throw exception in strict mode. Don't do this

##Without Further Ado…
Actors:
* littleCon (Con)
* superduper (SuperCon)
* Con (getProp, shared)
* SuperCon (getProp, shared, getName)
Not that it's relavant to the topic, but as an aside…. Due to the write-only nature of `obj`, it means that all instances of SuperCon will have unchangeable and shared obj.prop1 and obj.prop2 values.

````
var littleCon = new Con("littleCon prop1", "littleCon prop2");
littleCon.getProp(1); // __"littleCon prop1"__
littleCon.getProp(2); // _"littleCon prop2"_

littleCon.shared(); // _"TypeError: 'undefined' is not a function (evaluating 'littleCon.shared()')"_

Con.prototype.shared = function() {
	return "prototype shared object after object creation and instantiation. Open for extension….";
};

littleCon.shared(); // _"prototype shared object after object creation and instantiation. Open for extension…."_

SuperCon.prototype = new Con("super con prop 1", "super con prop2");

var superduper = new SuperCon("superman");

superduper has the following methods:
* getProp
	* 1 // _"super con prop 1"_
	* 2 // _"super con prop2"_
* shared
	* _"prototype shared object after object creation and instantiation. Open for extension…."_
* getName
	* _"superman"_

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