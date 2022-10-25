import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double smallLineLength = size.width / 15;
    Path path = Path();
    for (int i = 1; i <= 20; i += 2) {
      path.lineTo(0, smallLineLength * (i));
      path.arcToPoint(Offset(0, smallLineLength * (i + 1)),
          radius: Radius.circular(5));
    }
    for (int i = 1; i <= 20; i += 2) {
      path.lineTo(smallLineLength * i, size.height);
      path.arcToPoint(Offset(smallLineLength * (i + 1), size.height),
          radius: Radius.circular(5));
    }
    for (int i = 1; i <= 20; i += 2) {
      path.lineTo(size.width, size.height - smallLineLength * (i));
      path.arcToPoint(
          Offset(size.width, size.height - smallLineLength * (i + 1)),
          radius: Radius.circular(5));
    }
    for (int i = 1; i <= 20; i += 2) {
      path.lineTo(size.width - smallLineLength * (i), 0);
      path.arcToPoint(Offset(size.width - smallLineLength * (i + 1), 0),
          radius: Radius.circular(5));
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
