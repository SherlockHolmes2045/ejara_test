import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ejara_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(const EjaraApp());
    }),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
