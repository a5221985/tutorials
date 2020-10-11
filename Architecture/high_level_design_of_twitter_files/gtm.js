
// Copyright 2012 Google Inc. All rights reserved.
(function(){

var data = {
"resource": {
  "version":"13",
  
  "macros":[{
      "function":"__j",
      "vtp_name":"navigator.userAgent"
    },{
      "function":"__e"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"value"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"category"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"userId"
    },{
      "function":"__u",
      "vtp_component":"HOST",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__smm",
      "vtp_setDefaultValue":true,
      "vtp_input":["macro",5],
      "vtp_defaultValue":"UA-68399453-3",
      "vtp_map":["list",["map","key","www.educative.io","value","UA-68399453-1"],["map","key","beta.educative.io","value","UA-68399453-1"]]
    },{
      "function":"__gas",
      "vtp_cookieDomain":"none",
      "vtp_doubleClick":false,
      "vtp_setTrackerName":false,
      "vtp_useDebugVersion":false,
      "vtp_fieldsToSet":["list",["map","fieldName","userId","value",["macro",4]]],
      "vtp_useHashAutoLink":false,
      "vtp_decorateFormsAutoLink":false,
      "vtp_enableLinkId":false,
      "vtp_enableEcommerce":false,
      "vtp_trackingId":["macro",6],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"action"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"label"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"pagePath"
    },{
      "function":"__v",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":false,
      "vtp_name":"transactionTotal"
    },{
      "function":"__u",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__v",
      "vtp_name":"gtm.historyChangeSource",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.triggers",
      "vtp_dataLayerVersion":2,
      "vtp_setDefaultValue":true,
      "vtp_defaultValue":""
    },{
      "function":"__v",
      "vtp_name":"gtm.elementUrl",
      "vtp_dataLayerVersion":1
    },{
      "function":"__aev",
      "vtp_varType":"TEXT"
    },{
      "function":"__u",
      "vtp_component":"URL",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__u",
      "vtp_component":"PATH",
      "vtp_enableMultiQueryKeys":false,
      "vtp_enableIgnoreEmptyQueryParam":false
    },{
      "function":"__f",
      "vtp_component":"URL"
    },{
      "function":"__e"
    },{
      "function":"__v",
      "vtp_name":"gtm.element",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementClasses",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementId",
      "vtp_dataLayerVersion":1
    },{
      "function":"__v",
      "vtp_name":"gtm.elementTarget",
      "vtp_dataLayerVersion":1
    }],
  "tags":[{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventValue":["macro",2],
      "vtp_eventCategory":["macro",3],
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",7],
      "vtp_eventAction":["macro",8],
      "vtp_eventLabel":["macro",9],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":3
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_overrideGaSettings":true,
      "vtp_fieldsToSet":["list",["map","fieldName","page","value",["template","\/modal\/",["macro",10]]]],
      "vtp_trackType":"TRACK_PAGEVIEW",
      "vtp_gaSettings":["macro",7],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "tag_id":4
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_overrideGaSettings":false,
      "vtp_trackType":"TRACK_TRANSACTION",
      "vtp_gaSettings":["macro",7],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsTransaction":true,
      "tag_id":5
    },{
      "function":"__awct",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_enableConversionLinker":true,
      "vtp_conversionValue":["macro",11],
      "vtp_conversionCookiePrefix":"_gcl",
      "vtp_conversionId":"936783588",
      "vtp_currencyCode":"USD",
      "vtp_conversionLabel":"S394CJmkkmwQ5N3YvgM",
      "vtp_url":["macro",12],
      "vtp_enableProductReportingCheckbox":true,
      "vtp_enableNewCustomerReportingCheckbox":false,
      "vtp_enableEnhancedConversionsCheckbox":false,
      "vtp_enableEnhancedConversionVariable":false,
      "vtp_enableRdpCheckbox":true,
      "vtp_enableTransportUrl":false,
      "tag_id":6
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_overrideGaSettings":false,
      "vtp_trackType":"TRACK_PAGEVIEW",
      "vtp_gaSettings":["macro",7],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "tag_id":7
    },{
      "function":"__gclidw",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_enableCrossDomain":false,
      "vtp_enableCookieOverrides":false,
      "vtp_enableCrossDomainFeature":true,
      "vtp_enableCookieUpdateFeature":false,
      "vtp_enableCookieFlagsFeature":false,
      "vtp_enableUrlPassthroughFeature":false,
      "tag_id":9
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":false,
      "vtp_overrideGaSettings":false,
      "vtp_eventCategory":"Click",
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",7],
      "vtp_eventAction":["macro",15],
      "vtp_eventLabel":["macro",16],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":24
    },{
      "function":"__ua",
      "metadata":["map"],
      "once_per_event":true,
      "vtp_nonInteraction":true,
      "vtp_overrideGaSettings":false,
      "vtp_eventValue":["macro",2],
      "vtp_eventCategory":["macro",3],
      "vtp_trackType":"TRACK_EVENT",
      "vtp_gaSettings":["macro",7],
      "vtp_eventAction":["macro",8],
      "vtp_eventLabel":["macro",9],
      "vtp_enableRecaptchaOption":false,
      "vtp_enableTransportUrl":true,
      "vtp_enableUaRlsa":false,
      "vtp_enableUseInternalVersion":false,
      "vtp_enableFirebaseCampaignData":true,
      "vtp_trackTypeIsEvent":true,
      "tag_id":26
    },{
      "function":"__baut",
      "metadata":["map"],
      "consent":["list"],
      "setup_tags":["list",["tag",9,0]],
      "once_per_event":true,
      "vtp_goalValue":["macro",11],
      "vtp_tagId":"17304920",
      "vtp_uetqName":"uetq",
      "vtp_eventType":"CUSTOM",
      "vtp_eventAction":"purchase",
      "tag_id":28
    },{
      "function":"__baut",
      "metadata":["map"],
      "consent":["list"],
      "once_per_event":true,
      "vtp_tagId":"17304920",
      "vtp_uetqName":"uetq",
      "vtp_eventType":"PAGE_LOAD",
      "tag_id":29
    },{
      "function":"__hl",
      "tag_id":30
    },{
      "function":"__lcl",
      "vtp_waitForTags":false,
      "vtp_checkValidation":false,
      "vtp_waitForTagsTimeout":"2000",
      "vtp_uniqueTriggerId":"8620751_23",
      "tag_id":31
    },{
      "function":"__html",
      "metadata":["map"],
      "once_per_load":true,
      "vtp_html":"    \n    \u003Cscript type=\"text\/gtmscript\"\u003E(function(a,c,e,f,d,b){a.hj=a.hj||function(){(a.hj.q=a.hj.q||[]).push(arguments)};a._hjSettings={hjid:1142875,hjsv:6};d=c.getElementsByTagName(\"head\")[0];b=c.createElement(\"script\");b.async=1;b.src=e+a._hjSettings.hjid+f+a._hjSettings.hjsv;d.appendChild(b)})(window,document,\"https:\/\/static.hotjar.com\/c\/hotjar-\",\".js?sv\\x3d\");\u003C\/script\u003E\n\n    \n    \u003Cscript type=\"text\/gtmscript\"\u003E!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version=\"2.0\",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,\"script\",\"https:\/\/connect.facebook.net\/en_US\/fbevents.js\");fbq(\"init\",\"1637285686566701\");fbq(\"track\",\"PageView\");\u003C\/script\u003E\n    \n\n    \n    \u003Cscript type=\"text\/gtmscript\"\u003E!function(d,e,f,a,b,c){d.twq||(a=d.twq=function(){a.exe?a.exe.apply(a,arguments):a.queue.push(arguments)},a.version=\"1.1\",a.queue=[],b=e.createElement(f),b.async=!0,b.src=\"\/\/static.ads-twitter.com\/uwt.js\",c=e.getElementsByTagName(f)[0],c.parentNode.insertBefore(b,c))}(window,document,\"script\");twq(\"init\",\"nz5z7\");twq(\"track\",\"PageView\");\u003C\/script\u003E\n    \n\n    \n    \u003Cscript data-gtmsrc=\"https:\/\/www.dwin1.com\/17085.js\" type=\"text\/gtmscript\" defer\u003E\u003C\/script\u003E\n\n    \n    \u003Cscript type=\"text\/gtmscript\"\u003E_linkedin_partner_id=\"1107276\";window._linkedin_data_partner_ids=window._linkedin_data_partner_ids||[];window._linkedin_data_partner_ids.push(_linkedin_partner_id);(function(){var b=document.getElementsByTagName(\"script\")[0],a=document.createElement(\"script\");a.type=\"text\/javascript\";a.async=!0;a.src=\"https:\/\/snap.licdn.com\/li.lms-analytics\/insight.min.js\";b.parentNode.insertBefore(a,b)})();\u003C\/script\u003E",
      "vtp_supportDocumentWrite":false,
      "vtp_enableIframeMode":false,
      "vtp_enableEditJsMacroBehavior":false,
      "tag_id":2
    }],
  "predicates":[{
      "function":"_cn",
      "arg0":["macro",0],
      "arg1":"Googlebot"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"customEvent"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"modalPageview"
    },{
      "function":"_ew",
      "arg0":["macro",5],
      "arg1":".educative.io"
    },{
      "function":"_ew",
      "arg0":["macro",5],
      "arg1":"d.educative.io"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"purchase"
    },{
      "function":"_eq",
      "arg0":["macro",13],
      "arg1":"replaceState"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.historyChange"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.js"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"gtm.linkClick"
    },{
      "function":"_re",
      "arg0":["macro",14],
      "arg1":"(^$|((^|,)8620751_23($|,)))"
    },{
      "function":"_eq",
      "arg0":["macro",1],
      "arg1":"web-vitals"
    }],
  "rules":[
    [["if",1],["unless",0],["add",0]],
    [["if",2],["unless",0],["add",1]],
    [["if",3,5],["unless",0,4],["add",2,3,8]],
    [["if",7],["unless",0,6],["add",4]],
    [["if",8],["unless",0],["add",4,5]],
    [["if",9,10],["add",6]],
    [["if",11],["unless",0],["add",7]],
    [["if",8],["add",9,10,11]],
    [["if",3,8],["unless",0,4],["add",12]]]
},
"runtime":[]




};
/*

 Copyright The Closure Library Authors.
 SPDX-License-Identifier: Apache-2.0
*/
var aa,ba="function"==typeof Object.create?Object.create:function(a){var b=function(){};b.prototype=a;return new b},da;if("function"==typeof Object.setPrototypeOf)da=Object.setPrototypeOf;else{var ea;a:{var fa={fg:!0},ha={};try{ha.__proto__=fa;ea=ha.fg;break a}catch(a){}ea=!1}da=ea?function(a,b){a.__proto__=b;if(a.__proto__!==b)throw new TypeError(a+" is not extensible");return a}:null}
var ja=da,la=function(a,b){a.prototype=ba(b.prototype);a.prototype.constructor=a;if(ja)ja(a,b);else for(var c in b)if("prototype"!=c)if(Object.defineProperties){var d=Object.getOwnPropertyDescriptor(b,c);d&&Object.defineProperty(a,c,d)}else a[c]=b[c];a.Mh=b.prototype},na=this||self,ra=function(a){if(a&&a!=na)return pa(a.document);null===qa&&(qa=pa(na.document));return qa},sa=/^[\w+/_-]+[=]{0,2}$/,qa=null,pa=function(a){var b=a.querySelector&&a.querySelector("script[nonce]");if(b){var c=b.nonce||b.getAttribute("nonce");
if(c&&sa.test(c))return c}return""},ta=function(a){var b=typeof a;return"object"!=b?b:a?Array.isArray(a)?"array":b:"null"},ua=function(a,b){function c(){}c.prototype=b.prototype;a.Mh=b.prototype;a.prototype=new c;a.prototype.constructor=a;a.ci=function(d,e,f){for(var h=Array(arguments.length-2),k=2;k<arguments.length;k++)h[k-2]=arguments[k];return b.prototype[e].apply(d,h)}},va=function(a){return a};var wa=function(){},xa=function(a){return"function"==typeof a},g=function(a){return"string"==typeof a},ya=function(a){return"number"==typeof a&&!isNaN(a)},za=function(a){return"[object Array]"==Object.prototype.toString.call(Object(a))},Aa=function(a,b){if(Array.prototype.indexOf){var c=a.indexOf(b);return"number"==typeof c?c:-1}for(var d=0;d<a.length;d++)if(a[d]===b)return d;return-1},Ba=function(a,b){if(a&&za(a))for(var c=0;c<a.length;c++)if(a[c]&&b(a[c]))return a[c]},Ca=function(a,b){if(!ya(a)||
!ya(b)||a>b)a=0,b=2147483647;return Math.floor(Math.random()*(b-a+1)+a)},Ea=function(a,b){for(var c=new Da,d=0;d<a.length;d++)c.set(a[d],!0);for(var e=0;e<b.length;e++)if(c.get(b[e]))return!0;return!1},Fa=function(a,b){for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&b(c,a[c])},Ga=function(a){return Math.round(Number(a))||0},Ha=function(a){return"false"==String(a).toLowerCase()?!1:!!a},Ia=function(a){var b=[];if(za(a))for(var c=0;c<a.length;c++)b.push(String(a[c]));return b},Ja=function(a){return a?
a.replace(/^\s+|\s+$/g,""):""},Ka=function(){return(new Date).getTime()},Da=function(){this.prefix="gtm.";this.values={}};Da.prototype.set=function(a,b){this.values[this.prefix+a]=b};Da.prototype.get=function(a){return this.values[this.prefix+a]};
var La=function(a,b,c){return a&&a.hasOwnProperty(b)?a[b]:c},Ma=function(a){var b=!1;return function(){if(!b)try{a()}catch(c){}b=!0}},Na=function(a,b){for(var c in b)b.hasOwnProperty(c)&&(a[c]=b[c])},Pa=function(a){for(var b in a)if(a.hasOwnProperty(b))return!0;return!1},Qa=function(a,b){for(var c=[],d=0;d<a.length;d++)c.push(a[d]),c.push.apply(c,b[a[d]]||[]);return c},Sa=function(a,b){for(var c={},d=c,e=a.split("."),f=0;f<e.length-1;f++)d=d[e[f]]={};d[e[e.length-1]]=b;return c},Ta=function(a){var b=
[];Fa(a,function(c,d){10>c.length&&d&&b.push(c)});return b.join(",")};/*
 jQuery v1.9.1 (c) 2005, 2012 jQuery Foundation, Inc. jquery.org/license. */
var Ua=/\[object (Boolean|Number|String|Function|Array|Date|RegExp)\]/,Va=function(a){if(null==a)return String(a);var b=Ua.exec(Object.prototype.toString.call(Object(a)));return b?b[1].toLowerCase():"object"},Wa=function(a,b){return Object.prototype.hasOwnProperty.call(Object(a),b)},Xa=function(a){if(!a||"object"!=Va(a)||a.nodeType||a==a.window)return!1;try{if(a.constructor&&!Wa(a,"constructor")&&!Wa(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}for(var b in a);return void 0===
b||Wa(a,b)},m=function(a,b){var c=b||("array"==Va(a)?[]:{}),d;for(d in a)if(Wa(a,d)){var e=a[d];"array"==Va(e)?("array"!=Va(c[d])&&(c[d]=[]),c[d]=m(e,c[d])):Xa(e)?(Xa(c[d])||(c[d]={}),c[d]=m(e,c[d])):c[d]=e}return c};var Za=function(a){if(void 0==a||za(a)||Xa(a))return!0;switch(typeof a){case "boolean":case "number":case "string":case "function":return!0}return!1};var zb;
var Ab=[],Bb=[],Cb=[],Db=[],Eb=[],Fb={},Gb,Ib,Jb,Kb=function(a,b){var c=a["function"];if(!c)throw Error("Error: No function name given for function call.");var d=Fb[c],e={},f;for(f in a)a.hasOwnProperty(f)&&0===f.indexOf("vtp_")&&(d&&b&&b.De&&b.De(a[f]),e[void 0!==d?f:f.substr(4)]=a[f]);return void 0!==d?d(e):zb(c,e,b)},Mb=function(a,b,c){c=c||[];var d={},e;for(e in a)a.hasOwnProperty(e)&&(d[e]=Lb(a[e],b,c));return d},Nb=function(a){var b=a["function"];if(!b)throw"Error: No function name given for function call.";
var c=Fb[b];return c?c.priorityOverride||0:0},Lb=function(a,b,c){if(za(a)){var d;switch(a[0]){case "function_id":return a[1];case "list":d=[];for(var e=1;e<a.length;e++)d.push(Lb(a[e],b,c));return d;case "macro":var f=a[1];if(c[f])return;var h=Ab[f];if(!h||b.hd(h))return;c[f]=!0;try{var k=Mb(h,b,c);k.vtp_gtmEventId=b.id;d=Kb(k,b);Jb&&(d=Jb.Eg(d,k))}catch(y){b.Pe&&b.Pe(y,Number(f)),d=!1}c[f]=!1;return d;case "map":d={};for(var l=1;l<a.length;l+=2)d[Lb(a[l],b,c)]=Lb(a[l+1],b,c);return d;case "template":d=
[];for(var n=!1,p=1;p<a.length;p++){var r=Lb(a[p],b,c);Ib&&(n=n||r===Ib.Ub);d.push(r)}return Ib&&n?Ib.Hg(d):d.join("");case "escape":d=Lb(a[1],b,c);if(Ib&&za(a[1])&&"macro"===a[1][0]&&Ib.fh(a))return Ib.xh(d);d=String(d);for(var t=2;t<a.length;t++)ab[a[t]]&&(d=ab[a[t]](d));return d;case "tag":var q=a[1];if(!Db[q])throw Error("Unable to resolve tag reference "+q+".");return d={Ie:a[2],index:q};case "zb":var v={arg0:a[2],arg1:a[3],ignore_case:a[5]};v["function"]=a[1];var u=Ob(v,b,c),w=!!a[4];return w||
2!==u?w!==(1===u):null;default:throw Error("Attempting to expand unknown Value type: "+a[0]+".");}}return a},Ob=function(a,b,c){try{return Gb(Mb(a,b,c))}catch(d){JSON.stringify(a)}return 2};var Pb=function(){var a=function(b){return{toString:function(){return b}}};return{bf:a("consent"),Hd:a("convert_case_to"),Id:a("convert_false_to"),Jd:a("convert_null_to"),Kd:a("convert_true_to"),Ld:a("convert_undefined_to"),Vh:a("debug_mode_metadata"),Ea:a("function"),Xf:a("instance_name"),Zf:a("live_only"),$f:a("malware_disabled"),ag:a("metadata"),Yh:a("original_vendor_template_id"),cg:a("once_per_event"),te:a("once_per_load"),xe:a("setup_tags"),ye:a("tag_id"),ze:a("teardown_tags")}}();var Rb=null,Ub=function(a){function b(r){for(var t=0;t<r.length;t++)d[r[t]]=!0}var c=[],d=[];Rb=Sb(a);for(var e=0;e<Bb.length;e++){var f=Bb[e],h=Tb(f);if(h){for(var k=f.add||[],l=0;l<k.length;l++)c[k[l]]=!0;b(f.block||[])}else null===h&&b(f.block||[])}for(var n=[],p=0;p<Db.length;p++)c[p]&&!d[p]&&(n[p]=!0);return n},Tb=function(a){for(var b=a["if"]||[],c=0;c<b.length;c++){var d=Rb(b[c]);if(0===d)return!1;if(2===d)return null}for(var e=a.unless||[],f=0;f<e.length;f++){var h=Rb(e[f]);if(2===h)return null;
if(1===h)return!1}return!0},Sb=function(a){var b=[];return function(c){void 0===b[c]&&(b[c]=Ob(Cb[c],a));return b[c]}};var Vb={Eg:function(a,b){b[Pb.Hd]&&"string"===typeof a&&(a=1==b[Pb.Hd]?a.toLowerCase():a.toUpperCase());b.hasOwnProperty(Pb.Jd)&&null===a&&(a=b[Pb.Jd]);b.hasOwnProperty(Pb.Ld)&&void 0===a&&(a=b[Pb.Ld]);b.hasOwnProperty(Pb.Kd)&&!0===a&&(a=b[Pb.Kd]);b.hasOwnProperty(Pb.Id)&&!1===a&&(a=b[Pb.Id]);return a}};/*
 Copyright (c) 2014 Derek Brans, MIT license https://github.com/krux/postscribe/blob/master/LICENSE. Portions derived from simplehtmlparser, which is licensed under the Apache License, Version 2.0 */
var C={qb:"_ee",Tc:"_syn",ai:"_uei",Zh:"_pci",Fc:"event_callback",Qb:"event_timeout",ia:"gtag.config"};C.ba="allow_ad_personalization_signals";C.Mc="restricted_data_processing";C.ab="allow_google_signals";C.ca="cookie_expires";C.Pb="cookie_update";C.mb="session_duration";C.la="user_properties";C.Da="transport_url";C.M="ads_data_redaction";C.o="ad_storage";
C.J="analytics_storage";C.cf="region";C.df="wait_for_update";C.ke=[C.ba,C.ab,C.Pb];C.me=[C.ca,C.Qb,C.mb];var qc={},rc=function(a,b){qc[a]=qc[a]||[];qc[a][b]=!0},sc=function(a){for(var b=[],c=qc[a]||[],d=0;d<c.length;d++)c[d]&&(b[Math.floor(d/6)]^=1<<d%6);for(var e=0;e<b.length;e++)b[e]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(b[e]||0);return b.join("")};var D=function(a){rc("GTM",a)};function tc(a){if(Error.captureStackTrace)Error.captureStackTrace(this,tc);else{var b=Error().stack;b&&(this.stack=b)}a&&(this.message=String(a))}ua(tc,Error);tc.prototype.name="CustomError";var uc=function(a,b){for(var c=a.split("%s"),d="",e=c.length-1,f=0;f<e;f++)d+=c[f]+(f<b.length?b[f]:"%s");tc.call(this,d+c[e])};ua(uc,tc);uc.prototype.name="AssertionError";var vc=function(a,b){throw new uc("Failure"+(a?": "+a:""),Array.prototype.slice.call(arguments,1));};var wc=function(a,b){var c=function(){};c.prototype=a.prototype;var d=new c;a.apply(d,Array.prototype.slice.call(arguments,1));return d},xc=function(a){var b=a;return function(){if(b){var c=b;b=null;c()}}};var yc,zc=function(){if(void 0===yc){var a=null,b=na.trustedTypes;if(b&&b.createPolicy){try{a=b.createPolicy("goog#html",{createHTML:va,createScript:va,createScriptURL:va})}catch(c){na.console&&na.console.error(c.message)}yc=a}else yc=a}return yc};var Bc=function(a,b){this.h=b===Ac?a:""};Bc.prototype.toString=function(){return"TrustedResourceUrl{"+this.h+"}"};var Ac={};var Cc=/^(?:(?:https?|mailto|ftp):|[^:/?#]*(?:[/?#]|$))/i;var Dc;a:{var Ec=na.navigator;if(Ec){var Fc=Ec.userAgent;if(Fc){Dc=Fc;break a}}Dc=""}var Ic=function(a){return-1!=Dc.indexOf(a)};var Kc=function(a,b,c){this.h=c===Jc?a:""};Kc.prototype.toString=function(){return"SafeHtml{"+this.h+"}"};var Lc=function(a){if(a instanceof Kc&&a.constructor===Kc)return a.h;vc("expected object of type SafeHtml, got '"+a+"' of type "+ta(a));return"type_error:SafeHtml"},Jc={},Mc=new Kc(na.trustedTypes&&na.trustedTypes.emptyHTML||"",0,Jc);var Nc={MATH:!0,SCRIPT:!0,STYLE:!0,SVG:!0,TEMPLATE:!0},Oc=function(a){var b=!1,c;return function(){b||(c=a(),b=!0);return c}}(function(){if("undefined"===typeof document)return!1;var a=document.createElement("div"),b=document.createElement("div");b.appendChild(document.createElement("div"));a.appendChild(b);if(!a.firstChild)return!1;var c=a.firstChild.firstChild;a.innerHTML=Lc(Mc);return!c.parentElement}),Pc=function(a,b){if(a.tagName&&Nc[a.tagName.toUpperCase()])throw Error("goog.dom.safe.setInnerHtml cannot be used to set content of "+
a.tagName+".");if(Oc())for(;a.lastChild;)a.removeChild(a.lastChild);a.innerHTML=Lc(b)};var Qc=function(a){var b=zc(),c=b?b.createHTML(a):a;return new Kc(c,null,Jc)};var F=window,H=document,Rc=navigator,Sc=H.currentScript&&H.currentScript.src,Tc=function(a,b){var c=F[a];F[a]=void 0===c?b:c;return F[a]},Uc=function(a,b){b&&(a.addEventListener?a.onload=b:a.onreadystatechange=function(){a.readyState in{loaded:1,complete:1}&&(a.onreadystatechange=null,b())})},Vc=function(a,b,c){var d=H.createElement("script");d.type="text/javascript";d.async=!0;var e,f=zc(),h=f?f.createScriptURL(a):a;e=new Bc(h,Ac);var k;a:{try{var l=d&&d.ownerDocument,n=l&&(l.defaultView||l.parentWindow);
n=n||na;if(n.Element&&n.Location){k=n;break a}}catch(w){}k=null}if(k&&"undefined"!=typeof k.HTMLScriptElement&&(!d||!(d instanceof k.HTMLScriptElement)&&(d instanceof k.Location||d instanceof k.Element))){var p;var r=typeof d;if("object"==r&&null!=d||"function"==r)try{p=d.constructor.displayName||d.constructor.name||Object.prototype.toString.call(d)}catch(w){p="<object could not be stringified>"}else p=void 0===d?"undefined":null===d?"null":typeof d;vc("Argument is not a %s (or a non-Element, non-Location mock); got: %s",
"HTMLScriptElement",p)}var t;e instanceof Bc&&e.constructor===Bc?t=e.h:(vc("expected object of type TrustedResourceUrl, got '"+e+"' of type "+ta(e)),t="type_error:TrustedResourceUrl");d.src=t;var q=ra(d.ownerDocument&&d.ownerDocument.defaultView);q&&d.setAttribute("nonce",q);Uc(d,b);c&&(d.onerror=c);var v=ra();v&&d.setAttribute("nonce",v);var u=H.getElementsByTagName("script")[0]||H.body||H.head;u.parentNode.insertBefore(d,u);return d},Wc=function(){if(Sc){var a=Sc.toLowerCase();if(0===a.indexOf("https://"))return 2;
if(0===a.indexOf("http://"))return 3}return 1},Xc=function(a,b){var c=H.createElement("iframe");c.height="0";c.width="0";c.style.display="none";c.style.visibility="hidden";var d=H.body&&H.body.lastChild||H.body||H.head;d.parentNode.insertBefore(c,d);Uc(c,b);void 0!==a&&(c.src=a);return c},Yc=function(a,b,c){var d=new Image(1,1);d.onload=function(){d.onload=null;b&&b()};d.onerror=function(){d.onerror=null;c&&c()};d.src=a;return d},Zc=function(a,b,c,d){a.addEventListener?a.addEventListener(b,c,!!d):
a.attachEvent&&a.attachEvent("on"+b,c)},$c=function(a,b,c){a.removeEventListener?a.removeEventListener(b,c,!1):a.detachEvent&&a.detachEvent("on"+b,c)},J=function(a){F.setTimeout(a,0)},ad=function(a,b){return a&&b&&a.attributes&&a.attributes[b]?a.attributes[b].value:null},bd=function(a){var b=a.innerText||a.textContent||"";b&&" "!=b&&(b=b.replace(/^[\s\xa0]+|[\s\xa0]+$/g,""));b&&(b=b.replace(/(\xa0+|\s{2,}|\n|\r\t)/g," "));return b},cd=function(a){var b=H.createElement("div");Pc(b,Qc("A<div>"+a+"</div>"));
b=b.lastChild;for(var c=[];b.firstChild;)c.push(b.removeChild(b.firstChild));return c},dd=function(a,b,c){c=c||100;for(var d={},e=0;e<b.length;e++)d[b[e]]=!0;for(var f=a,h=0;f&&h<=c;h++){if(d[String(f.tagName).toLowerCase()])return f;f=f.parentElement}return null},ed=function(a){Rc.sendBeacon&&Rc.sendBeacon(a)||Yc(a)},fd=function(a,b){var c=a[b];c&&"string"===typeof c.animVal&&(c=c.animVal);return c};var gd={},hd=function(a){return void 0==gd[a]?!1:gd[a]};var id=[];function jd(){var a=Tc("google_tag_data",{});a.ics||(a.ics={entries:{},set:kd,update:ld,addListener:md,notifyListeners:nd,active:!1});return a.ics}
function kd(a,b,c,d,e,f){var h=jd();h.active=!0;if(void 0!=b){var k=h.entries,l=k[a]||{},n=l.region,p=c&&g(c)?c.toUpperCase():void 0;d=d.toUpperCase();e=e.toUpperCase();if(p===e||(p===d?n!==e:!p&&!n)){var r=!!(f&&0<f&&void 0===l.update),t={region:p,initial:"granted"===b,update:l.update,quiet:r};k[a]=t;r&&F.setTimeout(function(){k[a]===t&&t.quiet&&(t.quiet=!1,od(a),nd(),rc("TAGGING",2))},f)}}}
function ld(a,b){var c=jd();c.active=!0;if(void 0!=b){var d=pd(a),e=c.entries,f=e[a]=e[a]||{};f.update="granted"===b;var h=pd(a);f.quiet?(f.quiet=!1,od(a)):h!==d&&od(a)}}function md(a,b){id.push({Fe:a,Qg:b})}function od(a){for(var b=0;b<id.length;++b){var c=id[b];za(c.Fe)&&-1!==c.Fe.indexOf(a)&&(c.Te=!0)}}function nd(a){for(var b=0;b<id.length;++b){var c=id[b];if(c.Te){c.Te=!1;try{c.Qg({Ee:a})}catch(d){}}}}
var pd=function(a){var b=jd().entries[a]||{};return void 0!==b.update?b.update:void 0!==b.initial?b.initial:void 0},qd=function(a){return!(jd().entries[a]||{}).quiet},rd=function(){return hd("gtag_cs_api")?jd().active:!1},sd=function(a,b){jd().addListener(a,b)},td=function(a,b){function c(){for(var e=0;e<b.length;e++)if(!qd(b[e]))return!0;return!1}if(c()){var d=!1;sd(b,function(e){d||c()||(d=!0,a(e))})}else a({})},ud=function(a,b){if(!1===pd(b)){var c=!1;sd([b],function(d){!c&&pd(b)&&(a(d),c=!0)})}};var vd=[C.o,C.J],wd=function(a){var b=a[C.cf];b&&D(40);var c=a[C.df];c&&D(41);for(var d=za(b)?b:[b],e=0;e<d.length;++e)for(var f=0;f<vd.length;f++){var h=vd[f],k=a[vd[f]],l=d[e];jd().set(h,k,l,"","",c)}},xd=function(a,b){for(var c=0;c<vd.length;c++){var d=vd[c],e=a[vd[c]];jd().update(d,e)}jd().notifyListeners(b)},yd=function(a){var b=pd(a);return void 0!=b?b:!0},zd=function(){for(var a=[],b=0;b<vd.length;b++){var c=pd(vd[b]);a[b]=!0===c?"1":!1===c?"0":"-"}return"G1"+
a.join("")},Bd=function(a,b){td(a,b)};var Dd=function(a){return Cd?H.querySelectorAll(a):null},Ed=function(a,b){if(!Cd)return null;if(Element.prototype.closest)try{return a.closest(b)}catch(e){return null}var c=Element.prototype.matches||Element.prototype.webkitMatchesSelector||Element.prototype.mozMatchesSelector||Element.prototype.msMatchesSelector||Element.prototype.oMatchesSelector,d=a;if(!H.documentElement.contains(d))return null;do{try{if(c.call(d,b))return d}catch(e){break}d=d.parentElement||d.parentNode}while(null!==d&&1===d.nodeType);
return null},Fd=!1;if(H.querySelectorAll)try{var Gd=H.querySelectorAll(":root");Gd&&1==Gd.length&&Gd[0]==H.documentElement&&(Fd=!0)}catch(a){}var Cd=Fd;var Ud={},L=null,Vd=Math.random();Ud.B="GTM-W3ZFCR2";Ud.Yb="9u1";Ud.Xh="";var Wd={__cl:!0,__ecl:!0,__ehl:!0,__evl:!0,__fal:!0,__fil:!0,__fsl:!0,__hl:!0,__jel:!0,__lcl:!0,__sdl:!0,__tl:!0,__ytl:!0},Xd={__paused:!0,__tg:!0},Yd;for(Yd in Wd)Wd.hasOwnProperty(Yd)&&(Xd[Yd]=!0);var Zd="www.googletagmanager.com/gtm.js";
var $d=Zd,ae=Ha(""),be=null,ce=null,de="//www.googletagmanager.com/a?id="+Ud.B+"&cv=13",ee={},fe={},ge=function(){var a=L.sequence||1;L.sequence=a+1;return a};
var he=function(){return"&tc="+Db.filter(function(a){return a}).length},ke=function(){2022<=ie().length&&je()},me=function(){le||(le=F.setTimeout(je,500))},je=function(){le&&(F.clearTimeout(le),le=void 0);void 0===ne||oe[ne]&&!pe&&!qe||(re[ne]||se.hh()||0>=te--?(D(1),re[ne]=!0):(se.Eh(),Yc(ie()),oe[ne]=!0,ue=ve=we=qe=pe=""))},ie=function(){var a=ne;if(void 0===a)return"";var b=sc("GTM"),c=sc("TAGGING");return[xe,oe[a]?"":"&es=1",ye[a],b?"&u="+b:"",c?"&ut="+c:"",he(),pe,qe,we?we:"",ve,ue,"&z=0"].join("")},
ze=function(){return[de,"&v=3&t=t","&pid="+Ca(),"&rv="+Ud.Yb].join("")},Ae="0.005000">Math.random(),xe=ze(),Be=function(){xe=ze()},oe={},pe="",qe="",ue="",ve="",we="",ne=void 0,ye={},re={},le=void 0,se=function(a,b){var c=0,d=0;return{hh:function(){if(c<a)return!1;Ka()-d>=b&&(c=0);return c>=a},Eh:function(){Ka()-d>=b&&(c=0);c++;d=Ka()}}}(2,1E3),te=1E3,Ce=function(a,b,c){if(Ae&&!re[a]&&b){a!==ne&&(je(),ne=a);var d,e=String(b[Pb.Ea]||"").replace(/_/g,"");0===e.indexOf("cvt")&&(e="cvt");
d=e;var f=c+d;pe=pe?pe+"."+f:"&tr="+f;var h=b["function"];if(!h)throw Error("Error: No function name given for function call.");var k=(Fb[h]?"1":"2")+d;ue=ue?ue+"."+k:"&ti="+k;me();ke()}},De=function(a,b,c){if(Ae&&!re[a]){a!==ne&&(je(),ne=a);var d=c+b;qe=qe?qe+"."+d:"&epr="+d;me();ke()}},Ee=function(a,b,c){};
var Fe={},Ge=new Da,He={},Ie={},Le={name:"dataLayer",set:function(a,b){m(Sa(a,b),He);Je()},get:function(a){return Ke(a,2)},reset:function(){Ge=new Da;He={};Je()}},Ke=function(a,b){if(2!=b){var c=Ge.get(a);Ae&&c!==Me(a.split("."))&&D(5);return c}return Me(a.split("."))},Me=function(a){for(var b=He,c=0;c<a.length;c++){if(null===b)return!1;if(void 0===b)break;b=b[a[c]]}return b},Ne=function(a,b){Ie.hasOwnProperty(a)||(Ge.set(a,b),m(Sa(a,b),He),Je())},Je=function(a){Fa(Ie,function(b,c){Ge.set(b,c);
m(Sa(b,void 0),He);m(Sa(b,c),He);a&&delete Ie[b]})},Oe=function(a,b,c){Fe[a]=Fe[a]||{};var d=1!==c?Me(b.split(".")):Ge.get(b);"array"===Va(d)||"object"===Va(d)?Fe[a][b]=m(d):Fe[a][b]=d},Pe=function(a,b){if(Fe[a])return Fe[a][b]},Qe=function(a,b){Fe[a]&&delete Fe[a][b]};var Te={},Ue=function(a,b){if(F._gtmexpgrp&&F._gtmexpgrp.hasOwnProperty(a))return F._gtmexpgrp[a];void 0===Te[a]&&(Te[a]=Math.floor(Math.random()*b));return Te[a]};var Ve=/:[0-9]+$/,We=function(a,b,c){for(var d=a.split("&"),e=0;e<d.length;e++){var f=d[e].split("=");if(decodeURIComponent(f[0]).replace(/\+/g," ")===b){var h=f.slice(1).join("=");return c?h:decodeURIComponent(h).replace(/\+/g," ")}}},Ze=function(a,b,c,d,e){b&&(b=String(b).toLowerCase());if("protocol"===b||"port"===b)a.protocol=Xe(a.protocol)||Xe(F.location.protocol);"port"===b?a.port=String(Number(a.hostname?a.port:F.location.port)||("http"==a.protocol?80:"https"==a.protocol?443:"")):"host"===b&&
(a.hostname=(a.hostname||F.location.hostname).replace(Ve,"").toLowerCase());return Ye(a,b,c,d,e)},Ye=function(a,b,c,d,e){var f,h=Xe(a.protocol);b&&(b=String(b).toLowerCase());switch(b){case "url_no_fragment":f=$e(a);break;case "protocol":f=h;break;case "host":f=a.hostname.replace(Ve,"").toLowerCase();if(c){var k=/^www\d*\./.exec(f);k&&k[0]&&(f=f.substr(k[0].length))}break;case "port":f=String(Number(a.port)||("http"==h?80:"https"==h?443:""));break;case "path":a.pathname||a.hostname||rc("TAGGING",
1);f="/"==a.pathname.substr(0,1)?a.pathname:"/"+a.pathname;var l=f.split("/");0<=Aa(d||[],l[l.length-1])&&(l[l.length-1]="");f=l.join("/");break;case "query":f=a.search.replace("?","");e&&(f=We(f,e,void 0));break;case "extension":var n=a.pathname.split(".");f=1<n.length?n[n.length-1]:"";f=f.split("/")[0];break;case "fragment":f=a.hash.replace("#","");break;default:f=a&&a.href}return f},Xe=function(a){return a?a.replace(":","").toLowerCase():""},$e=function(a){var b="";if(a&&a.href){var c=a.href.indexOf("#");
b=0>c?a.href:a.href.substr(0,c)}return b},af=function(a){var b=H.createElement("a");a&&(b.href=a);var c=b.pathname;"/"!==c[0]&&(a||rc("TAGGING",1),c="/"+c);var d=b.hostname.replace(Ve,"");return{href:b.href,protocol:b.protocol,host:b.host,hostname:d,pathname:c,search:b.search,hash:b.hash,port:b.port}},bf=function(a){function b(n){var p=n.split("=")[0];return 0>d.indexOf(p)?n:p+"=0"}function c(n){return n.split("&").map(b).filter(function(p){return void 0!=p}).join("&")}var d="gclid dclid gclaw gcldc gclgp gclha gclgf _gl".split(" "),
e=af(a),f=a.split(/[?#]/)[0],h=e.search,k=e.hash;"?"===h[0]&&(h=h.substring(1));"#"===k[0]&&(k=k.substring(1));h=c(h);k=c(k);""!==h&&(h="?"+h);""!==k&&(k="#"+k);var l=""+f+h+k;"/"===l[l.length-1]&&(l=l.substring(0,l.length-1));return l};function cf(a,b,c){for(var d=[],e=b.split(";"),f=0;f<e.length;f++){var h=e[f].split("="),k=h[0].replace(/^\s*|\s*$/g,"");if(k&&k==a){var l=h.slice(1).join("=").replace(/^\s*|\s*$/g,"");l&&c&&(l=decodeURIComponent(l));d.push(l)}}return d};var ef=function(a,b,c,d){return df(d)?cf(a,String(b||document.cookie),c):[]},hf=function(a,b,c,d,e){if(df(e)){var f=ff(a,d,e);if(1===f.length)return f[0].id;if(0!==f.length){f=gf(f,function(h){return h.cc},b);if(1===f.length)return f[0].id;f=gf(f,function(h){return h.zb},c);return f[0]?f[0].id:void 0}}};function jf(a,b,c,d){var e=document.cookie;document.cookie=a;var f=document.cookie;return e!=f||void 0!=c&&0<=ef(b,f,!1,d).indexOf(c)}
var nf=function(a,b,c){function d(q,v,u){if(null==u)return delete h[v],q;h[v]=u;return q+"; "+v+"="+u}function e(q,v){if(null==v)return delete h[v],q;h[v]=!0;return q+"; "+v}if(!df(c.Ga))return 2;var f;void 0==b?f=a+"=deleted; expires="+(new Date(0)).toUTCString():(c.encode&&(b=encodeURIComponent(b)),b=kf(b),f=a+"="+b);var h={};f=d(f,"path",c.path);var k;c.expires instanceof Date?k=c.expires.toUTCString():null!=c.expires&&(k=""+c.expires);f=d(f,"expires",k);f=d(f,"max-age",c.ki);f=d(f,"samesite",
c.oi);c.ri&&(f=e(f,"secure"));var l=c.domain;if("auto"===l){for(var n=lf(),p=0;p<n.length;++p){var r="none"!==n[p]?n[p]:void 0,t=d(f,"domain",r);t=e(t,c.flags);if(!mf(r,c.path)&&jf(t,a,b,c.Ga))return 0}return 1}l&&"none"!==l&&(f=d(f,"domain",l));f=e(f,c.flags);return mf(l,c.path)?1:jf(f,a,b,c.Ga)?0:1},of=function(a,b,c){null==c.path&&(c.path="/");c.domain||(c.domain="auto");return nf(a,b,c)};
function gf(a,b,c){for(var d=[],e=[],f,h=0;h<a.length;h++){var k=a[h],l=b(k);l===c?d.push(k):void 0===f||l<f?(e=[k],f=l):l===f&&e.push(k)}return 0<d.length?d:e}function ff(a,b,c){for(var d=[],e=ef(a,void 0,void 0,c),f=0;f<e.length;f++){var h=e[f].split("."),k=h.shift();if(!b||-1!==b.indexOf(k)){var l=h.shift();l&&(l=l.split("-"),d.push({id:h.join("."),cc:1*l[0]||1,zb:1*l[1]||1}))}}return d}
var kf=function(a){a&&1200<a.length&&(a=a.substring(0,1200));return a},pf=/^(www\.)?google(\.com?)?(\.[a-z]{2})?$/,qf=/(^|\.)doubleclick\.net$/i,mf=function(a,b){return qf.test(document.location.hostname)||"/"===b&&pf.test(a)},lf=function(){var a=[],b=document.location.hostname.split(".");if(4===b.length){var c=b[b.length-1];if(parseInt(c,10).toString()===c)return["none"]}for(var d=b.length-2;0<=d;d--)a.push(b.slice(d).join("."));var e=document.location.hostname;qf.test(e)||pf.test(e)||a.push("none");
return a},df=function(a){if(!hd("gtag_cs_api")||!a||!rd())return!0;if(!qd(a))return!1;var b=pd(a);return null==b?!0:!!b};var rf=function(){for(var a=Rc.userAgent+(H.cookie||"")+(H.referrer||""),b=a.length,c=F.history.length;0<c;)a+=c--^b++;var d=1,e,f,h;if(a)for(d=0,f=a.length-1;0<=f;f--)h=a.charCodeAt(f),d=(d<<6&268435455)+h+(h<<14),e=d&266338304,d=0!=e?d^e>>21:d;return[Math.round(2147483647*Math.random())^d&2147483647,Math.round(Ka()/1E3)].join(".")},uf=function(a,b,c,d,e){var f=sf(b);return hf(a,f,tf(c),d,e)},vf=function(a,b,c,d){var e=""+sf(c),f=tf(d);1<f&&(e+="-"+f);return[b,e,a].join(".")},sf=function(a){if(!a)return 1;
a=0===a.indexOf(".")?a.substr(1):a;return a.split(".").length},tf=function(a){if(!a||"/"===a)return 1;"/"!==a[0]&&(a="/"+a);"/"!==a[a.length-1]&&(a+="/");return a.split("/").length-1};function wf(a,b,c){var d,e=a.yb;null==e&&(e=7776E3);0!==e&&(d=new Date((b||Ka())+1E3*e));return{path:a.path,domain:a.domain,flags:a.flags,encode:!!c,expires:d}};var xf=["1"],yf={},Cf=function(a){var b=zf(a.prefix);yf[b]||Af(b,a.path,a.domain)||(Bf(b,rf(),a),Af(b,a.path,a.domain))};function Bf(a,b,c){var d=vf(b,"1",c.domain,c.path),e=wf(c);e.Ga="ad_storage";of(a,d,e)}function Af(a,b,c){var d=uf(a,b,c,xf,"ad_storage");d&&(yf[a]=d);return d}function zf(a){return(a||"_gcl")+"_au"};function Df(){for(var a=Ef,b={},c=0;c<a.length;++c)b[a[c]]=c;return b}function Ff(){var a="ABCDEFGHIJKLMNOPQRSTUVWXYZ";a+=a.toLowerCase()+"0123456789-_";return a+"."}var Ef,Gf;function Hf(a){Ef=Ef||Ff();Gf=Gf||Df();for(var b=[],c=0;c<a.length;c+=3){var d=c+1<a.length,e=c+2<a.length,f=a.charCodeAt(c),h=d?a.charCodeAt(c+1):0,k=e?a.charCodeAt(c+2):0,l=f>>2,n=(f&3)<<4|h>>4,p=(h&15)<<2|k>>6,r=k&63;e||(r=64,d||(p=64));b.push(Ef[l],Ef[n],Ef[p],Ef[r])}return b.join("")}
function If(a){function b(l){for(;d<a.length;){var n=a.charAt(d++),p=Gf[n];if(null!=p)return p;if(!/^[\s\xa0]*$/.test(n))throw Error("Unknown base64 encoding at char: "+n);}return l}Ef=Ef||Ff();Gf=Gf||Df();for(var c="",d=0;;){var e=b(-1),f=b(0),h=b(64),k=b(64);if(64===k&&-1===e)return c;c+=String.fromCharCode(e<<2|f>>4);64!=h&&(c+=String.fromCharCode(f<<4&240|h>>2),64!=k&&(c+=String.fromCharCode(h<<6&192|k)))}};var Jf;var Nf=function(){var a=Kf,b=Lf,c=Mf(),d=function(h){a(h.target||h.srcElement||{})},e=function(h){b(h.target||h.srcElement||{})};if(!c.init){Zc(H,"mousedown",d);Zc(H,"keyup",d);Zc(H,"submit",e);var f=HTMLFormElement.prototype.submit;HTMLFormElement.prototype.submit=function(){b(this);f.call(this)};c.init=!0}},Of=function(a,b,c,d,e){var f={callback:a,domains:b,fragment:2===c,placement:c,forms:d,sameHost:e};Mf().decorators.push(f)},Pf=function(a,b,c){for(var d=Mf().decorators,e={},f=0;f<d.length;++f){var h=
d[f],k;if(k=!c||h.forms)a:{var l=h.domains,n=a,p=!!h.sameHost;if(l&&(p||n!==H.location.hostname))for(var r=0;r<l.length;r++)if(l[r]instanceof RegExp){if(l[r].test(n)){k=!0;break a}}else if(0<=n.indexOf(l[r])||p&&0<=l[r].indexOf(n)){k=!0;break a}k=!1}if(k){var t=h.placement;void 0==t&&(t=h.fragment?2:1);t===b&&Na(e,h.callback())}}return e},Mf=function(){var a=Tc("google_tag_data",{}),b=a.gl;b&&b.decorators||(b={decorators:[]},a.gl=b);return b};var Qf=/(.*?)\*(.*?)\*(.*)/,Rf=/^https?:\/\/([^\/]*?)\.?cdn\.ampproject\.org\/?(.*)/,Sf=/^(?:www\.|m\.|amp\.)+/,Tf=/([^?#]+)(\?[^#]*)?(#.*)?/;function Uf(a){return new RegExp("(.*?)(^|&)"+a+"=([^&]*)&?(.*)")}
var Wf=function(a){var b=[],c;for(c in a)if(a.hasOwnProperty(c)){var d=a[c];void 0!==d&&d===d&&null!==d&&"[object Object]"!==d.toString()&&(b.push(c),b.push(Hf(String(d))))}var e=b.join("*");return["1",Vf(e),e].join("*")},Vf=function(a,b){var c=[window.navigator.userAgent,(new Date).getTimezoneOffset(),window.navigator.userLanguage||window.navigator.language,Math.floor((new Date).getTime()/60/1E3)-(void 0===b?0:b),a].join("*"),d;if(!(d=Jf)){for(var e=Array(256),f=0;256>f;f++){for(var h=f,k=0;8>k;k++)h=
h&1?h>>>1^3988292384:h>>>1;e[f]=h}d=e}Jf=d;for(var l=4294967295,n=0;n<c.length;n++)l=l>>>8^Jf[(l^c.charCodeAt(n))&255];return((l^-1)>>>0).toString(36)},Yf=function(){return function(a){var b=af(F.location.href),c=b.search.replace("?",""),d=We(c,"_gl",!0)||"";a.query=Xf(d)||{};var e=Ze(b,"fragment").match(Uf("_gl"));a.fragment=Xf(e&&e[3]||"")||{}}},Zf=function(a){var b=Yf(),c=Mf();c.data||(c.data={query:{},fragment:{}},b(c.data));var d={},e=c.data;e&&(Na(d,e.query),a&&Na(d,e.fragment));return d},Xf=
function(a){var b;b=void 0===b?3:b;try{if(a){var c;a:{for(var d=a,e=0;3>e;++e){var f=Qf.exec(d);if(f){c=f;break a}d=decodeURIComponent(d)}c=void 0}var h=c;if(h&&"1"===h[1]){var k=h[3],l;a:{for(var n=h[2],p=0;p<b;++p)if(n===Vf(k,p)){l=!0;break a}l=!1}if(l){for(var r={},t=k?k.split("*"):[],q=0;q<t.length;q+=2)r[t[q]]=If(t[q+1]);return r}}}}catch(v){}};
function $f(a,b,c,d){function e(p){var r=p,t=Uf(a).exec(r),q=r;if(t){var v=t[2],u=t[4];q=t[1];u&&(q=q+v+u)}p=q;var w=p.charAt(p.length-1);p&&"&"!==w&&(p+="&");return p+n}d=void 0===d?!1:d;var f=Tf.exec(c);if(!f)return"";var h=f[1],k=f[2]||"",l=f[3]||"",n=a+"="+b;d?l="#"+e(l.substring(1)):k="?"+e(k.substring(1));return""+h+k+l}
function ag(a,b){var c="FORM"===(a.tagName||"").toUpperCase(),d=Pf(b,1,c),e=Pf(b,2,c),f=Pf(b,3,c);if(Pa(d)){var h=Wf(d);c?bg("_gl",h,a):cg("_gl",h,a,!1)}if(!c&&Pa(e)){var k=Wf(e);cg("_gl",k,a,!0)}for(var l in f)if(f.hasOwnProperty(l))a:{var n=l,p=f[l],r=a;if(r.tagName){if("a"===r.tagName.toLowerCase()){cg(n,p,r,void 0);break a}if("form"===r.tagName.toLowerCase()){bg(n,p,r);break a}}"string"==typeof r&&$f(n,p,r,void 0)}}
function cg(a,b,c,d){if(c.href){var e=$f(a,b,c.href,void 0===d?!1:d);Cc.test(e)&&(c.href=e)}}
function bg(a,b,c){if(c&&c.action){var d=(c.method||"").toLowerCase();if("get"===d){for(var e=c.childNodes||[],f=!1,h=0;h<e.length;h++){var k=e[h];if(k.name===a){k.setAttribute("value",b);f=!0;break}}if(!f){var l=H.createElement("input");l.setAttribute("type","hidden");l.setAttribute("name",a);l.setAttribute("value",b);c.appendChild(l)}}else if("post"===d){var n=$f(a,b,c.action);Cc.test(n)&&(c.action=n)}}}
var Kf=function(a){try{var b;a:{for(var c=a,d=100;c&&0<d;){if(c.href&&c.nodeName.match(/^a(?:rea)?$/i)){b=c;break a}c=c.parentNode;d--}b=null}var e=b;if(e){var f=e.protocol;"http:"!==f&&"https:"!==f||ag(e,e.hostname)}}catch(h){}},Lf=function(a){try{if(a.action){var b=Ze(af(a.action),"host");ag(a,b)}}catch(c){}},dg=function(a,b,c,d){Nf();Of(a,b,"fragment"===c?2:1,!!d,!1)},eg=function(a,b){Nf();Of(a,[Ye(F.location,"host",!0)],b,!0,!0)},fg=function(){var a=H.location.hostname,b=Rf.exec(H.referrer);if(!b)return!1;
var c=b[2],d=b[1],e="";if(c){var f=c.split("/"),h=f[1];e="s"===h?decodeURIComponent(f[2]):decodeURIComponent(h)}else if(d){if(0===d.indexOf("xn--"))return!1;e=d.replace(/-/g,".").replace(/\.\./g,"-")}var k=a.replace(Sf,""),l=e.replace(Sf,""),n;if(!(n=k===l)){var p="."+l;n=k.substring(k.length-p.length,k.length)===p}return n},gg=function(a,b){return!1===a?!1:a||b||fg()};var hg=/^\w+$/,ig=/^[\w-]+$/,jg=/^~?[\w-]+$/,kg={aw:"_aw",dc:"_dc",gf:"_gf",ha:"_ha",gp:"_gp"},lg=function(){if(!hd("gtag_cs_api")||!rd())return!0;var a=pd("ad_storage");return null==a?!0:!!a},mg=function(a,b){qd("ad_storage")?lg()?a():ud(a,"ad_storage"):b?rc("TAGGING",3):td(function(){mg(a,!0)},["ad_storage"])},pg=function(a){var b=[];if(!H.cookie)return b;var c=ef(a,H.cookie,void 0,"ad_storage");if(!c||0==c.length)return b;for(var d=0;d<c.length;d++){var e=ng(c[d]);e&&-1===Aa(b,e)&&b.push(e)}return og(b)};
function qg(a){return a&&"string"==typeof a&&a.match(hg)?a:"_gcl"}
var sg=function(){var a=af(F.location.href),b=Ze(a,"query",!1,void 0,"gclid"),c=Ze(a,"query",!1,void 0,"gclsrc"),d=Ze(a,"query",!1,void 0,"dclid");if(!b||!c){var e=a.hash.replace("#","");b=b||We(e,"gclid",void 0);c=c||We(e,"gclsrc",void 0)}return rg(b,c,d)},rg=function(a,b,c){var d={},e=function(f,h){d[h]||(d[h]=[]);d[h].push(f)};d.gclid=a;d.gclsrc=b;d.dclid=c;if(void 0!==a&&a.match(ig))switch(b){case void 0:e(a,"aw");break;case "aw.ds":e(a,"aw");e(a,"dc");break;case "ds":e(a,"dc");break;case "3p.ds":hd("gtm_3pds")&&
e(a,"dc");break;case "gf":e(a,"gf");break;case "ha":e(a,"ha");break;case "gp":e(a,"gp")}c&&e(c,"dc");return d},ug=function(a){var b=sg();mg(function(){tg(b,a)})};
function tg(a,b,c){function d(l,n){var p=vg(l,e);p&&of(p,n,f)}b=b||{};var e=qg(b.prefix);c=c||Ka();var f=wf(b,c,!0);f.Ga="ad_storage";var h=Math.round(c/1E3),k=function(l){return["GCL",h,l].join(".")};a.aw&&(!0===b.xi?d("aw",k("~"+a.aw[0])):d("aw",k(a.aw[0])));a.dc&&d("dc",k(a.dc[0]));a.gf&&d("gf",k(a.gf[0]));a.ha&&d("ha",k(a.ha[0]));a.gp&&d("gp",k(a.gp[0]))}
var xg=function(a,b){var c=Zf(!0);mg(function(){for(var d=qg(b.prefix),e=0;e<a.length;++e){var f=a[e];if(void 0!==kg[f]){var h=vg(f,d),k=c[h];if(k){var l=Math.min(wg(k),Ka()),n;b:{for(var p=l,r=ef(h,H.cookie,void 0,"ad_storage"),t=0;t<r.length;++t)if(wg(r[t])>p){n=!0;break b}n=!1}if(!n){var q=wf(b,l,!0);q.Ga="ad_storage";of(h,k,q)}}}}tg(rg(c.gclid,c.gclsrc),b)})},vg=function(a,b){var c=kg[a];if(void 0!==c)return b+c},wg=function(a){var b=a.split(".");return 3!==b.length||"GCL"!==b[0]?0:1E3*(Number(b[1])||
0)};function ng(a){var b=a.split(".");if(3==b.length&&"GCL"==b[0]&&b[1])return b[2]}
var yg=function(a,b,c,d,e){if(za(b)){var f=qg(e),h=function(){for(var k={},l=0;l<a.length;++l){var n=vg(a[l],f);if(n){var p=ef(n,H.cookie,void 0,"ad_storage");p.length&&(k[n]=p.sort()[p.length-1])}}return k};mg(function(){dg(h,b,c,d)})}},og=function(a){return a.filter(function(b){return jg.test(b)})},zg=function(a,b){for(var c=qg(b.prefix),d={},e=0;e<a.length;e++)kg[a[e]]&&(d[a[e]]=kg[a[e]]);mg(function(){Fa(d,function(f,h){var k=ef(c+h,H.cookie,void 0,"ad_storage");if(k.length){var l=k[0],n=wg(l),
p={};p[f]=[ng(l)];tg(p,b,n)}})})};function Ag(a,b){for(var c=0;c<b.length;++c)if(a[b[c]])return!0;return!1}
var Bg=function(){function a(e,f,h){h&&(e[f]=h)}var b=["aw","dc"];if(rd()){var c=sg();if(Ag(c,b)){var d={};a(d,"gclid",c.gclid);a(d,"dclid",c.dclid);a(d,"gclsrc",c.gclsrc);eg(function(){return d},3);eg(function(){var e={};return e._up="1",e},1)}}},Cg=function(){var a;if(lg()){for(var b=[],c=H.cookie.split(";"),d=/^\s*_gac_(UA-\d+-\d+)=\s*(.+?)\s*$/,e=0;e<c.length;e++){var f=c[e].match(d);f&&b.push({Bd:f[1],value:f[2]})}var h={};if(b&&b.length)for(var k=0;k<b.length;k++){var l=b[k].value.split(".");
"1"==l[0]&&3==l.length&&l[1]&&(h[b[k].Bd]||(h[b[k].Bd]=[]),h[b[k].Bd].push({timestamp:l[1],Sg:l[2]}))}a=h}else a={};return a};var Dg=/^\d+\.fls\.doubleclick\.net$/;function Eg(a,b){qd(C.o)?yd(C.o)?a():ud(a,C.o):b?D(42):Bd(function(){Eg(a,!0)},[C.o])}function Fg(a){var b=af(F.location.href),c=Ze(b,"host",!1);if(c&&c.match(Dg)){var d=Ze(b,"path").split(a+"=");if(1<d.length)return d[1].split(";")[0].split("?")[0]}}
function Gg(a,b,c){if("aw"==a||"dc"==a){var d=Fg("gcl"+a);if(d)return d.split(".")}var e=qg(b);if("_gcl"==e){c=void 0===c?!0:c;var f=!yd(C.o)&&c,h;h=sg()[a]||[];if(0<h.length)return f?["0"]:h}var k=vg(a,e);return k?pg(k):[]}
var Hg=function(a){var b=Fg("gac");if(b)return!yd(C.o)&&a?"0":decodeURIComponent(b);var c=Cg(),d=[];Fa(c,function(e,f){for(var h=[],k=0;k<f.length;k++)h.push(f[k].Sg);h=og(h);h.length&&d.push(e+":"+h.join(","))});return d.join(";")},Ig=function(a,b){var c=sg().dc||[];Eg(function(){Cf(b);var d=yf[zf(b.prefix)],e=!1;if(d&&0<c.length){var f=L.joined_au=L.joined_au||{},h=b.prefix||"_gcl";if(!f[h])for(var k=0;k<c.length;k++){var l="https://adservice.google.com/ddm/regclk";l=l+"?gclid="+c[k]+"&auiddc="+d;ed(l);e=f[h]=
!0}}null==a&&(a=e);if(a&&d){var n=zf(b.prefix),p=yf[n];p&&Bf(n,p,b)}})};var Jg=/[A-Z]+/,Kg=/\s/,Lg=function(a){if(g(a)&&(a=Ja(a),!Kg.test(a))){var b=a.indexOf("-");if(!(0>b)){var c=a.substring(0,b);if(Jg.test(c)){for(var d=a.substring(b+1).split("/"),e=0;e<d.length;e++)if(!d[e])return;return{id:a,prefix:c,containerId:c+"-"+d[0],C:d}}}}},Ng=function(a){for(var b={},c=0;c<a.length;++c){var d=Lg(a[c]);d&&(b[d.id]=d)}Mg(b);var e=[];Fa(b,function(f,h){e.push(h)});return e};
function Mg(a){var b=[],c;for(c in a)if(a.hasOwnProperty(c)){var d=a[c];"AW"===d.prefix&&d.C[1]&&b.push(d.containerId)}for(var e=0;e<b.length;++e)delete a[b[e]]};var Og=function(){var a=!1;return a};var Qg=function(a,b,c,d){return(2===Pg()||d||"http:"!=F.location.protocol?a:b)+c},Pg=function(){var a=Wc(),b;if(1===a)a:{var c=$d;c=c.toLowerCase();for(var d="https://"+c,e="http://"+c,f=1,h=H.getElementsByTagName("script"),k=0;k<h.length&&100>k;k++){var l=h[k].src;if(l){l=l.toLowerCase();if(0===l.indexOf(e)){b=3;break a}1===f&&0===l.indexOf(d)&&(f=2)}}b=f}else b=a;return b};
var eh=function(a){return yd(C.o)?a:a.replace(/&url=([^&#]+)/,function(b,c){var d=bf(decodeURIComponent(c));return"&url="+encodeURIComponent(d)})},fh=function(){var a;if(!(a=ae)){var b;if(!0===F._gtmdgs)b=!0;else{var c=Rc&&Rc.userAgent||"";b=0>c.indexOf("Safari")||/Chrome|Coast|Opera|Edg|Silk|Android/.test(c)||11>((/Version\/([\d]+)/.exec(c)||[])[1]||"")?!1:!0}a=!b}if(a)return-1;var d=Ga("0");return Ue(1,100)<d?Ue(2,2):-1};var gh=new RegExp(/^(.*\.)?(google|youtube|blogger|withgoogle)(\.com?)?(\.[a-z]{2})?\.?$/),hh={cl:["ecl"],customPixels:["nonGooglePixels"],ecl:["cl"],ehl:["hl"],hl:["ehl"],html:["customScripts","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],customScripts:["html","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],nonGooglePixels:[],nonGoogleScripts:["nonGooglePixels"],nonGoogleIframes:["nonGooglePixels"]},ih={cl:["ecl"],customPixels:["customScripts","html"],
ecl:["cl"],ehl:["hl"],hl:["ehl"],html:["customScripts"],customScripts:["html"],nonGooglePixels:["customPixels","customScripts","html","nonGoogleScripts","nonGoogleIframes"],nonGoogleScripts:["customScripts","html"],nonGoogleIframes:["customScripts","html","nonGoogleScripts"]},jh="google customPixels customScripts html nonGooglePixels nonGoogleScripts nonGoogleIframes".split(" ");
var lh=function(a){var b;Ke("gtm.allowlist")&&D(52);b||(b=Ke("gtm.whitelist"));b&&D(9);
var c=b&&Qa(Ia(b),hh),d;Ke("gtm.blocklist")&&D(51);d||(d=Ke("gtm.blacklist"));d||(d=Ke("tagTypeBlacklist"))&&D(3);d?D(8):d=[];kh()&&(d=Ia(d),d.push("nonGooglePixels","nonGoogleScripts","sandboxedScripts"));0<=Aa(Ia(d),"google")&&D(2);var e=
d&&Qa(Ia(d),ih),f={};return function(h){var k=h&&h[Pb.Ea];if(!k||"string"!=typeof k)return!0;k=k.replace(/^_*/,"");if(void 0!==f[k])return f[k];var l=fe[k]||[],n=a(k,l);if(b){var p;if(p=n)a:{if(0>Aa(c,k))if(l&&0<l.length)for(var r=0;r<l.length;r++){if(0>Aa(c,l[r])){D(11);p=!1;break a}}else{p=!1;break a}p=!0}n=p}var t=!1;if(d){var q=0<=Aa(e,k);if(q)t=q;else{var v=Ea(e,l||[]);v&&D(10);t=v}}var u=!n||t;u||!(0<=Aa(l,"sandboxedScripts"))||c&&-1!==Aa(c,"sandboxedScripts")||(u=Ea(e,jh));return f[k]=u}},
kh=function(){return gh.test(F.location&&F.location.hostname)};var mh={active:!0,isAllowed:function(){return!0}},nh=function(a){var b=L.zones;return b?b.checkState(Ud.B,a):mh},oh=function(a){var b=L.zones;!b&&a&&(b=L.zones=a());return b};var ph=function(){},qh=function(){};var rh=!1,sh=0,th=[];function uh(a){if(!rh){var b=H.createEventObject,c="complete"==H.readyState,d="interactive"==H.readyState;if(!a||"readystatechange"!=a.type||c||!b&&d){rh=!0;for(var e=0;e<th.length;e++)J(th[e])}th.push=function(){for(var f=0;f<arguments.length;f++)J(arguments[f]);return 0}}}function vh(){if(!rh&&140>sh){sh++;try{H.documentElement.doScroll("left"),uh()}catch(a){F.setTimeout(vh,50)}}}var wh=function(a){rh?a():th.push(a)};var xh={},yh={},zh=function(a,b,c,d){if(!yh[a]||Xd[b]||"__zone"===b)return-1;var e={};Xa(d)&&(e=m(d,e));e.id=c;e.status="timeout";return yh[a].tags.push(e)-1},Ah=function(a,b,c,d){if(yh[a]){var e=yh[a].tags[b];e&&(e.status=c,e.executionTime=d)}};function Bh(a){for(var b=xh[a]||[],c=0;c<b.length;c++)b[c]();xh[a]={push:function(d){d(Ud.B,yh[a])}}}
var Eh=function(a,b,c){yh[a]={tags:[]};xa(b)&&Ch(a,b);c&&F.setTimeout(function(){return Bh(a)},Number(c));return Dh(a)},Ch=function(a,b){xh[a]=xh[a]||[];xh[a].push(Ma(function(){return J(function(){b(Ud.B,yh[a])})}))};function Dh(a){var b=0,c=0,d=!1;return{add:function(){c++;return Ma(function(){b++;d&&b>=c&&Bh(a)})},qg:function(){d=!0;b>=c&&Bh(a)}}};var Fh=function(){function a(d){return!ya(d)||0>d?0:d}if(!L._li&&F.performance&&F.performance.timing){var b=F.performance.timing.navigationStart,c=ya(Le.get("gtm.start"))?Le.get("gtm.start"):0;L._li={cst:a(c-b),cbt:a(ce-b)}}};var Jh={},Kh=function(){return F.GoogleAnalyticsObject&&F[F.GoogleAnalyticsObject]},Lh=!1;
var Mh=function(a){F.GoogleAnalyticsObject||(F.GoogleAnalyticsObject=a||"ga");var b=F.GoogleAnalyticsObject;if(F[b])F.hasOwnProperty(b)||D(12);else{var c=function(){c.q=c.q||[];c.q.push(arguments)};c.l=Number(new Date);F[b]=c}Fh();return F[b]},Nh=function(a,b,c,d){b=String(b).replace(/\s+/g,"").split(",");var e=Kh();e(a+"require","linker");e(a+"linker:autoLink",b,c,d)};
var Ph=function(a){},Oh=function(){return F.GoogleAnalyticsObject||"ga"},Qh=function(a,b){return function(){var c=Kh(),d=c&&c.getByName&&c.getByName(a);if(d){var e=d.get("sendHitTask");d.set("sendHitTask",function(f){var h=f.get("hitPayload"),k=f.get("hitCallback"),l=0>h.indexOf("&tid="+b);l&&(f.set("hitPayload",h.replace(/&tid=UA-[0-9]+-[0-9]+/,"&tid="+
b),!0),f.set("hitCallback",void 0,!0));e(f);l&&(f.set("hitPayload",h,!0),f.set("hitCallback",k,!0),f.set("_x_19",void 0,!0),e(f))})}}};function Vh(a,b,c,d){var e=Db[a],f=Wh(a,b,c,d);if(!f)return null;var h=Lb(e[Pb.xe],c,[]);if(h&&h.length){var k=h[0];f=Vh(k.index,{H:f,F:1===k.Ie?b.terminate:f,terminate:b.terminate},c,d)}return f}
function Wh(a,b,c,d){function e(){if(f[Pb.$f])k();else{var w=Mb(f,c,[]);var B=zh(c.id,String(f[Pb.Ea]),Number(f[Pb.ye]),w[Pb.ag]),z=!1;w.vtp_gtmOnSuccess=function(){if(!z){z=!0;var G=Ka()-E;Ce(c.id,Db[a],"5");Ah(c.id,B,"success",
G);h()}};w.vtp_gtmOnFailure=function(){if(!z){z=!0;var G=Ka()-E;Ce(c.id,Db[a],"6");Ah(c.id,B,"failure",G);k()}};w.vtp_gtmTagId=f.tag_id;w.vtp_gtmEventId=c.id;Ce(c.id,f,"1");var A=function(){var G=Ka()-E;Ce(c.id,f,"7");Ah(c.id,B,"exception",G);z||(z=!0,k())};var E=Ka();try{Kb(w,c)}catch(G){A(G)}}}var f=Db[a],h=b.H,k=b.F,l=b.terminate;if(c.hd(f))return null;var n=Lb(f[Pb.ze],c,[]);if(n&&n.length){var p=n[0],r=Vh(p.index,{H:h,F:k,terminate:l},c,d);if(!r)return null;h=r;k=2===p.Ie?l:r}if(f[Pb.te]||f[Pb.cg]){var t=f[Pb.te]?Eb:c.Nh,q=h,v=k;if(!t[a]){e=Ma(e);
var u=Xh(a,t,e);h=u.H;k=u.F}return function(){t[a](q,v)}}return e}function Xh(a,b,c){var d=[],e=[];b[a]=Yh(d,e,c);return{H:function(){b[a]=Zh;for(var f=0;f<d.length;f++)d[f]()},F:function(){b[a]=$h;for(var f=0;f<e.length;f++)e[f]()}}}function Yh(a,b,c){return function(d,e){a.push(d);b.push(e);c()}}function Zh(a){a()}function $h(a,b){b()};var ci=function(a,b,c){for(var d=[],e=0;e<Db.length;e++)if(a[e]){var f=Db[e];var h=c.add();try{var k=Vh(e,{H:h,F:h,terminate:h},b,e);k?d.push({Ze:e,Ue:Nb(f),Og:k}):(ai(e,b),h())}catch(n){h()}}c.qg();d.sort(bi);for(var l=0;l<d.length;l++)d[l].Og();return 0<d.length};function bi(a,b){var c,d=b.Ue,e=a.Ue;c=d>e?1:d<e?-1:0;var f;if(0!==c)f=c;else{var h=a.Ze,k=b.Ze;f=h>k?1:h<k?-1:0}return f}
function ai(a,b){if(!Ae)return;var c=function(d){var e=b.hd(Db[d])?"3":"4",f=Lb(Db[d][Pb.xe],b,[]);f&&f.length&&c(f[0].index);Ce(b.id,Db[d],e);var h=Lb(Db[d][Pb.ze],b,[]);h&&h.length&&c(h[0].index)};c(a);}
var di=!1,ii=function(a){var b=a["gtm.uniqueEventId"],c=a.event;if("gtm.js"===c){if(di)return!1;di=!0}var d=nh(b),e=!1;if(!d.active){var f=!0;if("gtm.js"===c){f=!1,e=!0,d=nh(Number.MAX_SAFE_INTEGER);}if(f)return!1}Ae&&!re[b]&&ne!==b&&(je(),ne=b,ue=pe="",ye[b]="&e="+(0===c.indexOf("gtm.")?encodeURIComponent(c):"*")+"&eid="+b,me());
var h={id:b,name:c,hd:lh(d.isAllowed),Nh:[],Pe:function(){D(6)},De:ei(b)},k=Eh(b,a.eventCallback,a.eventTimeout);fi(b);var l=Ub(h);e&&(l=gi(l));var n=ci(l,h,k);"gtm.js"!==c&&"gtm.sync"!==c||Ph(Ud.B);switch(c){case "gtm.init":D(19),n&&D(20)}return hi(l,
n)};function ei(a){return function(b){Ae&&(Za(b)||Ee(a,"input",b))}}function fi(a){Oe(a,"event",1);Oe(a,"ecommerce",1);Oe(a,"gtm");}
function gi(a){var b=[];for(var c=0;c<a.length;c++)a[c]&&Wd[String(Db[c][Pb.Ea])]&&(b[c]=!0);return b}function hi(a,b){if(!b)return b;for(var c=0;c<a.length;c++)if(a[c]&&Db[c]&&!Xd[String(Db[c][Pb.Ea])])return!0;return!1}function ji(a,b){if(a){var c=""+a;0!==c.indexOf("http://")&&0!==c.indexOf("https://")&&(c="https://"+c);"/"===c[c.length-1]&&(c=c.substring(0,c.length-1));return af(""+c+b).href}}function ki(a,b){return li()?ji(a,b):void 0}function li(){var a=!1;return a};var mi=function(){this.eventModel={};this.targetConfig={};this.containerConfig={};this.h={};this.globalConfig={};this.H=function(){};this.F=function(){};this.eventId=void 0},ni=function(a){var b=new mi;b.eventModel=a;return b},oi=function(a,b){a.targetConfig=b;return a},pi=function(a,b){a.containerConfig=b;return a},qi=function(a,b){a.h=b;return a},ri=function(a,b){a.globalConfig=b;return a},si=function(a,b){a.H=b;return a},ti=function(a,b){a.F=b;return a};
mi.prototype.getWithConfig=function(a){if(void 0!==this.eventModel[a])return this.eventModel[a];if(void 0!==this.targetConfig[a])return this.targetConfig[a];if(void 0!==this.containerConfig[a])return this.containerConfig[a];if(void 0!==this.h[a])return this.h[a];if(void 0!==this.globalConfig[a])return this.globalConfig[a]};
var ui=function(a){function b(e){Fa(e,function(f){c[f]=null})}var c={};b(a.eventModel);b(a.targetConfig);b(a.containerConfig);b(a.globalConfig);var d=[];Fa(c,function(e){d.push(e)});return d};var vi;if(3===Ud.Yb.length)vi="g";else{var wi="G";vi=wi}
var xi={"":"n",UA:"u",AW:"a",DC:"d",G:"e",GF:"f",HA:"h",GTM:vi,OPT:"o"},yi=function(a){var b=Ud.B.split("-"),c=b[0].toUpperCase(),d=xi[c]||"i",e=a&&"GTM"===c?b[1]:"OPT"===c?b[1]:"",f;if(3===Ud.Yb.length){var h="w";f="2"+h}else f="";return f+d+Ud.Yb+e};var zi=function(a,b){a.addEventListener&&a.addEventListener("message",b,!1)};var Ai=function(){return Ic("iPhone")&&!Ic("iPod")&&!Ic("iPad")};Ic("Opera");Ic("Trident")||Ic("MSIE");Ic("Edge");!Ic("Gecko")||-1!=Dc.toLowerCase().indexOf("webkit")&&!Ic("Edge")||Ic("Trident")||Ic("MSIE")||Ic("Edge");-1!=Dc.toLowerCase().indexOf("webkit")&&!Ic("Edge")&&Ic("Mobile");Ic("Macintosh");Ic("Windows");Ic("Linux")||Ic("CrOS");var Bi=na.navigator||null;Bi&&(Bi.appVersion||"").indexOf("X11");Ic("Android");Ai();Ic("iPad");Ic("iPod");Ai()||Ic("iPad")||Ic("iPod");Dc.toLowerCase().indexOf("kaios");var Ci=function(a,b){for(var c=a,d=0;50>d;++d){var e;try{e=!(!c.frames||!c.frames[b])}catch(k){e=!1}if(e)return c;var f;a:{try{var h=c.parent;if(h&&h!=c){f=h;break a}}catch(k){}f=null}if(!(c=f))break}return null};var Di=function(){};var Ei=function(a,b){this.i=a;this.h=null;this.L={};this.na=0;this.fa=void 0===b?500:b;this.m=null};la(Ei,Di);var Gi=function(a){return"function"===typeof a.i.__tcfapi||null!=Fi(a)};
Ei.prototype.addEventListener=function(a){var b={},c=xc(function(){return a(b)}),d=0;-1!==this.fa&&(d=setTimeout(function(){b.tcString="tcunavailable";b.internalErrorState=1;c()},this.fa));var e=function(f,h){clearTimeout(d);f?(b=f,b.internalErrorState=void 0!==b.tcString&&"string"!==typeof b.tcString||void 0!==b.gdprApplies&&"boolean"!==typeof b.gdprApplies||void 0!==b.listenerId&&"number"!==typeof b.listenerId||void 0!==b.addtlConsent&&"string"!==typeof b.addtlConsent?2:b.cmpStatus&&"error"!==b.cmpStatus?
0:3,h&&0===b.internalErrorState||(b.tcString="tcunavailable",h||(b.internalErrorState=3))):(b.tcString="tcunavailable",b.internalErrorState=3);a(b)};try{Hi(this,"addEventListener",e)}catch(f){b.tcString="tcunavailable",b.internalErrorState=3,d&&(clearTimeout(d),d=0),c()}};Ei.prototype.removeEventListener=function(a){a&&a.listenerId&&Hi(this,"removeEventListener",null,a.listenerId)};
var Ji=function(a,b,c){if(!a.purpose||!a.vendor)return!1;var d=Ii(a.vendor.consents,void 0===c?"755":c);return d&&"1"===b&&a.purposeOneTreatment&&"DE"===a.publisherCC?!0:d&&Ii(a.purpose.consents,b)},Ki=function(a,b,c){var d;d=void 0===d?"755":d;var e;a:{if(a.publisher&&a.publisher.restrictions){var f=a.publisher.restrictions[b];if(void 0!==f){e=f[void 0===d?"755":d];break a}}e=void 0}var h=e;if(0===h)return!1;var k=c;2===c?(k=0,2===h&&(k=1)):3===c&&(k=1,1===h&&(k=0));return 0===k?Ji(a,b,d):1===k?
a.purpose&&a.vendor?Ii(a.purpose.legitimateInterests,b)&&Ii(a.vendor.legitimateInterests,void 0===d?"755":d):!1:!0},Ii=function(a,b){return!(!a||!a[b])},Hi=function(a,b,c,d){c||(c=function(){});if("function"===typeof a.i.__tcfapi){var e=a.i.__tcfapi;e(b,2,c,d)}else if(Fi(a)){Li(a);var f=++a.na;a.L[f]=c;if(a.h){var h={};a.h.postMessage((h.__tcfapiCall={command:b,version:2,callId:f,parameter:d},h),"*")}}else c({},!1)},Fi=function(a){if(a.h)return a.h;a.h=Ci(a.i,"__tcfapiLocator");return a.h},Li=function(a){a.m||
(a.m=function(b){try{var c,d;"string"===typeof b.data?d=JSON.parse(b.data):d=b.data;c=d.__tcfapiReturn;a.L[c.callId](c.returnValue,c.success)}catch(e){}},zi(a.i,a.m))};var Mi={1:0,3:0,4:0,7:3,9:3,10:3};function Ni(a,b){if(""===a)return b;var c=Number(a);return isNaN(c)?b:c}var Oi=Ni("",550),Pi=Ni("",500);function Qi(){var a=L.tcf||{};return L.tcf=a}
var Ri=function(a,b){this.m=a;this.h=b;this.i=Ka();},Si=function(a){},Ti=function(a){},Zi=function(){var a=Qi(),b=new Ei(F,3E3),c=new Ri(b,a);if((Ui()?!0===F.gtag_enable_tcf_support:!1!==F.gtag_enable_tcf_support)&&!a.active&&("function"===typeof F.__tcfapi||Gi(b))){a.active=!0;a.Ab={};Vi();var d=setTimeout(function(){Wi(a);Xi(a);d=null},Pi);try{b.addEventListener(function(e){d&&(clearTimeout(d),d=null);if(0!==e.internalErrorState)Wi(a),Xi(a),Si(c);else{var f;if(!1===e.gdprApplies)f=Yi(),b.removeEventListener(e);
else if("tcloaded"===e.eventStatus||"useractioncomplete"===e.eventStatus||"cmpuishown"===e.eventStatus){var h={},k;for(k in Mi)Mi.hasOwnProperty(k)&&("1"===k?h["1"]=!1===e.gdprApplies||"error"===e.cmpStatus||0!==e.internalErrorState||"loaded"===e.cmpStatus&&("tcloaded"===e.eventStatus||"useractioncomplete"===e.eventStatus)?!1===e.gdprApplies||"tcunavailable"===e.tcString?!0:hd("tcf_restrictions")?Ki(e,"1",0):Ji(e,"1"):!1:h[k]=Ki(e,k,Mi[k]));f=h}f&&(a.tcString=e.tcString||"tcempty",a.Ab=f,Xi(a),Si(c))}}),
Ti(c)}catch(e){d&&(clearTimeout(d),d=null),Wi(a),Xi(a)}}};function Wi(a){a.type="e";a.tcString="tcunavailable";a.Ab=Yi()}function Vi(){var a={};wd((a.ad_storage="denied",a.wait_for_update=Oi,a))}var Ui=function(){var a=!1;a=!0;return a};function Yi(){var a={},b;for(b in Mi)Mi.hasOwnProperty(b)&&(a[b]=!0);return a}function Xi(a){var b={};xd((b.ad_storage=a.Ab["1"]?"granted":"denied",b))}
var $i=function(){var a=Qi();if(a.active&&void 0!==a.loadTime)return Number(a.loadTime)},aj=function(){var a=Qi();return a.active?a.tcString||"":""},bj=function(a){if(!Mi.hasOwnProperty(String(a)))return!0;var b=Qi();return b.active&&b.Ab?!!b.Ab[String(a)]:!0};function cj(a,b,c){function d(r){var t;L.reported_gclid||(L.reported_gclid={});t=L.reported_gclid;var q=f+(r?"gcu":"gcs");if(!t[q]){t[q]=!0;var v=[],u=function(z,A){A&&v.push(z+"="+encodeURIComponent(A))},w="https://www.google.com";if(rd()){var y=yd(C.o);u("gcs",zd());r&&u("gcu","1");u("rnd",p);if((!f||h&&"aw.ds"!==h)&&yd(C.o)){var x=pg("_gcl_aw");u("gclaw",x.join("."))}u("url",String(F.location).split(/[?#]/)[0]);u("dclid",dj(b,k));!y&&b&&(w="https://pagead2.googlesyndication.com")}
u("gdpr_consent",aj());"1"===Zf(!1)._up&&u("gtm_up","1");u("gclid",dj(b,f));u("gclsrc",h);u("gtm",yi(!c));var B=w+"/pagead/landing?"+v.join("&");ed(B)}}var e=sg(),f=e.gclid||"",h=e.gclsrc,k=e.dclid||"",l=!a&&(!f||h&&"aw.ds"!==h?!1:!0),n=rd();if(l||n){var p=""+rf();n?Bd(function(){d();yd(C.o)||ud(function(r){return d(!0,r.Ee)},C.o)},[C.o]):d()}}function dj(a,b){var c=a&&!yd(C.o);return b&&c?"0":b}var ej=function(a){if(H.hidden)return!0;var b=a.getBoundingClientRect();if(b.top==b.bottom||b.left==b.right||!F.getComputedStyle)return!0;var c=F.getComputedStyle(a,null);if("hidden"===c.visibility)return!0;for(var d=a,e=c;d;){if("none"===e.display)return!0;var f=e.opacity,h=e.filter;if(h){var k=h.indexOf("opacity(");0<=k&&(h=h.substring(k+8,h.indexOf(")",k)),"%"==h.charAt(h.length-1)&&(h=h.substring(0,h.length-1)),f=Math.min(h,f))}if(void 0!==f&&0>=f)return!0;(d=d.parentElement)&&(e=F.getComputedStyle(d,
null))}return!1};var nj=new RegExp(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i),oj=["SCRIPT","IMG","SVG","PATH"];function pj(a){var b;if(a===H.body)b="body";else{var c;if(a.id)c="#"+a.id;else{var d;if(a.parentElement){var e;a:{var f=a.parentElement;if(f){for(var h=0;h<f.childElementCount;h++)if(f.children[h]===a){e=h+1;break a}e=-1}else e=1}d=pj(a.parentElement)+">:nth-child("+e+")"}else d="";c=d}b=c}return b}
function qj(){var a;var b=[],c=H.body;if(c){for(var d=c.querySelectorAll("*"),e=0;e<d.length&&1E4>e;e++){var f=d[e];0<=oj.indexOf(f.tagName.toUpperCase())||0===f.childElementCount&&b.push(f)}a={elements:b,status:1E4<d.length?"2":"1"}}else a={elements:b,status:"4"};for(var h=a,k=h.elements,l=[],n=0;n<k.length;n++){var p=k[n],r=p.textContent;p.value&&(r=p.value);if(r){var t=r.match(nj);t&&l.push({element:p,wi:t[0]})}}
for(var q=[],v=10<l.length?"3":h.status,u=0;u<l.length&&10>u;u++){var w=l[u].element;q.push({querySelector:pj(w),tagName:w.tagName,isVisible:!ej(w),type:1})}return{elements:q,status:v}}var Zj=function(){var a=!0;bj(7)&&bj(9)&&bj(10)||(a=!1);var b=!0;b=!1;b&&!Yj()&&(a=!1);return a},Yj=function(){var a=!0;bj(3)&&bj(4)||(a=!1);return a};function uk(){var a=L;return a.gcq=a.gcq||new vk}
var wk=function(a,b,c){uk().register(a,b,c)},xk=function(a,b,c,d){uk().push("event",[b,a],c,d)},yk=function(a,b){uk().push("config",[a],b)},zk=function(a,b,c){uk().push("get",[a,b],c)},Ak={},Bk=function(){this.status=1;this.containerConfig={};this.targetConfig={};this.i={};this.m=null;this.h=!1},Ck=function(a,b,c,d,e){this.type=a;this.m=b;this.aa=c||"";this.h=d;this.i=e},vk=function(){this.m={};this.i={};this.h=[]},Dk=function(a,b){var c=Lg(b);return a.m[c.containerId]=a.m[c.containerId]||new Bk},
Ek=function(a,b,c){if(b){var d=Lg(b);if(d&&1===Dk(a,b).status){Dk(a,b).status=2;var e={};Ae&&(e.timeoutId=F.setTimeout(function(){D(38);me()},3E3));a.push("require",[e],d.containerId);Ak[d.containerId]=Ka();if(Og()){}else{var h="/gtag/js?id="+
encodeURIComponent(d.containerId)+"&l=dataLayer&cx=c",k=("http:"!=F.location.protocol?"https:":"http:")+("//www.googletagmanager.com"+h),l=ki(c,h)||k;Vc(l)}}}},Fk=function(a,b,c,d){if(d.aa){var e=Dk(a,d.aa),f=e.m;if(f){var h=m(c),k=m(e.targetConfig[d.aa]),l=m(e.containerConfig),n=m(e.i),p=m(a.i),r=Ke("gtm.uniqueEventId"),t=Lg(d.aa).prefix,q=ti(si(ri(qi(pi(oi(ni(h),k),l),n),p),function(){De(r,t,"2");}),function(){
De(r,t,"3");});try{De(r,t,"1");f(d.aa,b,d.m,q)}catch(v){De(r,t,"4");}}}};
vk.prototype.register=function(a,b,c){if(3!==Dk(this,a).status){Dk(this,a).m=b;Dk(this,a).status=3;c&&(Dk(this,a).i=c);var d=Lg(a),e=Ak[d.containerId];if(void 0!==e){var f=L[d.containerId].bootstrap,h=d.prefix.toUpperCase();L[d.containerId]._spx&&(h=h.toLowerCase());var k=Ke("gtm.uniqueEventId"),l=h,n=Ka()-f;if(Ae&&!re[k]){k!==ne&&(je(),ne=k);var p=l+"."+Math.floor(f-e)+"."+Math.floor(n);ve=ve?ve+","+p:"&cl="+p}delete Ak[d.containerId]}this.flush()}};
vk.prototype.push=function(a,b,c,d){var e=Math.floor(Ka()/1E3);Ek(this,c,b[0][C.Da]||this.i[C.Da]);this.h.push(new Ck(a,e,c,b,d));d||this.flush()};
vk.prototype.flush=function(a){for(var b=this;this.h.length;){var c=this.h[0];if(c.i)c.i=!1,this.h.push(c);else switch(c.type){case "require":if(3!==Dk(this,c.aa).status&&!a)return;Ae&&F.clearTimeout(c.h[0].timeoutId);break;case "set":Fa(c.h[0],function(p,r){m(Sa(p,r),b.i)});break;case "config":var d=c.h[0],e=!!d[C.Tb];delete d[C.Tb];var f=Dk(this,c.aa),h=Lg(c.aa),k=h.containerId===h.id;e||(k?f.containerConfig={}:f.targetConfig[c.aa]={});f.h&&e||Fk(this,C.ia,d,c);f.h=!0;delete d[C.qb];k?m(d,f.containerConfig):
m(d,f.targetConfig[c.aa]);break;case "event":Fk(this,c.h[1],c.h[0],c);break;case "get":}this.h.shift()}};var Gk=!1,Hk=[];function Ik(){if(!Gk){Gk=!0;for(var a=0;a<Hk.length;a++)J(Hk[a])}}var Jk=function(a){Gk?J(a):Hk.push(a)};var Kk="HA GF G UA AW DC".split(" "),Lk=!1,Mk={},Nk=!1;function Ok(a,b){var c={event:a};b&&(c.eventModel=m(b),b[C.Fc]&&(c.eventCallback=b[C.Fc]),b[C.Qb]&&(c.eventTimeout=b[C.Qb]));return c}function Pk(){return Lk}
var Sk={config:function(a){},event:function(a){var b=a[1];if(g(b)&&!(3<a.length)){var c;if(2<a.length){if(!Xa(a[2])&&
void 0!=a[2])return;c=a[2]}var d=Ok(b,c);return d}},js:function(a){if(2==a.length&&a[1].getTime)return Nk=!0,Pk(),{event:"gtm.js","gtm.start":a[1].getTime()}},policy:function(){},set:function(a){var b;2==a.length&&Xa(a[1])?b=m(a[1]):3==a.length&&g(a[1])&&(b={},Xa(a[2])||za(a[2])?b[a[1]]=m(a[2]):b[a[1]]=a[2]);if(b){
b._clear=!0;return b}},consent:function(a){function b(){Pk()&&m(a[2],{subcommand:a[1]})}if(3===a.length){D(39);var c=ge(),d=a[1];"default"===d?(b(),wd(a[2])):"update"===d&&(b(),xd(a[2],c))}}};var Tk={policy:!0};
var Uk=function(a,b){var c=a.hide;if(c&&void 0!==c[b]&&c.end){c[b]=!1;var d=!0,e;for(e in c)if(c.hasOwnProperty(e)&&!0===c[e]){d=!1;break}d&&(c.end(),c.end=null)}},Wk=function(a){var b=Vk(),c=b&&b.hide;c&&c.end&&(c[a]=!0)};var nl=function(a){if(ml(a))return a;this.h=a};nl.prototype.Xg=function(){return this.h};var ml=function(a){return!a||"object"!==Va(a)||Xa(a)?!1:"getUntrustedUpdateValue"in a};nl.prototype.getUntrustedUpdateValue=nl.prototype.Xg;var ol=[],pl=!1,ql=function(a){return F["dataLayer"].push(a)},rl=function(a){var b=L["dataLayer"],c=b?b.subscribers:1,d=0;return function(){++d===c&&a()}};function sl(a){var b=a._clear;Fa(a,function(d,e){"_clear"!==d&&(b&&Ne(d,void 0),Ne(d,e))});be||(be=a["gtm.start"]);var c=a["gtm.uniqueEventId"];if(!a.event)return!1;c||(c=ge(),a["gtm.uniqueEventId"]=c,Ne("gtm.uniqueEventId",c));return ii(a)}
function tl(){for(var a=!1;!pl&&0<ol.length;){pl=!0;delete He.eventModel;Je();var b=ol.shift();if(null!=b){var c=ml(b);if(c){var d=b;b=ml(d)?d.getUntrustedUpdateValue():void 0;for(var e=["gtm.allowlist","gtm.blocklist","gtm.whitelist","gtm.blacklist","tagTypeBlacklist"],f=0;f<e.length;f++){var h=e[f],k=Ke(h,1);if(za(k)||Xa(k))k=m(k);Ie[h]=k}}try{if(xa(b))try{b.call(Le)}catch(w){}else if(za(b)){var l=
b;if(g(l[0])){var n=l[0].split("."),p=n.pop(),r=l.slice(1),t=Ke(n.join("."),2);if(void 0!==t&&null!==t)try{t[p].apply(t,r)}catch(w){}}}else{var q=b;if(q&&("[object Arguments]"==Object.prototype.toString.call(q)||Object.prototype.hasOwnProperty.call(q,"callee"))){a:{var v=b;if(v.length&&g(v[0])){var u=Sk[v[0]];if(u&&(!c||!Tk[v[0]])){b=u(v);break a}}b=void 0}if(!b){pl=!1;continue}}a=sl(b)||a}}finally{c&&Je(!0)}}pl=!1}
return!a}function ul(){var a=tl();try{Uk(F["dataLayer"],Ud.B)}catch(b){}return a}
var wl=function(){var a=Tc("dataLayer",[]),b=Tc("google_tag_manager",{});b=b["dataLayer"]=b["dataLayer"]||{};wh(function(){b.gtmDom||(b.gtmDom=!0,a.push({event:"gtm.dom"}))});Jk(function(){b.gtmLoad||(b.gtmLoad=!0,a.push({event:"gtm.load"}))});b.subscribers=(b.subscribers||0)+1;var c=a.push;a.push=function(){var e;if(0<L.SANDBOXED_JS_SEMAPHORE){e=[];for(var f=0;f<arguments.length;f++)e[f]=new nl(arguments[f])}else e=[].slice.call(arguments,0);var h=c.apply(a,e);ol.push.apply(ol,e);if(300<
this.length)for(D(4);300<this.length;)this.shift();var k="boolean"!==typeof h||h;return tl()&&k};var d=a.slice(0);ol.push.apply(ol,d);vl()&&J(ul)},vl=function(){var a=!0;return a};var xl={};xl.Ub=new String("undefined");
var yl=function(a){this.h=function(b){for(var c=[],d=0;d<a.length;d++)c.push(a[d]===xl.Ub?b:a[d]);return c.join("")}};yl.prototype.toString=function(){return this.h("undefined")};yl.prototype.valueOf=yl.prototype.toString;xl.eg=yl;xl.Rc={};xl.Hg=function(a){return new yl(a)};var zl={};xl.Fh=function(a,b){var c=ge();zl[c]=[a,b];return c};xl.Ge=function(a){var b=a?0:1;return function(c){var d=zl[c];if(d&&"function"===typeof d[b])d[b]();zl[c]=void 0}};xl.fh=function(a){for(var b=!1,c=!1,d=2;d<a.length;d++)b=
b||8===a[d],c=c||16===a[d];return b&&c};xl.xh=function(a){if(a===xl.Ub)return a;var b=ge();xl.Rc[b]=a;return'google_tag_manager["'+Ud.B+'"].macro('+b+")"};xl.qh=function(a,b,c){a instanceof xl.eg&&(a=a.h(xl.Fh(b,c)),b=wa);return{fd:a,H:b}};var Al=function(a,b,c){function d(f,h){var k=f[h];return k}var e={event:b,"gtm.element":a,"gtm.elementClasses":d(a,"className"),"gtm.elementId":a["for"]||ad(a,"id")||"","gtm.elementTarget":a.formTarget||d(a,"target")||""};c&&(e["gtm.triggers"]=c.join(","));e["gtm.elementUrl"]=(a.attributes&&a.attributes.formaction?a.formAction:"")||a.action||d(a,"href")||a.src||a.code||a.codebase||
"";return e},Bl=function(a){L.hasOwnProperty("autoEventsSettings")||(L.autoEventsSettings={});var b=L.autoEventsSettings;b.hasOwnProperty(a)||(b[a]={});return b[a]},Cl=function(a,b,c){Bl(a)[b]=c},Dl=function(a,b,c,d){var e=Bl(a),f=La(e,b,d);e[b]=c(f)},El=function(a,b,c){var d=Bl(a);return La(d,b,c)};var Fl=["input","select","textarea"],Gl=["button","hidden","image","reset","submit"],Hl=function(a){var b=a.tagName.toLowerCase();return!Ba(Fl,function(c){return c===b})||"input"===b&&Ba(Gl,function(c){return c===a.type.toLowerCase()})?!1:!0},Il=function(a){return a.form?a.form.tagName?a.form:H.getElementById(a.form):dd(a,["form"],100)},Jl=function(a,b,c){if(!a.elements)return 0;for(var d=b.getAttribute(c),e=0,f=1;e<a.elements.length;e++){var h=a.elements[e];if(Hl(h)){if(h.getAttribute(c)===d)return f;
f++}}return 0};var Kl=!!F.MutationObserver,Ll=void 0,Ml=function(a){if(!Ll){var b=function(){var c=H.body;if(c)if(Kl)(new MutationObserver(function(){for(var e=0;e<Ll.length;e++)J(Ll[e])})).observe(c,{childList:!0,subtree:!0});else{var d=!1;Zc(c,"DOMNodeInserted",function(){d||(d=!0,J(function(){d=!1;for(var e=0;e<Ll.length;e++)J(Ll[e])}))})}};Ll=[];H.body?b():J(b)}Ll.push(a)};var Yl=F.clearTimeout,Zl=F.setTimeout,O=function(a,b,c){if(Og()){b&&J(b)}else return Vc(a,b,c)},$l=function(){return new Date},am=function(){return F.location.href},bm=function(a){return Ze(af(a),"fragment")},cm=function(a){return $e(af(a))},dm=function(a,b){return Ke(a,b||2)},em=function(a,b,c){var d;b?(a.eventCallback=b,c&&(a.eventTimeout=c),d=ql(a)):d=ql(a);return d},fm=function(a,b){F[a]=b},W=function(a,b,c){b&&
(void 0===F[a]||c&&!F[a])&&(F[a]=b);return F[a]},gm=function(a,b,c){return ef(a,b,void 0===c?!0:!!c)},hm=function(a,b,c){return 0===of(a,b,c)},im=function(a,b){if(Og()){b&&J(b)}else Xc(a,b)},jm=function(a){return!!El(a,"init",!1)},km=function(a){Cl(a,"init",!0)},lm=function(a,b){var c=(void 0===b?0:b)?"www.googletagmanager.com/gtag/js":$d;c+="?id="+encodeURIComponent(a)+"&l=dataLayer";O(Qg("https://","http://",c))},mm=function(a,
b){var c=a[b];return c},nm=function(a,b,c){Ae&&(Za(a)||Ee(c,b,a))};
var om=xl.qh;function Lm(a,b){a=String(a);b=String(b);var c=a.length-b.length;return 0<=c&&a.indexOf(b,c)==c}var Mm=new Da;function Nm(a,b){function c(h){var k=af(h),l=Ze(k,"protocol"),n=Ze(k,"host",!0),p=Ze(k,"port"),r=Ze(k,"path").toLowerCase().replace(/\/$/,"");if(void 0===l||"http"==l&&"80"==p||"https"==l&&"443"==p)l="web",p="default";return[l,n,p,r]}for(var d=c(String(a)),e=c(String(b)),f=0;f<d.length;f++)if(d[f]!==e[f])return!1;return!0}
function Om(a){return Pm(a)?1:0}
function Pm(a){var b=a.arg0,c=a.arg1;if(a.any_of&&za(c)){for(var d=0;d<c.length;d++){var e=m(a,{});m({arg1:c[d],any_of:void 0},e);if(Om(e))return!0}return!1}switch(a["function"]){case "_cn":return 0<=String(b).indexOf(String(c));case "_css":var f;a:{if(b){var h=["matches","webkitMatchesSelector","mozMatchesSelector","msMatchesSelector","oMatchesSelector"];try{for(var k=0;k<h.length;k++)if(b[h[k]]){f=b[h[k]](c);break a}}catch(q){}}f=!1}return f;case "_ew":return Lm(b,c);case "_eq":return String(b)==
String(c);case "_ge":return Number(b)>=Number(c);case "_gt":return Number(b)>Number(c);case "_lc":var l;l=String(b).split(",");return 0<=Aa(l,String(c));case "_le":return Number(b)<=Number(c);case "_lt":return Number(b)<Number(c);case "_re":var n;var p=a.ignore_case?"i":void 0;try{var r=String(c)+p,t=Mm.get(r);t||(t=new RegExp(c,p),Mm.set(r,t));n=t.test(b)}catch(q){n=!1}return n;case "_sw":return 0==String(b).indexOf(String(c));case "_um":return Nm(b,c)}return!1};var Qm={},Rm=encodeURI,X=encodeURIComponent,Sm=Yc;var Tm=function(a,b){if(!a)return!1;var c=Ze(af(a),"host");if(!c)return!1;for(var d=0;b&&d<b.length;d++){var e=b[d]&&b[d].toLowerCase();if(e){var f=c.length-e.length;0<f&&"."!=e.charAt(0)&&(f--,e="."+e);if(0<=f&&c.indexOf(e,f)==f)return!0}}return!1};
var Um=function(a,b,c){for(var d={},e=!1,f=0;a&&f<a.length;f++)a[f]&&a[f].hasOwnProperty(b)&&a[f].hasOwnProperty(c)&&(d[a[f][b]]=a[f][c],e=!0);return e?d:null};Qm.gh=function(){var a=!1;return a};function wo(){return F.gaGlobal=F.gaGlobal||{}}var xo=function(){var a=wo();a.hid=a.hid||Ca();return a.hid},yo=function(a,b){var c=wo();if(void 0==c.vid||b&&!c.from_cookie)c.vid=a,c.from_cookie=b};var Ho=window,Io=document,Jo=function(a){var b=Ho._gaUserPrefs;if(b&&b.ioo&&b.ioo()||a&&!0===Ho["ga-disable-"+a])return!0;try{var c=Ho.external;if(c&&c._gaUserPrefs&&"oo"==c._gaUserPrefs)return!0}catch(f){}for(var d=cf("AMP_TOKEN",String(Io.cookie),!0),e=0;e<d.length;e++)if("$OPT_OUT"==d[e])return!0;return Io.getElementById("__gaOptOutExtension")?!0:!1};function Mo(a){delete a.eventModel[C.qb];Oo(a.eventModel)}
var Oo=function(a){Fa(a,function(c){"_"===c.charAt(0)&&delete a[c]});var b=a[C.la]||{};Fa(b,function(c){"_"===c.charAt(0)&&delete b[c]})};var Ro=function(a,b,c){xk(b,c,a)},So=function(a,b,c){xk(b,c,a,!0)},Uo=function(a,b){};
function To(a,b){}var Z={a:{}};


Z.a.e=["google"],function(){(function(a){Z.__e=a;Z.__e.b="e";Z.__e.g=!0;Z.__e.priorityOverride=0})(function(a){return String(Pe(a.vtp_gtmEventId,"event"))})}();
Z.a.f=["google"],function(){(function(a){Z.__f=a;Z.__f.b="f";Z.__f.g=!0;Z.__f.priorityOverride=0})(function(a){var b=dm("gtm.referrer",1)||H.referrer;return b?a.vtp_component&&"URL"!=a.vtp_component?Ze(af(String(b)),a.vtp_component,a.vtp_stripWww,a.vtp_defaultPages,a.vtp_queryKey):cm(String(b)):String(b)})}();
Z.a.j=["google"],function(){(function(a){Z.__j=a;Z.__j.b="j";Z.__j.g=!0;Z.__j.priorityOverride=0})(function(a){for(var b=String(a.vtp_name).split("."),c=W(b.shift()),d=0;d<b.length;d++)c=c&&c[b[d]];nm(c,"j",a.vtp_gtmEventId);return c})}();

Z.a.u=["google"],function(){var a=function(b){return{toString:function(){return b}}};(function(b){Z.__u=b;Z.__u.b="u";Z.__u.g=!0;Z.__u.priorityOverride=0})(function(b){var c;b.vtp_customUrlSource?c=b.vtp_customUrlSource:c=dm("gtm.url",1);c=c||am();var d=b[a("vtp_component")];if(!d||"URL"==d)return cm(String(c));var e=af(String(c)),f;if("QUERY"===d)a:{var h=b[a("vtp_multiQueryKeys").toString()],k=b[a("vtp_queryKey").toString()]||"",l=b[a("vtp_ignoreEmptyQueryParam").toString()],n;h?za(k)?n=k:n=String(k).replace(/\s+/g,
"").split(","):n=[String(k)];for(var p=0;p<n.length;p++){var r=Ze(e,"QUERY",void 0,void 0,n[p]);if(void 0!=r&&(!l||""!==r)){f=r;break a}}f=void 0}else f=Ze(e,d,"HOST"==d?b[a("vtp_stripWww")]:void 0,"PATH"==d?b[a("vtp_defaultPages")]:void 0,void 0);return f})}();
Z.a.v=["google"],function(){(function(a){Z.__v=a;Z.__v.b="v";Z.__v.g=!0;Z.__v.priorityOverride=0})(function(a){var b=a.vtp_name;if(!b||!b.replace)return!1;var c=dm(b.replace(/\\\./g,"."),a.vtp_dataLayerVersion||1),d=void 0!==c?c:a.vtp_defaultValue;nm(d,"v",a.vtp_gtmEventId);return d})}();
Z.a.ua=["google"],function(){function a(n,p){if(rd()&&!d[n]){var r=function(){var t=Kh(),q="gtm"+ge(),v=k(p),u={name:q};h(v,u,!0);t("create",n,u);t(function(){t.remove(q)})};ud(r,C.J);ud(r,C.o);d[n]=!0}}var b,c={},d={},e={name:!0,clientId:!0,sampleRate:!0,siteSpeedSampleRate:!0,alwaysSendReferrer:!0,allowAnchor:!0,allowLinker:!0,cookieName:!0,cookieDomain:!0,cookieExpires:!0,cookiePath:!0,cookieUpdate:!0,cookieFlags:!0,legacyCookieDomain:!0,legacyHistoryImport:!0,storage:!0,useAmpClientId:!0,storeGac:!0,
_cd2l:!0},f={allowAnchor:!0,allowLinker:!0,alwaysSendReferrer:!0,anonymizeIp:!0,cookieUpdate:!0,exFatal:!0,forceSSL:!0,javaEnabled:!0,legacyHistoryImport:!0,nonInteraction:!0,useAmpClientId:!0,useBeacon:!0,storeGac:!0,allowAdFeatures:!0,allowAdPersonalizationSignals:!0,_cd2l:!0},h=function(n,p,r){var t=0;if(n)for(var q in n)if(n.hasOwnProperty(q)&&(r&&e[q]||!r&&void 0===e[q])){var v=f[q]?Ha(n[q]):n[q];"anonymizeIp"!=q||v||(v=void 0);p[q]=v;t++}return t},k=function(n){var p={};n.vtp_gaSettings&&m(Um(n.vtp_gaSettings.vtp_fieldsToSet,
"fieldName","value"),p);m(Um(n.vtp_fieldsToSet,"fieldName","value"),p);yd(C.J)||(p.storage="none");yd(C.o)||(p.allowAdFeatures=!1,p.storeGac=!1);Zj()||(p.allowAdFeatures=!1);Yj()||(p.allowAdPersonalizationSignals=!1);n.vtp_transportUrl&&(p._x_19=n.vtp_transportUrl);return p},l=function(n){function p(ma,N){void 0!==N&&A("set",ma,N)}var r={},t={},q={},v={};if(n.vtp_gaSettings){var u=
n.vtp_gaSettings;m(Um(u.vtp_contentGroup,"index","group"),t);m(Um(u.vtp_dimension,"index","dimension"),q);m(Um(u.vtp_metric,"index","metric"),v);var w=m(u);w.vtp_fieldsToSet=void 0;w.vtp_contentGroup=void 0;w.vtp_dimension=void 0;w.vtp_metric=void 0;n=m(n,w)}m(Um(n.vtp_contentGroup,"index","group"),t);m(Um(n.vtp_dimension,"index","dimension"),q);m(Um(n.vtp_metric,"index","metric"),v);var y=k(n),x=Mh(n.vtp_functionName);if(xa(x)){var B="",z="";n.vtp_setTrackerName&&"string"==typeof n.vtp_trackerName?
""!==n.vtp_trackerName&&(z=n.vtp_trackerName,B=z+"."):(z="gtm"+ge(),B=z+".");var A=function(ma){var N=[].slice.call(arguments,0);N[0]=B+N[0];x.apply(window,N)},E=function(ma,N){return void 0===N?N:ma(N)},G=function(ma,N){if(N)for(var Ra in N)N.hasOwnProperty(Ra)&&A("set",ma+Ra,N[Ra])},M=function(){},
P={name:z};h(y,P,!0);var V=n.vtp_trackingId||r.trackingId;x("create",V,P);A("set","&gtm",yi(!0));rd()&&(A("set","&gcs",zd()),a(V,n));y._x_19&&(null==Sc&&delete y._x_19,y._x_20&&!c[z]&&(c[z]=!0,x(Qh(z,String(y._x_20)))));n.vtp_enableRecaptcha&&A("require","recaptcha","recaptcha.js");(function(ma,N){void 0!==n[N]&&A("set",ma,n[N])})("nonInteraction","vtp_nonInteraction");
G("contentGroup",t);G("dimension",q);G("metric",v);var Y={};h(y,Y,!1)&&A("set",Y);var ca;n.vtp_enableLinkId&&A("require","linkid","linkid.js");A("set","hitCallback",function(){var ma=y&&y.hitCallback;xa(ma)&&ma();n.vtp_gtmOnSuccess()});if("TRACK_EVENT"==n.vtp_trackType){
n.vtp_enableEcommerce&&(A("require","ec","ec.js"),M());var I={hitType:"event",eventCategory:String(n.vtp_eventCategory||r.category),eventAction:String(n.vtp_eventAction||r.action),eventLabel:E(String,n.vtp_eventLabel||r.label),eventValue:E(Ga,n.vtp_eventValue||r.value)};h(ca,I,!1);A("send",I);}else if("TRACK_SOCIAL"==n.vtp_trackType){}else if("TRACK_TRANSACTION"==n.vtp_trackType){A("require","ecommerce","//www.google-analytics.com/plugins/ua/ecommerce.js");var R=function(ma){return dm("transaction"+ma,1)},U=R("Id");A("ecommerce:addTransaction",{id:U,affiliation:R("Affiliation"),
revenue:R("Total"),shipping:R("Shipping"),tax:R("Tax")});for(var S=R("Products")||[],oa=0;oa<S.length;oa++){var Q=S[oa];A("ecommerce:addItem",{id:U,sku:Q.sku,name:Q.name,category:Q.category,price:Q.price,quantity:Q.quantity})}A("ecommerce:send");}else if("TRACK_TIMING"==n.vtp_trackType){}else if("DECORATE_LINK"==n.vtp_trackType){}else if("DECORATE_FORM"==n.vtp_trackType){}else if("TRACK_DATA"==
n.vtp_trackType){}else{n.vtp_enableEcommerce&&(A("require","ec","ec.js"),M());if(n.vtp_doubleClick||"DISPLAY_FEATURES"==n.vtp_advertisingFeaturesType){var ka="_dc_gtm_"+String(n.vtp_trackingId).replace(/[^A-Za-z0-9-]/g,"");A("require","displayfeatures",void 0,{cookieName:ka})}if("DISPLAY_FEATURES_WITH_REMARKETING_LISTS"==n.vtp_advertisingFeaturesType){var Oa=
"_dc_gtm_"+String(n.vtp_trackingId).replace(/[^A-Za-z0-9-]/g,"");A("require","adfeatures",{cookieName:Oa})}ca?A("send","pageview",ca):A("send","pageview");}if(!b){var Ya=n.vtp_useDebugVersion?"u/analytics_debug.js":"analytics.js";n.vtp_useInternalVersion&&!n.vtp_useDebugVersion&&
(Ya="internal/"+Ya);b=!0;var Qb=ki(y._x_19,"/analytics.js"),Gc=Qg("https:","http:","//www.google-analytics.com/"+Ya,y&&!!y.forceSSL);O("analytics.js"===Ya&&Qb?Qb:Gc,function(){var ma=Kh();ma&&ma.loaded||n.vtp_gtmOnFailure();},n.vtp_gtmOnFailure)}}else J(n.vtp_gtmOnFailure)};(function(n){Z.__ua=n;Z.__ua.b="ua";Z.__ua.g=!0;Z.__ua.priorityOverride=0})(function(n){Bd(function(){l(n)},
[C.J,C.o])})}();






Z.a.gclidw=["google"],function(){var a=["aw","dc","gf","ha","gp"];(function(b){Z.__gclidw=b;Z.__gclidw.b="gclidw";Z.__gclidw.g=!0;Z.__gclidw.priorityOverride=100})(function(b){J(b.vtp_gtmOnSuccess);var c,d,e,f;b.vtp_enableCookieOverrides&&(e=b.vtp_cookiePrefix,c=b.vtp_path,d=b.vtp_domain,b.vtp_enableCookieFlagsFeature&&(f=b.vtp_cookieFlags));var h=null;b.vtp_enableCookieUpdateFeature&&(h=!0,void 0!==b.vtp_cookieUpdate&&(h=!!b.vtp_cookieUpdate));var k={prefix:e,path:c,domain:d,flags:f};b.vtp_enableCrossDomainFeature&&
(b.vtp_enableCrossDomain&&!1===b.vtp_acceptIncoming||(b.vtp_enableCrossDomain||fg())&&xg(a,k));ug(k);zg(["aw","dc"],k);Ig(h,k);var l=e;if(b.vtp_enableCrossDomainFeature&&b.vtp_enableCrossDomain&&b.vtp_linkerDomains){var n=b.vtp_linkerDomains.toString().replace(/\s+/g,"").split(",");yg(a,n,b.vtp_urlPosition,!!b.vtp_formDecoration,l)}var p=dm(C.M);cj(!1,void 0!=p&&!1!==p);b.vtp_enableUrlPassthroughFeature&&b.vtp_enableUrlPassthrough&&Bg()})}();

Z.a.aev=["google"],function(){function a(q,v){var u=Pe(q,"gtm");if(u)return u[v]}function b(q,v,u,w){w||(w="element");var y=q+"."+v,x;if(p.hasOwnProperty(y))x=p[y];else{var B=a(q,w);if(B&&(x=u(B),p[y]=x,r.push(y),35<r.length)){var z=r.shift();delete p[z]}}return x}function c(q,v,u){var w=a(q,t[v]);return void 0!==w?w:u}function d(q,v){if(!q)return!1;var u=e(am());za(v)||(v=String(v||"").replace(/\s+/g,"").split(","));for(var w=[u],y=0;y<v.length;y++){var x=v[y];if(x.hasOwnProperty("is_regex"))if(x.is_regex)try{x=
new RegExp(x.domain)}catch(z){continue}else x=x.domain;if(x instanceof RegExp){if(x.test(q))return!1}else{var B=x;if(0!=B.length){if(0<=e(q).indexOf(B))return!1;w.push(e(B))}}}return!Tm(q,w)}function e(q){n.test(q)||(q="http://"+q);return Ze(af(q),"HOST",!0)}function f(q,v,u){switch(q){case "SUBMIT_TEXT":return b(v,"FORM."+q,h,"formSubmitElement")||u;case "LENGTH":var w=b(v,"FORM."+q,k);return void 0===w?u:w;case "INTERACTED_FIELD_ID":return l(v,"id",u);case "INTERACTED_FIELD_NAME":return l(v,"name",
u);case "INTERACTED_FIELD_TYPE":return l(v,"type",u);case "INTERACTED_FIELD_POSITION":var y=a(v,"interactedFormFieldPosition");return void 0===y?u:y;case "INTERACT_SEQUENCE_NUMBER":var x=a(v,"interactSequenceNumber");return void 0===x?u:x;default:return u}}function h(q){switch(q.tagName.toLowerCase()){case "input":return ad(q,"value");case "button":return bd(q);default:return null}}function k(q){if("form"===q.tagName.toLowerCase()&&q.elements){for(var v=0,u=0;u<q.elements.length;u++)Hl(q.elements[u])&&
v++;return v}}function l(q,v,u){var w=a(q,"interactedFormField");return w&&ad(w,v)||u}var n=/^https?:\/\//i,p={},r=[],t={ATTRIBUTE:"elementAttribute",CLASSES:"elementClasses",ELEMENT:"element",ID:"elementId",HISTORY_CHANGE_SOURCE:"historyChangeSource",HISTORY_NEW_STATE:"newHistoryState",HISTORY_NEW_URL_FRAGMENT:"newUrlFragment",HISTORY_OLD_STATE:"oldHistoryState",HISTORY_OLD_URL_FRAGMENT:"oldUrlFragment",TARGET:"elementTarget"};(function(q){Z.__aev=q;Z.__aev.b="aev";Z.__aev.g=!0;Z.__aev.priorityOverride=
0})(function(q){var v=q.vtp_gtmEventId,u=q.vtp_defaultValue,w=q.vtp_varType;switch(w){case "TAG_NAME":var y=a(v,"element");return y&&y.tagName||u;case "TEXT":return b(v,w,bd)||u;case "URL":var x;a:{var B=String(a(v,"elementUrl")||u||""),z=af(B),A=String(q.vtp_component||"URL");switch(A){case "URL":x=B;break a;case "IS_OUTBOUND":x=d(B,q.vtp_affiliatedDomains);break a;default:x=Ze(z,A,q.vtp_stripWww,q.vtp_defaultPages,q.vtp_queryKey)}}return x;case "ATTRIBUTE":var E;if(void 0===q.vtp_attribute)E=c(v,
w,u);else{var G=q.vtp_attribute,M=a(v,"element");E=M&&ad(M,G)||u||""}return E;case "MD":var P=q.vtp_mdValue,V=b(v,"MD",Tl);return P&&V?Wl(V,P)||u:V||u;case "FORM":return f(String(q.vtp_component||"SUBMIT_TEXT"),v,u);default:var Y=c(v,w,u);nm(Y,"aev",q.vtp_gtmEventId);return Y}})}();Z.a.gas=["google"],function(){(function(a){Z.__gas=a;Z.__gas.b="gas";Z.__gas.g=!0;Z.__gas.priorityOverride=0})(function(a){var b=m(a),c=b;c[Pb.Ea]=null;c[Pb.Xf]=null;var d=b=c;d.vtp_fieldsToSet=d.vtp_fieldsToSet||[];var e=d.vtp_cookieDomain;void 0!==e&&(d.vtp_fieldsToSet.push({fieldName:"cookieDomain",value:e}),delete d.vtp_cookieDomain);return b})}();
Z.a.hl=["google"],function(){function a(f){return f.target&&f.target.location&&f.target.location.href?f.target.location.href:am()}function b(f,h){Zc(f,"hashchange",function(k){var l=a(k);h({source:"hashchange",state:null,url:cm(l),R:bm(l)})})}function c(f,h){Zc(f,"popstate",function(k){var l=a(k);h({source:"popstate",state:k.state,url:cm(l),R:bm(l)})})}function d(f,h,k){var l=h.history,n=l[f];if(xa(n))try{l[f]=function(p,r,t){n.apply(l,[].slice.call(arguments,0));k({source:f,state:p,url:cm(am()),
R:bm(am())})}}catch(p){}}function e(){var f={source:null,state:W("history").state||null,url:cm(am()),R:bm(am())};return function(h){var k=f,l={};l[k.source]=!0;l[h.source]=!0;if(!l.popstate||!l.hashchange||k.R!=h.R){var n={event:"gtm.historyChange","gtm.historyChangeSource":h.source,"gtm.oldUrlFragment":f.R,"gtm.newUrlFragment":h.R,"gtm.oldHistoryState":f.state,"gtm.newHistoryState":h.state,"gtm.oldUrl":f.url,"gtm.newUrl":h.url};f=h;em(n)}}}(function(f){Z.__hl=f;Z.__hl.b="hl";Z.__hl.g=!0;Z.__hl.priorityOverride=
0})(function(f){var h=W("self");if(!jm("hl")){var k=e();b(h,k);c(h,k);d("pushState",h,k);d("replaceState",h,k);km("hl")}J(f.vtp_gtmOnSuccess)})}();
Z.a.awct=["google"],function(){var a=!1,b=[],c=function(h){var k=W("google_trackConversion"),l=h.gtm_onFailure;"function"==typeof k?k(h)||l():l()},d=function(){for(;0<b.length;)c(b.shift())},e=function(){return function(){d();a=!1}},f=function(){return function(){d();b={push:c};}};(function(h){Z.__awct=h;Z.__awct.b="awct";Z.__awct.g=!0;Z.__awct.priorityOverride=
0})(function(h){function k(){q("gdpr_consent",aj());}function l(){}function n(w){var y=!0;w&&l();y&&b.push(p)}Fh();var p={google_basket_transaction_type:"purchase",google_conversion_domain:"",google_conversion_id:h.vtp_conversionId,google_conversion_label:h.vtp_conversionLabel,google_conversion_value:h.vtp_conversionValue||
0,google_remarketing_only:!1,onload_callback:h.vtp_gtmOnSuccess,gtm_onFailure:h.vtp_gtmOnFailure,google_gtm:yi()};h.vtp_rdp&&(p.google_restricted_data_processing=!0);void 0!=dm(C.M)&&!1!==dm(C.M)&&(p.google_gtm_url_processor=function(w){return w=eh(w)});var r=function(w){return function(y,x,B){var z="DATA_LAYER"==w?dm(B):h[x];z&&(p[y]=z)}},t=r("JSON");t("google_conversion_currency",
"vtp_currencyCode");t("google_conversion_order_id","vtp_orderId");h.vtp_enableProductReporting&&(t=r(h.vtp_productReportingDataSource),t("google_conversion_merchant_id","vtp_awMerchantId","aw_merchant_id"),t("google_basket_feed_country","vtp_awFeedCountry","aw_feed_country"),t("google_basket_feed_language","vtp_awFeedLanguage","aw_feed_language"),t("google_basket_discount","vtp_discount","discount"),t("google_conversion_items","vtp_items","items"),p.google_conversion_items&&p.google_conversion_items.map&&
(p.google_conversion_items=p.google_conversion_items.map(function(w){return{value:w.price,quantity:w.quantity,item_id:w.id}})));var q=function(w,y){void 0!==y&&((p.google_additional_conversion_params=p.google_additional_conversion_params||{})[w]=y)},v=function(w){return function(y,x,B,z){var A="DATA_LAYER"==w?dm(B):h[x];z(A)&&q(y,A)}};h.vtp_transportUrl&&(p.google_transport_url=h.vtp_transportUrl);var u=ki(h.vtp_transportUrl,"/pagead/conversion_async.js");u||(u=-1==navigator.userAgent.toLowerCase().indexOf("firefox")?
"//www.googleadservices.com/pagead/conversion_async.js":"https://www.google.com/pagead/conversion_async.js");h.vtp_enableNewCustomerReporting&&(t=v(h.vtp_newCustomerReportingDataSource),t("vdnc","vtp_awNewCustomer","new_customer",function(w){return void 0!=w&&""!==w}),t("vdltv","vtp_awCustomerLTV","customer_lifetime_value",function(w){return void 0!=w&&""!==w}));!h.hasOwnProperty("vtp_enableConversionLinker")||h.vtp_enableConversionLinker?(h.vtp_conversionCookiePrefix&&(p.google_gcl_cookie_prefix=
h.vtp_conversionCookiePrefix),p.google_read_gcl_cookie_opt_out=!1):p.google_read_gcl_cookie_opt_out=!0;"1"===Zf(!1)._up&&q("gtm_up","1");k();(function(){rd()?Bd(function(){k();var w=yd(C.o),y=!w&&void 0!=dm(C.M)&&!1!==dm(C.M);!h.vtp_transportUrl&&y&&(p.google_transport_url="https://pagead2.googlesyndication.com/");q("gcs",zd());n(w);w||ud(function(){k();p=m(p);!h.vtp_transportUrl&&p.google_transport_url&&delete p.google_transport_url;q("gcs",zd());q("gcu","1");n(!0)},C.o)},[C.o]):n(!0)})();a||(a=
!0,O(u,f(),e(u)))})}();
Z.a.baut=["nonGoogleScripts"],function(){var a=!1;(function(b){Z.__baut=b;Z.__baut.b="baut";Z.__baut.g=!0;Z.__baut.priorityOverride=0})(function(b){var c=b.vtp_uetqName||"uetq",d=W(c,[],!0);if("VARIABLE_REVENUE"==b.vtp_eventType)d.push({gv:b.vtp_goalValue}),b.vtp_gtmOnSuccess();else if("CUSTOM"==b.vtp_eventType){var e={},f=function(h,k){void 0!==b[h]&&(e[k]=b[h])};f("vtp_goalValue","gv");f("vtp_eventCategory","ec");f("vtp_eventAction",
"ea");f("vtp_eventLabel","el");f("vtp_eventValue","ev");d.push(e);b.vtp_gtmOnSuccess()}else if(a)b.vtp_gtmOnSuccess();else try{O("//bat.bing.com/bat.js",function(){var h=wc(W("UET"),{ti:b.vtp_tagId,q:d});F[c]=h;h.push("pageLoad");b.vtp_gtmOnSuccess()},b.vtp_gtmOnFailure),a=!0}catch(h){J(b.vtp_gtmOnFailure)}})}();Z.a.smm=["google"],function(){(function(a){Z.__smm=a;Z.__smm.b="smm";Z.__smm.g=!0;Z.__smm.priorityOverride=0})(function(a){var b=a.vtp_input,c=Um(a.vtp_map,"key","value")||{},d=c.hasOwnProperty(b)?c[b]:a.vtp_defaultValue;nm(d,"smm",a.vtp_gtmEventId);return d})}();





Z.a.html=["customScripts"],function(){function a(d,e,f,h){return function(){try{if(0<e.length){var k=e.shift(),l=a(d,e,f,h);if("SCRIPT"==String(k.nodeName).toUpperCase()&&"text/gtmscript"==k.type){var n=H.createElement("script");n.async=!1;n.type="text/javascript";n.id=k.id;n.text=k.text||k.textContent||k.innerHTML||"";k.charset&&(n.charset=k.charset);var p=k.getAttribute("data-gtmsrc");p&&(n.src=p,Uc(n,l));d.insertBefore(n,null);p||l()}else if(k.innerHTML&&0<=k.innerHTML.toLowerCase().indexOf("<script")){for(var r=
[];k.firstChild;)r.push(k.removeChild(k.firstChild));d.insertBefore(k,null);a(k,r,l,h)()}else d.insertBefore(k,null),l()}else f()}catch(t){J(h)}}}var c=function(d){if(H.body){var e=
d.vtp_gtmOnFailure,f=om(d.vtp_html,d.vtp_gtmOnSuccess,e),h=f.fd,k=f.H;if(d.vtp_useIframe){}else d.vtp_supportDocumentWrite?b(h,k,e):a(H.body,cd(h),k,e)()}else Zl(function(){c(d)},
200)};Z.__html=c;Z.__html.b="html";Z.__html.g=!0;Z.__html.priorityOverride=0}();






Z.a.lcl=[],function(){function a(){var c=W("document"),d=0,e=function(f){var h=f.target;if(h&&3!==f.which&&!(f.eh||f.timeStamp&&f.timeStamp===d)){d=f.timeStamp;h=dd(h,["a","area"],100);if(!h)return f.returnValue;var k=f.defaultPrevented||!1===f.returnValue,l=El("lcl",k?"nv.mwt":"mwt",0),n;n=k?El("lcl","nv.ids",[]):El("lcl","ids",[]);if(n.length){var p=Al(h,"gtm.linkClick",n);if(b(f,h,c)&&!k&&l&&h.href){var r=String(mm(h,"rel")||""),t=!!Ba(r.split(" "),function(u){return"noreferrer"===u.toLowerCase()});
t&&D(36);var q=W((mm(h,"target")||"_self").substring(1)),v=!0;if(em(p,rl(function(){var u;if(u=v&&q){var w;a:if(t){var y;try{y=new MouseEvent(f.type)}catch(x){if(!c.createEvent){w=!1;break a}y=c.createEvent("MouseEvents");y.initEvent(f.type,!0,!0)}y.eh=!0;f.target.dispatchEvent(y);w=!0}else w=!1;u=!w}u&&(q.location.href=mm(h,"href"))}),l))v=!1;else return f.preventDefault&&f.preventDefault(),f.returnValue=!1}else em(p,function(){},l||2E3);return!0}}};Zc(c,"click",e,!1);Zc(c,"auxclick",e,!1)}function b(c,
d,e){if(2===c.which||c.ctrlKey||c.shiftKey||c.altKey||c.metaKey)return!1;var f=mm(d,"href"),h=f.indexOf("#"),k=mm(d,"target");if(k&&"_self"!==k&&"_parent"!==k&&"_top"!==k||0===h)return!1;if(0<h){var l=cm(f),n=cm(e.location);return l!==n}return!0}(function(c){Z.__lcl=c;Z.__lcl.b="lcl";Z.__lcl.g=!0;Z.__lcl.priorityOverride=0})(function(c){var d=void 0===c.vtp_waitForTags?!0:c.vtp_waitForTags,e=void 0===c.vtp_checkValidation?!0:c.vtp_checkValidation,f=Number(c.vtp_waitForTagsTimeout);if(!f||0>=f)f=2E3;
var h=c.vtp_uniqueTriggerId||"0";if(d){var k=function(n){return Math.max(f,n)};Dl("lcl","mwt",k,0);e||Dl("lcl","nv.mwt",k,0)}var l=function(n){n.push(h);return n};Dl("lcl","ids",l,[]);e||Dl("lcl","nv.ids",l,[]);jm("lcl")||(a(),km("lcl"));J(c.vtp_gtmOnSuccess)})}();


var Vo={};Vo.macro=function(a){if(xl.Rc.hasOwnProperty(a))return xl.Rc[a]},Vo.onHtmlSuccess=xl.Ge(!0),Vo.onHtmlFailure=xl.Ge(!1);Vo.dataLayer=Le;Vo.callback=function(a){ee.hasOwnProperty(a)&&xa(ee[a])&&ee[a]();delete ee[a]};function Wo(){L[Ud.B]=Vo;Na(fe,Z.a);Ib=Ib||xl;Jb=Vb}
function Xo(){gd.gtm_3pds=!0;gd.gtag_cs_api=!0;gd.tcf_restrictions=!0;L=F.google_tag_manager=F.google_tag_manager||{};Zi();if(L[Ud.B]){var a=L.zones;a&&a.unregisterChild(Ud.B);
}else{for(var b=data.resource||{},c=b.macros||[],d=0;d<c.length;d++)Ab.push(c[d]);for(var e=b.tags||[],f=0;f<e.length;f++)Db.push(e[f]);for(var h=b.predicates||[],k=0;k<h.length;k++)Cb.push(h[k]);for(var l=b.rules||[],n=0;n<l.length;n++){for(var p=l[n],r={},t=0;t<p.length;t++)r[p[t][0]]=Array.prototype.slice.call(p[t],1);Bb.push(r)}Fb=Z;Gb=Om;Wo();wl();rh=!1;sh=0;if("interactive"==H.readyState&&!H.createEventObject||
"complete"==H.readyState)uh();else{Zc(H,"DOMContentLoaded",uh);Zc(H,"readystatechange",uh);if(H.createEventObject&&H.documentElement.doScroll){var q=!0;try{q=!F.frameElement}catch(y){}q&&vh()}Zc(F,"load",uh)}Gk=!1;"complete"===H.readyState?Ik():Zc(F,"load",Ik);a:{
if(!Ae)break a;F.setInterval(Be,864E5);}ce=(new Date).getTime();}}
(function(a){a()})(Xo);

})()
