import 'package:flutter/material.dart';
import 'package:population_app/config.dart';
import 'package:population_app/widgets/stamp_widget.dart';

class StampScroll extends StatelessWidget {
  const StampScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config(context).height * .7,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StampWidget(),
                StampWidget(),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StampWidget(),
                StampWidget(),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StampWidget(),
                StampWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
