// // import 'dart:collection';
// // import 'dart:convert';
// // import 'dart:async';
// // import 'dart:io';
// // import 'dart:math';

// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:fn_browser_web/screens/settings.dart';
// // import 'package:flutter_browser/models/web_archive_model.dart';

// // import 'package:shared_preferences/shared_preferences.dart';

// // import 'package:flutter_browser/models/webview_model.dart';
// // import 'package:flutter_browser/webview_tab.dart';

// class BrowserSettings {
//   bool homePageEnabled;
//   String customUrlHomePage;
//   bool debuggingEnabled;

//   BrowserSettings(
//       {this.homePageEnabled = false,
//       this.customUrlHomePage = "",
//       this.debuggingEnabled = false});

//   BrowserSettings copy() {
//     return BrowserSettings(
//         homePageEnabled: homePageEnabled,
//         customUrlHomePage: customUrlHomePage,
//         debuggingEnabled: debuggingEnabled);
//   }

//   static BrowserSettings fromMap(Map<String, dynamic> map) {
//     return map != null
//         ? BrowserSettings(
//             homePageEnabled: map["homePageEnabled"],
//             customUrlHomePage: map["customUrlHomePage"],
//             debuggingEnabled: map["debuggingEnabled"])
//         : null;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "homePageEnabled": homePageEnabled,
//       "customUrlHomePage": customUrlHomePage,
//       "debuggingEnabled": debuggingEnabled
//     };
//   }

//   Map<String, dynamic> toJson() {
//     return toMap();
//   }

//   @override
//   String toString() {
//     return toMap().toString();
//   }
// }
