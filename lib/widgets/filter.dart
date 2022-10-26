import 'package:flutter/Material.dart';

import 'filter_dialog.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
    );
  }
}