import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:localizationproject/language_cach_helper.dart';
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  Future<void> getSavedLanguage() async{
    final String cachedLanguageCode = await LanguageCacheHelper().getLanguageCode();
    emit(ChangeLocaleState(Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async{
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(Locale(languageCode)));
  }
}
