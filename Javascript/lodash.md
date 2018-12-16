# Lodash #
## Download ##
1. [Core build](https://raw.githubusercontent.com/lodash/lodash/4.17.4/dist/lodash.core.js)
2. [Full build](https://raw.githubusercontent.com/lodash/lodash/4.17.4/dist/lodash.js)
3. [CDN copies](https://www.jsdelivr.com/projects/lodash)

## Installation ##
### Browser ###

		<script src="lodash.js"></script>

### npm ###

		npm i -g npm
		npm i --save lodash

### Node.js ###

		// Load the full fuild.
		var _ = require('lodash');
		// Load the core build.
		var _ = require('lodash/core');
		// Load the FP build for immutable auto-curried iteratee-first data-last methods.
		var _ = require('lodash/fp');

		// Load method categories
		var array = require('lodash/array');
		var object = require('lodash/fp/object');

		// Cherry-pick methods for smaller browserify/rollup/webpack bundles.
		var at = require('lodash/at');
		var curryN = require('lodash/fp/curryN');

	1. Install [n_](https://www.npmjs.com/package/n_) for use in Node.js < 6 REPL

## Why Lodash? ##
1. Makes JS easier for working with
	1. arrays
	2. numbers
	3. objects
	4. strings
2. Modular methods make it easy for:
	1. Iterating arrays, objects, strings
	2. Manipulating & testing values
	3. Creation of composite functions

## Module Formats ##
1. lodash & per method packages
2. lodash-es, babel-plugin-lodash & lodash-webpack-plugin
3. lodash/fp
4. lodash-amd

## Documentation ##
### Array ###
#### _.chunk ####
1. Syntax: `_.chunk(array, [size=1])`
2. splits array into sub arrays of length `size`.
	1. If array cannot be split evenly, final chink will be ramaining elements
3. Example:

		_.chunk(['a', 'b', 'c', 'd'], 2);
		// => [['a', 'b'], ['c', 'd']]

		_.chunk(['a', 'b', 'c', 'd'], 3);
		// => [['a', 'b', 'c'], ['d']]

#### _.compact ####
1. Example:
	
		_.compact([0, 1, false, 2, '', 3]);
		// => [1, 2, 3]

#### _.concat ####
1. Syntax: `_.concat(array, [values])`
2. Example:

		var array = [1];
		var other = _.concat(array, 2, [3], [[4]]);
	
		console.log(other)
		// => [1, 2, 3, [4]]

		console.log(array)
		// => [1]

#### _.difference ####
#### _.differenceBy ####
#### _.differenceWith ####
#### _.drop ####
#### _.dropRight ####
#### _.dropRightWhile ####
#### _.dropWhile ####
#### _.fill ####
#### _.findIndex ####
#### _.findLastIndex ####
#### _.first -> head ####
#### _.flatten ####
#### _.flattenDeep ####
#### _.flattenDepth ####
#### _.fromPairs ####
#### _.head ####
#### _.indexOf ####
#### _.initial ####
#### _.intersection ####
#### _.intersectionBy ####
#### _.intersectionWith ####
#### _.join ####
#### _.last ####
#### _.lastIndexOf ####
#### _.nth ####
#### _.pull ####
#### _.pullAll ####
#### _.pullAllBy ####
#### _.pullAllWith ####
#### _.pullAt ####
#### _.romove ####
#### _.reverse ####
#### _.slice ####
#### _.sortedIndex ####
#### _.sortedIndexBy ####
#### _.sortedIndexOf ####
#### _.sortedLastIndex ####
#### _.sortedLastIndexOf ####
#### _.sortedUniq ####
#### _.sortedUniqBy ####
#### _.tail ####
#### _.take ####
#### _.takeRight ####
#### _.takeRightWhile ####
#### _.takeWhile ####
#### _.union ####
#### _.unionBy ####
#### _.unionWith ####
#### _.uniq ####
#### _.uniqBy ####
#### _.uniqWith ####
#### _.unzip ####
#### _.unzipWith ####
#### _.without ####
#### _.xor ####
#### _.xorBy ####
#### _.xorWith ####
#### _.zip ####
#### _.zipObject ####
#### _.zipObjectDeep ####
#### _.zipWith ####

### Collection ###
#### _.countBy ####
#### _.each -> forEach ####
#### _.eachRight -> forEachRight ####
#### _.every ####
#### _.filter ####
#### _.find ####
#### _.findLast ####
#### _.flatMap ####
#### _.flatMapDeep ####
#### _.flatMapDepth ####
#### _.forEachRight ####
#### _.groupBy ####
#### _.includes ####
#### _.invokeMap ####
#### _.keyBy ####
#### _.map ####
#### _.orderBy ####
#### _.partition ####
#### _.reduce ####
#### _.reduceRight ####
#### _.reject ####
#### _.sample ####
#### _.sampleSize ####
#### _.shuffle ####
#### _.size ####
#### _.some ####
#### _.sortBy ####

### Date ###
#### _.now ####

### Function ###
#### _.after ####
#### _.ary ####
#### _.before ####
#### _.bind ####
#### _.bindKey ####
#### _.curry ####
#### _.curryRight ####
#### _.debounce ####
#### _.defer ####
#### _.delay ####
#### _.flip ####
#### _.memoize ####
#### _.negate ####
#### _.once ####
#### _.overArgs ####
#### _.partial ####
#### _.partialRight ####
#### _.rearg ####
#### _.rest ####
#### _.spread ####
#### _.throttle ####
#### _.unary ####
#### _.wrap ####

### Lang ###
#### _.castArray ####
#### _.clone ####
#### _.cloneDeep ####
#### _.cloneDeepWith ####
#### _.cloneWith ####
#### _.conformsTo ####
#### _.eq ####
#### _.gt ####
#### _.gte ####
#### _.isArguments ####
#### _.isArray ####
#### _.isArrayBuffer ####
#### _.isArrayLike ####
#### _.isArrayLikeObject ####
#### _.isBoolean ####
#### _.isBuffer ####
#### _.isDate ####
#### _.isElement ####
#### _.isEmpty ####
#### _.isEqual ####
#### _.isEqualWith ####
#### _.isError ####
#### _.isFinite ####
#### _.isFunction ####
#### _.isInteger ####
#### _.isLength ####
#### _.isMap ####
#### _.isMatch ####
#### _.isMatchWith ####
#### _.isNaN ####
#### _.isNative ####
#### _.isNil ####
#### _.isNull ####
#### _.isNumber ####
#### _.isObject ####
#### _.isObjectLike ####
#### _.isPlainObject ####
#### _.isRegExp ####
#### _.isSafeInteger ####
#### _.isSet ####
#### _.isString ####
#### _.isSymbol ####
#### _.isTypedArray ####
#### _.isUndefined ####
#### _.isWeakMap ####
#### _.isWeakSet ####
#### _.lt ####
#### _.lte ####
#### _.toArray ####
#### _.toFinite ####
#### _.toInteger ####
#### _.toLength ####
#### _.toNumber ####
#### _.toPlainObject ####
#### _.toSafeInteger ####
#### _.toString ####

### Math ###
#### _.add ####
#### _.ceil ####
#### _.divide ####
#### _.floor ####
#### _.max ####
#### _.maxBy ####
#### _.mean ####
#### _.meanBy ####
#### _.min ####
#### _.minBy ####
#### _.multiply ####
#### _.round ####
#### _.subtract ####
#### _.sum ####
#### _.sumBy ####

### Number ###
#### _.clamp ####
#### _.inRange ####
#### _.random ####

### Object ###
#### _.assign ####
#### _.assignIn ####
#### _.assignInWith ####
#### _.assignWith ####
#### _.at ####
#### _.create ####
#### _.defaults ####
#### _.defaultsDeep ####
#### _.entries -> toPairs ####
#### _.entriesIN -> toPairsIn ####
#### _.extend -> assignIn ####
#### _.extendWith -> assignInWith ####
#### _.findKey ####
#### _.findLastKey ####
#### _.forIn ####
#### _.forInRight ####
#### _.forOwn ####
#### _.forOwnRight ####
#### _.functions ####
#### _.funtionsIn ####
#### _.get ####
#### _.has ####
#### _.hasIn ####
#### _.invert ####
#### _.invertBy ####
#### _.invoke ####
#### _.keys ####
#### _.keysIn ####
#### _.mapKeys ####
#### _.mapValues ####
#### _.merge ####
#### _.mergeWith ####
#### _.omit ####
#### _.omitBy ####
#### _.pick ####
#### _.pickBy ####
#### _.result ####
#### _.set ####
#### _.setWith ####
#### _.toPairs ####
#### _.toPairsIn ####
#### _.transform ####
#### _.unset ####
#### _.update ####
#### _.updateWith ####
#### _.values ####
#### _.valuesIn ####

### Seq ###
#### _ ####
#### _.chain ####
#### _.tap ####
#### _.thru ####
#### _.prototype[Symbol.iterator] ####
#### _.prototype.at ####
#### _.prototype.chain ####
#### _.prototype.commit ####
#### _.prototype.next ####
#### _.prototype.plant ####
#### _.prototype.reverse ####
#### _.prototype.toJSON -> value ####
#### _.prototype.value ####
#### _.prototype.valueOf -> value ####

### String ###
#### _.camelCase ####
#### _.capitalize ####
#### _.deburr ####
#### _.endsWith ####
#### _.escape ####
#### _.escapeRegExp ####
#### _.kebabCase ####
#### _.lowerCase ####
#### _.lowerFirst ####
#### _.pad ####
#### _.padEnd ####
#### _.padStart ####
#### _.parseInt ####
#### _.repeat ####
#### _.replace ####
#### _.snakeCase ####
#### _.split ####
#### _.startCase ####
#### _.startsWith ####
#### _.template ####
#### _.toLower ####
#### _.toUpper ####
#### _.trim ####
#### _.trimEnd ####
#### _.trimStart ####
#### _.truncate ####
#### _.unescape ####
#### _.upperCase ####
#### _.upperFirst ####
#### _.words ####

### Util ###
#### _.attempt ####
#### _.bindAll ####
#### _.cond ####
#### _.conforms ####
#### _.constant ####
#### _.defaultTo ####
#### _.flow ####
#### _.flowRight ####
#### _.identity ####
#### _.iteratee ####
#### _.matches ####
#### _.matchesProperty ####
#### _.method ####
#### _.methodOf ####
#### _.mixin ####
#### _.noConflict ####
#### _.noop ####
#### _.nthArg ####
#### _.over ####
#### _.overEntry ####
#### _.overSome ####
#### _.property ####
#### _.propertyOf ####
#### _.range ####
#### _.rangeRight ####
#### _.runInContext ####
#### _.stubArray ####
#### _.stubFalse ####
#### _.stubObject ####
#### _.stubString ####
#### _.stubTrue ####
#### _.times ####
#### _.toPath ####
#### _.uniqueId ####

### Properties ###
#### _.VERSION ####
#### _.templateSettings ####
#### _.templateSettings.escape ####
#### _.templateSettings.evaluate ####
#### _.templateSettings.imports ####
#### _.templateSettings.interpolate ####
#### _.templateSettings.variable ####

### Methods ###
#### _.templateSettings.imports.\_ ####