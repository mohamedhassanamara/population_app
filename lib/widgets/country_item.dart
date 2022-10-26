import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../config.dart';

class CountryItem extends StatelessWidget {
  final String flag;
  final String name;
  CountryItem({required this.flag, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
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
                name,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
