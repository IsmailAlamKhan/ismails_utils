import 'package:dio/dio.dart';

import '../src.dart';

class CountryProvider {
  /// dio instance to make the http calls
  static final DioClient _dio = DioClient(
    BaseOptions(baseUrl: 'https://restcountries.eu/rest/v2'),
    wantConnectivityCheck: false,
  );

  /// get of list of countries from 'https://restcountries.eu/rest/v2/all'
  /// this will throw [IsmailException.fromDioError] on error
  static Future<List<Country>> get getCountries async {
    final res = await _dio.get<List<dynamic>>('/all');
    final List<Country> _list =
        res.data!.map<Country>((e) => Country.fromJson(e)).toList();
    _list.sort((a, b) => a.firstChar.compareTo(b.firstChar));
    return _list;
  }

  /// get country by code from 'https://restcountries.eu/rest/v2/alpha/code={code}'
  /// this will throw [IsmailException.fromDioError] on error
  static Future<Country> getCurrentCountry(int countryCode) async {
    final res = await _dio.get(
      '/alpha',
      queryParams: {'code': countryCode},
    );
    return Country.fromJson(res.data);
  }
}
