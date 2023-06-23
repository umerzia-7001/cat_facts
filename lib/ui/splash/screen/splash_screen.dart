import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proarea_assignment/utils/helpers.dart';

import '../../home/screen/home.dart';
import '../widget/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      startNavigation();
    });
  }

  Future<void> startNavigation() async {
    context.setLocale(Locale(context.locale.toString(), ''));
    logger(Locale(context.locale.toString(), '').toString());
    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashWidget();
  }
}
