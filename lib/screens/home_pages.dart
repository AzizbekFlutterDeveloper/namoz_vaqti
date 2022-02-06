import 'package:flutter/material.dart';
import 'package:namoz_vaqti/screens/asosiy_pages.dart';
import 'package:namoz_vaqti/screens/bosh_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
     return SplashScreenView(
      navigateRoute: BoshPage(),
      duration: 5000,
      imageSize: 250,
      imageSrc: "assets/images/kabaimage.webp",
      text: "Namoz Vaqti",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.black,
        Colors.grey,
        Colors.white,
        
      ],
      backgroundColor: Colors.white,
    );
  }
}