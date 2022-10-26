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
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            width: Config(context).width * 0.2,
            child: FittedBox(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
