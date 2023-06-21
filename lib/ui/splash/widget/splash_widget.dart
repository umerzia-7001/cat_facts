import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/sizeConfig/size_config.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeightDp,
        width: SizeConfig.screenWidthDp,
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: SizeConfig.screenHeightDp,
              width: SizeConfig.screenWidthDp,
              // child: Center(
              //   child: SizedBox(
              //     width: SizeConfig.screenWidthDp! - 120,
              //     height: SizeConfig().sh(100).toDouble(),
              //     child: Center(
              //       child: SvgPicture.asset(
              //         "/".toSVG(),
              //         width: SizeConfig.screenWidthDp! - 120,
              //         height: SizeConfig().sh(100).toDouble(),
              //       ),
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
