import '../src.dart';

/// [Country]  class this extends the [AlphabetListViewModel] so you can
/// use the [AlphabetListView] with this
class Country extends AlphabetListViewModel {
  Country({
    required String name,
    this.topLevelDomain,
    this.alpha2Code,
    this.alpha3Code,
    this.callingCodes,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.population,
    this.latlng,
    this.demonym,
    this.area,
    this.gini,
    this.timezones,
    this.borders,
    this.nativeName,
    this.numericCode,
    this.currencies,
    this.languages,
    this.translations,
    this.flag,
    this.regionalBlocs,
    this.cioc,
  }) : super(name: name);

  List<String>? topLevelDomain;
  String? alpha2Code;
  String? alpha3Code;
  List<String>? callingCodes;
  String? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  num? population;
  List<num>? latlng;
  String? demonym;
  num? area;
  double? gini;
  List<String>? timezones;
  List<String>? borders;
  String? nativeName;
  String? numericCode;
  List<Currency>? currencies;
  List<Language>? languages;
  Translations? translations;
  String? flag;
  List<RegionalBloc>? regionalBlocs;
  String? cioc;
  bool isShowSuspension = false;

  Country copyWith({
    String? name,
    List<String>? topLevelDomain,
    String? alpha2Code,
    String? alpha3Code,
    List<String>? callingCodes,
    String? capital,
    List<String>? altSpellings,
    String? region,
    String? subregion,
    num? population,
    List<num>? latlng,
    String? demonym,
    num? area,
    double? gini,
    List<String>? timezones,
    List<String>? borders,
    String? nativeName,
    String? numericCode,
    List<Currency>? currencies,
    List<Language>? languages,
    Translations? translations,
    String? flag,
    List<RegionalBloc>? regionalBlocs,
    String? cioc,
  }) =>
      Country(
        name: name ?? this.name,
        topLevelDomain: topLevelDomain ?? this.topLevelDomain,
        alpha2Code: alpha2Code ?? this.alpha2Code,
        alpha3Code: alpha3Code ?? this.alpha3Code,
        callingCodes: callingCodes ?? this.callingCodes,
        capital: capital ?? this.capital,
        altSpellings: altSpellings ?? this.altSpellings,
        region: region ?? this.region,
        subregion: subregion ?? this.subregion,
        population: population ?? this.population,
        latlng: latlng ?? this.latlng,
        demonym: demonym ?? this.demonym,
        area: area ?? this.area,
        gini: gini ?? this.gini,
        timezones: timezones ?? this.timezones,
        borders: borders ?? this.borders,
        nativeName: nativeName ?? this.nativeName,
        numericCode: numericCode ?? this.numericCode,
        currencies: currencies ?? this.currencies,
        languages: languages ?? this.languages,
        translations: translations ?? this.translations,
        flag: flag ?? this.flag,
        regionalBlocs: regionalBlocs ?? this.regionalBlocs,
        cioc: cioc ?? this.cioc,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'],
        topLevelDomain: List<String>.from(json['topLevelDomain'].map((x) => x)),
        alpha2Code: json['alpha2Code'],
        alpha3Code: json['alpha3Code'],
        callingCodes: List<String>.from(json['callingCodes'].map((x) => x)),
        capital: json['capital'],
        altSpellings: List<String>.from(json['altSpellings'].map((x) => x)),
        region: json['region'],
        subregion: json['subregion'],
        population: json['population'],
        latlng: List<num>.from(json['latlng'].map((x) => x)),
        demonym: json['demonym'],
        area: json['area'],
        gini: json['gini']?.toDouble(),
        timezones: List<String>.from(json['timezones'].map((x) => x)),
        borders: List<String>.from(json['borders'].map((x) => x)),
        nativeName: json['nativeName'],
        numericCode: json['numericCode'],
        currencies: List<Currency>.from(
            json['currencies'].map((x) => Currency.fromJson(x))),
        languages: List<Language>.from(
            json['languages'].map((x) => Language.fromJson(x))),
        translations: Translations.fromJson(json['translations']),
        flag: json['flag'],
        regionalBlocs: List<RegionalBloc>.from(
            json['regionalBlocs'].map((x) => RegionalBloc.fromJson(x))),
        cioc: json['cioc'],
      );
}

class Currency {
  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  String? code;
  String? name;
  String? symbol;

  Currency copyWith({
    String? code,
    String? name,
    String? symbol,
  }) =>
      Currency(
        code: code ?? this.code,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
      );

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json['code'],
        name: json['name'],
        symbol: json['symbol'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'symbol': symbol,
      };
}

class Language {
  Language({
    this.iso6391,
    this.iso6392,
    this.name,
    this.nativeName,
  });

  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Language copyWith({
    String? iso6391,
    String? iso6392,
    String? name,
    String? nativeName,
  }) =>
      Language(
        iso6391: iso6391 ?? this.iso6391,
        iso6392: iso6392 ?? this.iso6392,
        name: name ?? this.name,
        nativeName: nativeName ?? this.nativeName,
      );

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        iso6391: json['iso639_1'],
        iso6392: json['iso639_2'],
        name: json['name'],
        nativeName: json['nativeName'],
      );

  Map<String, dynamic> toJson() => {
        'iso639_1': iso6391,
        'iso639_2': iso6392,
        'name': name,
        'nativeName': nativeName,
      };
}

class RegionalBloc {
  RegionalBloc({
    this.acronym,
    this.name,
    this.otherAcronyms,
    this.otherNames,
  });

  String? acronym;
  String? name;
  List<dynamic>? otherAcronyms;
  List<dynamic>? otherNames;

  RegionalBloc copyWith({
    String? acronym,
    String? name,
    List<dynamic>? otherAcronyms,
    List<dynamic>? otherNames,
  }) =>
      RegionalBloc(
        acronym: acronym ?? this.acronym,
        name: name ?? this.name,
        otherAcronyms: otherAcronyms ?? this.otherAcronyms,
        otherNames: otherNames ?? this.otherNames,
      );

  factory RegionalBloc.fromJson(Map<String, dynamic> json) => RegionalBloc(
        acronym: json['acronym'],
        name: json['name'],
        otherAcronyms: json['otherAcronyms']?.map((x) => x).toList(),
        otherNames: json['otherNames']?.map((x) => x)?.toList(),
      );

  Map<String, dynamic> toJson() => {
        'acronym': acronym,
        'name': name,
        'otherAcronyms': otherAcronyms?.map((x) => x).toList(),
        'otherNames': otherNames?.map((x) => x).toList(),
      };
}

class Translations {
  Translations({
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
  });

  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;

  Translations copyWith({
    String? de,
    String? es,
    String? fr,
    String? ja,
    String? it,
    String? br,
    String? pt,
    String? nl,
    String? hr,
    String? fa,
  }) =>
      Translations(
        de: de ?? this.de,
        es: es ?? this.es,
        fr: fr ?? this.fr,
        ja: ja ?? this.ja,
        it: it ?? this.it,
        br: br ?? this.br,
        pt: pt ?? this.pt,
        nl: nl ?? this.nl,
        hr: hr ?? this.hr,
        fa: fa ?? this.fa,
      );

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        de: json['de'],
        es: json['es'],
        fr: json['fr'],
        ja: json['ja'],
        it: json['it'],
        br: json['br'],
        pt: json['pt'],
        nl: json['nl'],
        hr: json['hr'],
        fa: json['fa'],
      );

  Map<String, dynamic> toJson() => {
        'de': de,
        'es': es,
        'fr': fr,
        'ja': ja,
        'it': it,
        'br': br,
        'pt': pt,
        'nl': nl,
        'hr': hr,
        'fa': fa,
      };
}
