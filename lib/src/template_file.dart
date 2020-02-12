// Copyright 2017 Google Inc.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file or at
// https://developers.google.com/open-source/licenses/bsd

import 'dart:async';
import 'dart:io';
import "dart:convert" show utf8;

// import 'package:analyzer/file_system/file_system.dart';
import 'package:reflected_mustache/mustache.dart';
// import 'package:resource/resource.dart' show Resource;

import 'path_util.dart';

/// Template file class wrapping operations on mustache template.
class TemplateFile {
  /// Template file path relative to templates/.
  final String _path;

  /// Data for this template.
  final dynamic _data;

  TemplateFile(this._path, this._data);

  /// Renders template file on [_path] with values from [_data].
  Future<String> renderString() async {
    var uri =
        fixUri('lib/templates/$_path'); //package:ngflutter/templates/$_path
    print("Uri: $uri");
    var resource = new File(uri);
    var content = await resource.readAsString(encoding: utf8);
    var template = new Template(content);
    print("_data: $_data");
    return template.renderString(_data);
  }
}

// var template = new Template(source, name: 'template-filename.html');

//   final String output = template.renderString(
//     {'className': 'FlutterWidget'},
//   );
