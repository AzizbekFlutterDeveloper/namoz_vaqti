import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:namoz_vaqti/model/model.dart';
import 'package:namoz_vaqti/router/routers.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  Hive.registerAdapter(ModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox("data");
  await Hive.openBox<Model>("habar");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      onGenerateRoute:(settings)=> Routers.router(settings),
    );
  }
}
