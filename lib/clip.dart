import 'package:flutter/material.dart';

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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'POPULATION\nAPP',
                      style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
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
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 5,),
                  ),
                  child: Text('fff'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
