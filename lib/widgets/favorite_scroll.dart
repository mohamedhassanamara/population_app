import 'package:flutter/Material.dart';
import 'package:population_app/widgets/stamp_widget.dart';
import 'package:population_app/widgets/basic/waiting.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notifiers/city_notifier.dart';
import 'package:population_app/config.dart';

class FavoriteScroll extends StatefulWidget {
  const FavoriteScroll({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScroll> createState() => _FavoriteScrollState();
}

class _FavoriteScrollState extends State<FavoriteScroll> {
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
    return SizedBox(
      height: Config(context).height * .7,
      child: Consumer<CityNotifier>(
        builder: (context, notifier, child) {
          if (notifier.isLoading) {
            return const Waiting();
          }
          if (notifier.empty) {
            return const Center(child: Text('No Data'));
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
              ),
            );
          }
        },
      ),
    );
  }
}
