
import 'package:flutter/Material.dart';
import 'package:population_app/widgets/basic/waiting.dart';
import 'package:provider/provider.dart';

import '../notifiers/country_notifier.dart';
import 'country_item.dart';

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
