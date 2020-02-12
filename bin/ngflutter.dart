// Copyright 2017 Google Inc.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file or at
// https://developers.google.com/open-source/licenses/bsd

import 'dart:async';
import 'dart:io';

import 'package:ngflutter/src/command_runner.dart';
import 'package:args/command_runner.dart';

// Future main(List<String> args) async {
//   var runner = new NgDartCommanderRunner();

//   try {
//     await runner.run(args);
//   } on UsageException catch (error) {
//     print(error);
//     print(runner.usage);
//     // Exit code 64 indicates a usage error.
//     Future.wait([stdout.close(), stderr.close()]).then((_) => exit(64));
//   }
// }

void main(List<String> arguments) {
  // 0 = Success
  // 1 = Warnings
  // 2 = Errors
  exitCode = 0;
  var runner = NgDartCommanderRunner();
  runner.run(arguments).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64); // Exit code 64 indicates a usage error.
  });
}
