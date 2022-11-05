import 'package:flutter/material.dart';
import 'package:sumer_gif/app.dart';
import 'package:sumer_gif/core/di/di.dart';

void main() {
  DI.setup();
  runApp(const MyApp());
}
