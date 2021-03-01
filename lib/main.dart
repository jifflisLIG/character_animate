import 'package:first_game/bloc/main_bloc.dart';
import 'package:first_game/widget/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/character.dart';

void main() {
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.landscapeLeft,
//    DeviceOrientation.landscapeRight,
//  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (BuildContext context) =>
            MainBloc(character: Character()),
        child: MyHomePage(),
      ),
    );
  }
}
