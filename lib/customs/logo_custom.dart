import 'package:flutter/material.dart';
class LogoImage extends StatelessWidget {
  double height;
  double width;
  Color color;
   LogoImage({Key? key, required this.width,required this.height,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logohotstar.png', // Add your logo asset
      height: height,
      width: width,color: color,
    );
  }
}
