var Person = (function(){
	var _name = 'kazushi',
		_age = 36;

function _init() {
	// 何らかの処理
}

function _getName() {
	return _name;
}

function _getAge() {
	return _age;
}

function _doSomething() {
	...
}

// 初期化を実行する
_init();

// 公開APIを返す
return {
	getName: _getName,
		getAge : _getAge
};
}());


