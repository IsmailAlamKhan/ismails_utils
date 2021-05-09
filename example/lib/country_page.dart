import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late Future<List<Country>> future = CountryProvider.getCountries;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Country>>(
        future: future,
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
