// function hook() {
//     bypass_korea();
//     bypass_testKeys();
//     bypass_superUser();
//     bypass_emulator_goldFish();
//     bypass_adbEnabled();
//     bypass_VPN_tun0_ppp0();
//     bypass_proxy();
// }

// function bypass_korea() {
//     Java.perform(function () {
//         console.log("bypass Korean");
//         var Locale = Java.use("java.util.Locale").getLanguage.overload("java.lang.String");
//         try {
//             Locale.implementation = function () {
//                 return "ko";
//             };
//         } catch (e) {
//             console.error("Error in bypass_korea: " + e);
//         }
//     });
// }

// function bypass_testKeys() {
//     Java.perform(function () {
//         console.log("bypass_testKeys called");
//         var contains = Java.use("java.lang.String").contains.overload("java.lang.CharSequence");
//         try {
//             contains.implementation = function (compareStr) {
//                 if (compareStr.includes("test-keys")) {
//                     return false;
//                 }
//                 return contains.call(this, compareStr);
//             };
//         } catch (e) {
//             console.error("Error in bypass_testKeys: " + e);
//         }
//     });
// }

// function bypass_superUser() {
//     Java.perform(function () {
//         console.log("bypass_superUser called");
//         var fileClass = Java.use("java.io.File").$init.overload("java.lang.String");
//         try {
//             fileClass.implementation = function (pathname) {
//                 // Check for common root-related paths
//                 if (pathname.includes("Superuser.apk")) {
//                     return fileClass.call(this, "/nothing");
//                 }
//                 return fileClass.call(this, pathname);
//             };
//         } catch (e) {
//             console.error("Error in bypass_superUser: " + e);
//         }
//     });
// }

// function bypass_emulator_goldFish() {
//     Java.perform(function () {
//         console.log("bypass_emulator_goldFish called");
//         var indexof = Java.use("java.lang.String").indexOf.overload("java.lang.String");
//         try {
//             indexof.implementation = function (compareStr) {
//                 // Handle common emulator-related keywords
//                 if (compareStr.includes("goldfish")) {
//                     return -1; // Return -1 to indicate not found
//                 }
//                 return indexof.call(this, compareStr);
//             };
//         } catch (e) {
//             console.error("Error in bypass_emulator_goldFish: " + e);
//         }
//     });
// }

// function bypass_adbEnabled() {
//     Java.perform(function () {
//         console.log("bypass_adbEnabled called");
//         var getInt = Java.use("android.provider.Settings$Secure").getInt.overload("android.content.ContentResolver", "java.lang.String", "int");
//         try {
//             getInt.implementation = function (resolver, name, def) {
//                 if (name == "adb_enabled") {
//                     return 0; // Always return 0 (ADB disabled)
//                 }
//                 return getInt.call(this, resolver, name, def);
//             };
//         } catch (e) {
//             console.error("Error in bypass_adbEnabled: " + e);
//         }
//     });
// }

// function bypass_VPN_tun0_ppp0() {
//     Java.perform(function () {
//         console.log("bypass_VPN_tun0_ppp0 called");
//         var equals = Java.use("java.lang.String").equals.overload("java.lang.Object");
//         try {
//             equals.implementation = function (compareStr) {
//                 // Handle multiple VPN interfaces
//                 if (compareStr.includes("tun0") || compareStr.includes("ppp0")) {
//                     return false;
//                 }
//                 return equals.call(this, compareStr);
//             };
//         } catch (e) {
//             console.error("Error in bypass_VPN_tun0_ppp0: " + e);
//         }
//     });
// }

// function bypass_proxy() {
//     Java.perform(function () {
//         console.log("bypass_proxy called");
//         var getProperty = Java.use("java.lang.System").getProperty.overload("java.lang.String");
//         try {
//             getProperty.implementation = function (key) {
//                 // Extend to handle HTTP and HTTPS proxies
//                 if (key.includes("http.proxy")) {
//                     return null; // No proxy detected
//                 }
//                 return getProperty.call(system, key);
//             };
//         } catch (e) {
//             console.error("Error in bypass_proxy: " + e);
//         }
//     });
// }

// hook();
function hook(){
	bypassLocale();
	bypassRootDetection1();
	bypassRootDetection2();
	bypassEmulatorDetection();

	bypassADBDetection();
	bypassVPNDetection();
	bypassProxyDetection();
}

function bypassLocale(){
	Java.perform(function(){
		var getLanguage = Java.use("java.util.Locale").getLanguage.overload();
		getLanguage.implementation = function(){
			return "ko";
		}
	});
}

function bypassRootDetection1(){
	Java.perform(function() {
		var contains = Java.use("java.lang.String").contains.overload("java.lang.CharSequence");
		contains.implementation = function(compareStr){
			if(compareStr == "test-keys"){
				return false;
			}
			return contains.call(this, compareStr);
		}
	});
}

function bypassRootDetection2(){
	Java.perform(function(){
		var fileClass = Java.use("java.io.File").$init.overload("java.lang.String");
		fileClass.implementation = function(pathname){
			if(pathname == "/system/app/Superuser.apk"){
				return fileClass.call(this, "/nothing");
			}
			return fileClass.call(this, pathname);
		}
	});
}

function bypassEmulatorDetection(){
	Java.perform(function(){
		var indexof = Java.use("java.lang.String").indexOf.overload("java.lang.String");
		indexof.implementation = function(compareStr){
			if(compareStr == "goldfish"){
				return Java.use("int").$new(-1);
			}
			return indexof.call(this, compareStr);
		}
	});
}

function bypassADBDetection(){
	Java.perform(function(){
		var Secure = Java.use("android.provider.Settings$Secure");
		var getInt = Secure.getInt.overload("android.content.ContentResolver", "java.lang.String", "int");
		getInt.implementation = function(resolver, name, def){
			if(name == "adb_enabled"){
				return Java.use("int").$new(0);
			}
			return getInt.call(this, resolver, name, def);
		}
	});
}

function bypassVPNDetection(){
	Java.perform(function(){
		var equals = Java.use("java.lang.String").equals.overload("java.lang.Object");
		equals.implementation = function(compareStr){
			if(compareStr == "tun0" || compareStr == "ppp0"){
				return false;
			}
			return equals.call(this, compareStr);
		}
	});
}

function bypassProxyDetection(){
	Java.perform(function(){
		var system = Java.use("java.lang.System");
		var getProperty = system.getProperty.overload("java.lang.String");
		getProperty.implementation = function(key){
			if(key == "http.proxyHost" || key == "http.proxyPort"){
				return null;
			}
			return getProperty.call(system, key);
		}
	});
}

hook();