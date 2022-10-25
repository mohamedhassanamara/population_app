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
            height: Config(context).height * 0.27,
            width: Config(context).width * 0.35,
            color: Color(0xFFD9D9D9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                    ),
                    SizedBox(
                      width: Config(context).width * 0.15,
                      child: Text(
                        'Tunis',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'data',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '4700000',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Text(
                      '2017',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
