import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namoz_vaqti/screens/bosh_page.dart';

class MyDecoration{
  static BorderRadius myBorder = BorderRadius.all(Radius.circular(20));
  static BorderRadius myRadius({topLeft = 0.0 , topRight = 0.0 , bottomLeft = 0.0 , bottomRight = 0.0}) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight:  Radius.circular(topRight),
      bottomLeft:  Radius.circular(bottomLeft),
      bottomRight:  Radius.circular(bottomRight),
    );
  }
}


