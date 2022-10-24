import 'package:flutter/material.dart';
import 'package:population_app/widgets/stamp_scroll.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  Icon(
                    Icons.delete_forever,
                    size: 40,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
