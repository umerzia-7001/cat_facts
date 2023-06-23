import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

void logger(String? message) {
  // ignore: avoid_print
  kDebugMode ? print(('$message')) : log('$message');
}

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat.yMd().add_jm();
  return formatter.format(dateTime);
}

String loadNonCachedImage(String imageUrl) {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  return '$imageUrl?timestamp=$timestamp'; // otherwise NetworkImage caches the url to produce same image on reload
}
