import 'package:flutter/material.dart';
import 'package:namoz_vaqti/screens/asosiy_pages.dart';
import 'package:namoz_vaqti/screens/bosh_page.dart';
import 'package:namoz_vaqti/screens/duolar_page.dart';
import 'package:namoz_vaqti/screens/home_pages.dart';
import 'package:namoz_vaqti/screens/ismlar_page.dart';
import 'package:namoz_vaqti/screens/tasbeh_page.dart';

class Routers{
  static router(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context)=> const HomePage());
      case '/bosh':
        return MaterialPageRoute(builder: (context)=> const BoshPage());
      case '/asosiy':
        return MaterialPageRoute(builder: (context)=> const AsossiyPage());
      case '/ismlar':
        return MaterialPageRoute(builder: (context)=> const IsmlarPage());
      case '/tasbeh':
        return MaterialPageRoute(builder: (context)=> const TasbehPage());
      case '/duolar':
        return MaterialPageRoute(builder: (context)=> const DuolarPage()); 
     
    }
  }
}