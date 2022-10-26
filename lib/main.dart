import 'package:flutter/material.dart';
import 'package:population_app/notifiers/city_notifier.dart';
import 'package:population_app/notifiers/filter_notifier.dart';
import 'package:population_app/screens/favorite_screen.dart';
import 'package:population_app/screens/filter_screen.dart';
import 'package:population_app/widgets/country_item.dart';
import 'package:population_app/widgets/stamp_scroll.dart';
import 'package:population_app/widgets/waiting.dart';
import 'package:provider/provider.dart';

import 'notifiers/country_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CityNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                  'POPULATION\nAPP',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => FavoriteScreen(),
                    ),);
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
            StampScroll(),
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

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CountryNotifier>(context, listen: false).fetchCountries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryNotifier>(
      builder: (context, notifier, child) {
        if (notifier.isLoading) return Waiting();
        if (notifier.empty)
          return Text('empty');
        else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return CountryItem(
                flag: notifier.countries[index].flag,
                name: notifier.countries[index].name,
              );
            },
            itemCount: notifier.countries.length,
          );
        }
      },
    );
  }
}
