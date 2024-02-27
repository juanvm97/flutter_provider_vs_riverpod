import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_vs_riverpod/sm_provider/main_provider.dart';
import 'package:provider_vs_riverpod/sm_setstate/main_setstate.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Samples"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            MyMenuButton(
              title: "SetState",
              actionTap: () {
                onButtonTap(
                  const MainSetState(),
                );
              },
            ),
            MyMenuButton(
              title: "Provider",
              actionTap: () {
                onButtonTap(
                  const MainProvider(),
                );
              },
            ),
            MyMenuButton(
              title: "Riverpod",
              actionTap: () {
                onButtonTap(
                  const MainProvider(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  final String? title;
  final VoidCallback? actionTap;

  const MyMenuButton({super.key, this.title, this.actionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: actionTap,
        child: Text(title!),
      ),
    );
  }
}
