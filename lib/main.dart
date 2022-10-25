import 'package:flutter/material.dart';
import 'package:population_app/widgets/country_item.dart';
import 'package:population_app/widgets/stamp_scroll.dart';
import 'package:provider/provider.dart';

import 'notifiers/country_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CountryNotifier(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
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
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                  child: Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.white,
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
                          return AlertDialog(
                            content: Column(
                              children: [
                                CountryItem(),
                                CountryItem(),
                                CountryItem(),
                              ],
                            ),
                          );
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
