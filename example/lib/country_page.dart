import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late final Future<List<Country>> future = CountryProvider.getCountries;
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
            headerBuilder: (context, stuckAmount, alphabet) {
              return Card(
                color: Color.lerp(Colors.white, Colors.black, stuckAmount),
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(),
                child: Center(
                  child: Text(
                    alphabet,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Color.lerp(
                            Colors.black,
                            Colors.white,
                            stuckAmount,
                          ),
                        ),
                  ),
                ),
              );
            },
            sideBarItemBuilder: (context, isActive, item) => Text(item),
            itemBuilder: (context, list, item, index) => ListTile(
              title: Text(item.name),
            ),
          );
        },
      ),
    );
  }
}
