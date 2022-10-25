import 'package:flutter/material.dart';
import 'package:population_app/screens/country_list.dart';
import 'package:population_app/widgets/stamp_scroll.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
                              children: <Widget>[
                                Positioned(
                                  right: -40.0,
                                  top: -40.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.close),
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          child: Text("Submitß"),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
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
