import 'dart:developer';
import 'package:flutter/foundation.dart';

void logger(String? message) {
  // ignore: avoid_print
  kDebugMode ? print(('$message')) : log('$message');
}
