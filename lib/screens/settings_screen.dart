import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizationproject/app_localizations.dart';
import 'package:localizationproject/cubit/locale_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr(context)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              if(state is ChangeLocaleState){
                return DropdownButton(
                  value: state.locale.languageCode,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ["ar", "en"].map(
                          (String item) {
                        return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item)
                        );
                      }
                  ).toList(),
                  onChanged: (String? newValue) {
                    if(newValue != null){
                      context.read<LocaleCubit>().changeLanguage(newValue);
                      // BlocProvider.of<LocaleCubit>(context).changeLanguage(newValue);
                    }
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }


}