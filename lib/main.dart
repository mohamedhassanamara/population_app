import 'package:flutter/material.dart';
import 'package:population_app/notifiers/city_notifier.dart';
import 'package:population_app/notifiers/filter_notifier.dart';
import 'package:population_app/widgets/bottom_navigation.dart';
import 'package:population_app/widgets/basic/my_divider.dart';
import 'package:population_app/widgets/stamp_scroll.dart';
import 'package:population_app/widgets/top_navigation.dart';
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
            TopNavigation(),
            MyDivider(),
            StampScroll(),
            MyDivider(),
            BottomNavigation(),
          ],
        ),
      ),
    );
  }
}
