import 'package:flutter_svg/svg.dart';
import 'package:population_app/config.dart';

import 'my_clipper.dart';
import 'package:flutter/material.dart';

class StampWidget extends StatelessWidget {
  final String flag;
  final String city;
  final String population;
  final String year;
  StampWidget(
      {required this.flag,
      required this.population,
      required this.city,
      required this.year});

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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SvgPicture.network(
                        flag,
                        width: 30,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: Config(context).width * 0.15,
                      child: FittedBox(
                        child: Text(
                          city,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Population',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  population,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      year,
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
