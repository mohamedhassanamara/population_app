import 'package:flutter/material.dart';
import 'package:population_app/config.dart';
import 'package:population_app/notifiers/city_notifier.dart';
import 'package:population_app/widgets/stamp_widget.dart';
import 'package:population_app/widgets/waiting.dart';
import 'package:provider/provider.dart';

import '../services/favorites.dart';

class StampScroll extends StatefulWidget {

  @override
  State<StampScroll> createState() => _StampScrollState();
}

class _StampScrollState extends State<StampScroll> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CityNotifier>(context, listen: false).fetchCities();
    });
    Favorites().initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              itemCount: notifier.cities.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: StampWidget(
                    id: notifier.cities[index].name,
                    flag: notifier.cities[index].country,
                    city: notifier.cities[index].name,
                    year: notifier.cities[index].population.first['year'],
                    population: notifier.cities[index].population.first['value'],
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
    );
  }
}
