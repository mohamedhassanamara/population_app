import 'package:population_app/config.dart';

import 'my_clipper.dart';
import 'package:flutter/material.dart';

class StampWidget extends StatelessWidget {
  const StampWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config(context).height * 0.3,
      width: Config(context).width * 0.4,
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          alignment: Alignment.center,
          color: Color(0xFFA6A6A6),
          child: Container(
            height: Config(context).height * 0.25,
            width: Config(context).width * 0.30,
            color: Color(0xFFD9D9D9),
            child: Text("f"),
          ),
        ),
      ),
    );
  }
}
