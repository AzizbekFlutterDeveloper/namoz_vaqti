import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:namoz_vaqti/core/consts.dart';
import 'package:namoz_vaqti/core/ismlar.dart';

class IsmlarPage extends StatefulWidget {
  const IsmlarPage({Key? key}) : super(key: key);

  @override
  _IsmlarPageState createState() => _IsmlarPageState();
}

class _IsmlarPageState extends State<IsmlarPage> {
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
                top: size.width * 0.1,
                left: size.width * 0.05,
              ),
              child: Row(
                children: [
                  InkWell(
                    child: const Opacity(
                      opacity: 0.4,
                      child:  Chip(
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
                        "Allohning 99 ismi",
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
            SizedBox(
              height: size.height * 0.897,
              width: size.width,
              child: ListView.builder(
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * 0.06,
                    width: size.width * 0.9,
                    margin: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: MyDecoration.myBorder,
                      color: Colors.black.withOpacity(0.4),
                      border: Border.all(color: Colors.white),
                    ),
                    child: ListTile(
                      leading: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      title: Text(
                        ismlar[index]["oqilishi"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      trailing: Text(
                        ismlar[index]["arabcha"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      onTap: () {
                        myShowDialog(size, index);
                      },
                    ),
                  );
                },
                itemCount: ismlar.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  myShowDialog(Size size, index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: size.height * 0.3,
            width: size.width * 0.9,
            padding: EdgeInsets.all(size.width * 0.03),
            decoration: BoxDecoration(
              borderRadius: MyDecoration.myBorder,
              color: Colors.black.withOpacity(0.4),
              border: Border.all(color: Colors.white),
            ),
            child: Center(
              child: AutoSizeText(
                ismlar[index]["tarjimasi"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
