// Copyright 2017 Google Inc.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file or at
// https://developers.google.com/open-source/licenses/bsd

import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:recase/recase.dart';

import '../generator.dart';

/// Generator for Flutter pipe.
class PipeGenerator extends Generator {
  static const _templateFolder = 'pipe';
  static const _templateFileName = 'pipe.dart.mustache';

  /// Class name of this pipe.
  final String className;

  final String pipeName;

  /// Pipe file name without extension.
  final String targetName;

  PipeGenerator._(
      this.className, this.pipeName, this.targetName, String destinationFolder)
      : super(destinationFolder);

  factory PipeGenerator(
    ReCase classEntityName,
    String destinationFolder,
  ) {
    return new PipeGenerator._(
        classEntityName.camelCase,
        classEntityName.camelCase.toLowerCase(),
        classEntityName.snakeCase,
        destinationFolder);
  }

  // Gets a map from template file name to target file name.
  Map<String, String> _getTemplateTargetPaths() {
    var results = <String, String>{};

    results[path.join(_templateFolder, _templateFileName)] = "$targetName.dart";

    return results;
  }

  @override
  Future generate() async {
    await renderAndWriteTemplates(_getTemplateTargetPaths());
  }

  @override
  Map<String, String> toMap() {
    return {
      "className": className,
      "pipeName": pipeName,
      "targetName": targetName,
    };
  }
}
