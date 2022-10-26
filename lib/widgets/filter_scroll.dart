import 'package:flutter/Material.dart';
import 'package:population_app/widgets/stamp_widget.dart';
import 'package:population_app/widgets/basic/waiting.dart';
import 'package:provider/provider.dart';

import '../notifiers/city_notifier.dart';
import 'package:population_app/config.dart';

class FilterScroll extends StatefulWidget {
  const FilterScroll({
    Key? key,
    required this.country,
  }) : super(key: key);

  final Object? country;

  @override
  State<FilterScroll> createState() => _FilterScrollState();
}

class _FilterScrollState extends State<FilterScroll> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CityNotifier>(context, listen: false).fetchCities();
    });
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
              itemCount: notifier.cities
                  .where((element) => element.country == widget.country)
                  .toList()
                  .length,
              itemBuilder: (BuildContext context, index) {
                var cities = notifier.cities
                    .where((element) => element.country == widget.country)
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
    );
  }
}
