import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Country>>(
        future: CountryProvider.getCountries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return AlphabetListView<Country>(
            list: snapshot.data!,
            itemBuilder: (context, list, item, index) => ListTile(
              title: Text(item.name),
            ),
          );
        },
      ),
    );
  }
}
