import 'package:flutter/material.dart';

import '../core/consts.dart';

class TasbehPage extends StatefulWidget {
  const TasbehPage({Key? key}) : super(key: key);

  @override
  _TasbehPageState createState() => _TasbehPageState();
}

class _TasbehPageState extends State<TasbehPage> {
  
  
  

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/fonimage.jpg"),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.04,
                left: size.width * 0.05,
              ),
              child: Row(
                children: [
                  InkWell(
                    child: const Opacity(
                      opacity: 0.4,
                      child: Chip(
                        backgroundColor: Colors.black,
                        label: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: MyDecoration.myBorder,
                      color: Colors.black.withOpacity(0.4),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        "Tasbeh",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.9,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/tasbeheltironik.png")
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.26,
                  ),
                  Text("$_index",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: size.width * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.32,
                  ),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: (){
                      setState(() {
                        _index += 1;
                       
                      });
                    },
                    onLongPress: (){
                      setState(() {
                        _index = 0;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
