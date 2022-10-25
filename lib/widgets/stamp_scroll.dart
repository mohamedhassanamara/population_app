import 'package:flutter/material.dart';
import 'package:population_app/config.dart';
import 'package:population_app/notifiers/country_notifier.dart';
import 'package:population_app/widgets/stamp_widget.dart';
import 'package:population_app/widgets/waiting.dart';
import 'package:provider/provider.dart';

class StampScroll extends StatefulWidget {
  const StampScroll({
    Key? key,
  }) : super(key: key);

  @override
  State<StampScroll> createState() => _StampScrollState();
}

class _StampScrollState extends State<StampScroll> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CountryNotifier>(context, listen: false).fetchCountries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config(context).height * .7,
      child: Consumer<CountryNotifier>(
        builder: (context, notifier, child) {
          if (notifier.isLoading) {
            return Waiting();
          }
          if (notifier.empty) {
            return Text('data');
          } else {
            return GridView.builder(
              itemCount: notifier.countries.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: StampWidget(
                    flag: notifier.countries[index].country,
                    city: notifier.countries[index].name,
                    year: notifier.countries[index].population.first['year'],
                    population: notifier.countries[index].population.first['value'],
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
