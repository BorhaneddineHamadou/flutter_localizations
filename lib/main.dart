import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localizationproject/cubit/locale_cubit.dart';
import 'package:localizationproject/screens/home_screen.dart';

import 'app_localizations.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LocaleCubit()..getSavedLanguage(),
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state){
            if(state is ChangeLocaleState){
              return MaterialApp(
                locale: state.locale,
                supportedLocales: const [
                  Locale("en"),
                  Locale("ar"),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeListResolutionCallback: (deviceLocales, supportedLocales){
                  final locale = Locale(deviceLocales!.first.languageCode);

                  if(deviceLocales != null && supportedLocales.contains(
                      locale)){
                    return locale;
                  }
                  return supportedLocales.first;
                },
                title: 'Flutter Localization',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const HomeScreen(),
              );
            }
            return SizedBox();
          },
        )
    );
  }
}


