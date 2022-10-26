import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:population_app/config.dart';
import 'package:population_app/services/favorites.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_clipper.dart';
import 'package:flutter/material.dart';

class FStampWidget extends StatefulWidget {
  final String flag;
  final String city;
  final String id;
  final String population;
  final String year;
  FStampWidget(
      {required this.flag,
        required this.id,
        required this.population,
        required this.city,
        required this.year}){
  }

  @override
  State<FStampWidget> createState() => _FStampWidgetState();
}

class _FStampWidgetState extends State<FStampWidget> {
  bool isFavorite = false;

  void checkFavorite() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites =  prefs.getStringList('favorite')?? [];
    setState(() {
      isFavorite = favorites.contains(widget.id);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    checkFavorite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return isFavorite?GestureDetector(
      onLongPress: () {
        Favorites().changeFavorite(widget.id);
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: SizedBox(
        height: Config(context).height * 0.3,
        width: Config(context).width * 0.4,
        child: ClipPath(
          clipper: MyClipper(),
          child: Container(
            alignment: Alignment.center,
            color:
            isFavorite ? CupertinoColors.systemYellow : Color(0xFFA6A6A6),
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
                          widget.flag,
                          width: 30,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: Config(context).width * 0.15,
                        child: FittedBox(
                          child: Text(
                            widget.city,
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
                    widget.population,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        child: Icon(
                          Icons.star,
                          color: CupertinoColors.systemYellow,
                          size: 25,
                        ),
                        visible: isFavorite,
                      ),
                      Text(
                        widget.year,
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
      ),
    ):Text('gg');
  }
}
