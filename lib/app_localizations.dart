import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations{
  final Locale? locale;
  static LocalizationsDelegate<AppLocalizations> delegate =
    _AppLocalizationsDelegate();
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  late Map<String, String> _localizedStrings;
  Future loadJsonLanguage() async{
    final jsonString = await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizedStrings[key] ?? "";
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async{
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
  
}

extension TranslateX on String{
  String tr(BuildContext context){
    return AppLocalizations.of(context)!.translate(this);
  }
}