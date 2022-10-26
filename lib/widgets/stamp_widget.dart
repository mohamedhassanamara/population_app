import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:population_app/config.dart';
import 'package:population_app/services/favorites.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'basic/my_clipper.dart';
import 'package:flutter/material.dart';

class StampWidget extends StatefulWidget {
  final String flag;
  final String city;
  final String id;
  final String population;
  final String year;
  const StampWidget(
      {super.key, required this.flag,
      required this.id,
      required this.population,
      required this.city,
      required this.year});

  @override
  State<StampWidget> createState() => _StampWidgetState();
}

class _StampWidgetState extends State<StampWidget> {
  bool isFavorite = false;

  void checkFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorite') ?? [];
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
    return GestureDetector(
      onLongPress: () {
        Favorites.changeFavorite(widget.id);
        setState(() {
          isFavorite = true;
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
                isFavorite ? CupertinoColors.systemYellow : const Color(0xFFA6A6A6),
            child: Container(
              height: Config(context).height * 0.27,
              width: Config(context).width * 0.35,
              color: const Color(0xFFD9D9D9),
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
                        height: Config(context).width * 0.1,
                        child: AutoSizeText(
                          maxLines: 4,
                          widget.city,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const FittedBox(
                    child: Text(
                      'Population',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text( 
                      widget.population,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Favorites.changeFavorite(widget.id);
                          setState(() {
                            isFavorite = false;
                          });
                        },
                        child: Visibility(
                          visible: isFavorite,
                          child: const Icon(
                            Icons.star,
                            color: CupertinoColors.systemYellow,
                            size: 25,
                          ),
                        ),
                      ),
                      Text(
                        widget.year,
                        style: const TextStyle(
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
    );
  }
}
