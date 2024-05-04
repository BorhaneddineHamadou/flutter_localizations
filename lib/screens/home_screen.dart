import 'package:flutter/material.dart';
import 'package:localizationproject/app_localizations.dart';
import 'package:localizationproject/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home".tr(context)),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingsScreen())
                );
              },
              icon: const Icon(Icons.settings)
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.translate("hello_msg"),
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const Text(
                "This text will not be translated",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}