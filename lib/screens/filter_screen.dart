import 'package:flutter/material.dart';
import 'package:population_app/notifiers/city_notifier.dart';
import 'package:population_app/notifiers/filter_notifier.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../services/favorites.dart';
import 'package:population_app/config.dart';
import '../widgets/stamp_widget.dart';
import '../widgets/waiting.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
    Object? t = ModalRoute.of(context)?.settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'POPULATION\nAPP',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
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
                          .where((element) => element.country == t)
                          .toList()
                          .length,
                      itemBuilder: (BuildContext context, index) {
                        var cities = notifier.cities
                            .where((element) => element.country == t)
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
