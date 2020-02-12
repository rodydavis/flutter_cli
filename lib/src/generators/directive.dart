// Copyright 2017 Google Inc.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file or at
// https://developers.google.com/open-source/licenses/bsd

import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:recase/recase.dart';

import '../generator.dart';

/// Generator for Flutter directive.
class DirectiveGenerator extends Generator {
  static const _templateFolder = 'directive';
  static const _templateFileName = 'directive.dart.mustache';

  /// Class name of this directive.
  final String className;

  final String selector;

  /// Directive file name without extension.
  final String targetName;

  DirectiveGenerator._(
      this.className, this.selector, this.targetName, String destinationFolder)
      : super(destinationFolder);

  factory DirectiveGenerator(
    ReCase classEntityName,
    String destinationFolder,
  ) {
    return new DirectiveGenerator._(
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
      "selector": selector,
      "targetName": targetName,
    };
  }
}
