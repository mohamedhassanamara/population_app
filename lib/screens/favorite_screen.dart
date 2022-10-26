import 'package:flutter/material.dart';
import 'package:population_app/notifiers/city_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'package:population_app/config.dart';
import '../widgets/stamp_widget.dart';
import '../widgets/waiting.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var favorite = [];
  void checkFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorite') ?? [];
    setState(() {
      favorite = favorites;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CityNotifier>(context, listen: false).fetchCities();
    });
    checkFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'POPULATION\nAtP',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    child: Icon(
                      Icons.favorite,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
            ),
            SizedBox(
              height: Config(context).height * .7,
              child: Consumer<CityNotifier>(
                builder: (context, notifier, child) {
                  if (notifier.isLoading) {
                    return Waiting();
                  }
                  if (notifier.empty) {
                    return Text('data');
                  } else {
                    return GridView.builder(
                      itemCount: notifier.cities
                          .where((element) => favorite.contains(element.name))
                          .toList()
                          .length,
                      itemBuilder: (BuildContext context, index) {
                        var cities = notifier.cities
                            .where((element) => favorite.contains(element.name))
                            .toList();
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: StampWidget(
                            id: cities[index].name,
                            flag: cities[index].country,
                            city: cities[index].name,
                            year: cities[index].population.first['year'],
                            population: cities[index].population.first['value'],
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                      ),
                    );
                  }
                },
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FilterDialog();
                        },
                      );
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_alt_sharp,
                          size: 40,
                        ),
                        Text(
                          'Filter By Country',
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(
                      Icons.close,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
