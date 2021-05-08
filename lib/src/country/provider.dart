import 'package:dio/dio.dart';

import '../src.dart';

class CountryProvider {
  static final DioClient _dio = DioClient(
    BaseOptions(baseUrl: 'https://restcountries.eu/rest/v2'),
    wantConnectivityCheck: false,
  );
  static Future<List<Country>> get getCountries async {
    final res = await _dio.get<List<dynamic>>('/all');
    final List<Country> _list =
        res.data!.map<Country>((e) => Country.fromJson(e)).toList();
    _list.sort((a, b) => a.firstChar.compareTo(b.firstChar));
    return _list;
  }

  static Future<Country> getCurrentCountry(int countryCode) async {
    final res = await _dio.get(
      '/alpha',
      queryParams: {'code': countryCode},
    );
    return Country.fromJson(res.data);
  }
}
