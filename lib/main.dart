import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                alignment: Alignment.center,
                color: Colors.black12,
                child: Container(

                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.30,
                  color: Colors.grey,
                  child: Text("f"),
                )
              ),),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: const Text("abc"),
              )),
        ),
      ]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double smallLineLength = size.width / 7;
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
    // path.lineTo(smallLineLength*2, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
