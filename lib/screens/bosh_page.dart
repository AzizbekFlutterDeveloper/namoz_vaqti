import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namoz_vaqti/core/consts.dart';
import 'package:namoz_vaqti/core/db.dart';
import 'package:namoz_vaqti/screens/asosiy_pages.dart';
import 'package:namoz_vaqti/services/services.dart';

class BoshPage extends StatefulWidget {
  const BoshPage({Key? key}) : super(key: key);

  @override
  _BoshPageState createState() => _BoshPageState();
}

var time;

class _BoshPageState extends State<BoshPage> {
  @override
  void initState() {
    super.initState();
    NewsApiService.getNewsApi();
  }

  String names = "";
  String nameTime = "00:00";
  String namesNext = "Peshin";
  String nameTimeNext = "00:00";
  String rasm = "";
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
            Container(
              height: size.height * 0.3,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius:
                    MyDecoration.myRadius(bottomLeft: 60.0, bottomRight: 60.0),
                color: Colors.black.withOpacity(0.4),
                border: Border.all(color: Colors.white),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: const AssetImage("assets/images/ramka.png"),
                ),
              ),
              child: ValueListenableBuilder<Box>(
                valueListenable: Hive.box("data").listenable(),
                builder: (context, box, __) {
                  final times = box.values.toList();
                  time = times[0]['times'];
                  korsat();
                  return Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      Text(
                        "Namoz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.07,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.12,
                                width: size.height * 0.14,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(rasm),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    NewsApiService.city,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                names,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.07,
                                ),
                              ),
                              Text(
                                nameTime,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.07,
                                ),
                              ),
                              Divider(),
                              Text(
                                namesNext,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                              Text(
                                nameTimeNext,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: size.height * 0.28),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            border: Border.all(color: Colors.white),
                            borderRadius: MyDecoration.myRadius(
                                topLeft: 30.0, topRight: 30.0),
                            image: DecorationImage(
                              image: AssetImage(imagesPage[index]),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: size.height * 0.05,
                            padding: EdgeInsets.all(size.width * 0.02),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              border: Border.all(color: Colors.white),
                              borderRadius: MyDecoration.myRadius(
                                  bottomLeft: 30.0, bottomRight: 30.0),
                            ),
                            child: Center(
                              child: AutoSizeText(namePage[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width *0.05,
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.pushNamed(context, page[index]);
                          },
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  korsat() {
    int hour = TimeOfDay.now().hour;
    int min = TimeOfDay.now().minute;

    String bomdod = time['tong_saharlik'];
    int bomdodS = int.parse(bomdod.split(":")[0]);
    int bomdodM = int.parse(bomdod.split(":")[1]);

    String peshin = time["peshin"];
    int peshinS = int.parse(peshin.split(":")[0]);
    int peshinM = int.parse(peshin.split(":")[1]);

    String asr = time["asr"];
    int asrS = int.parse(asr.split(":")[0]);
    int asrM = int.parse(asr.split(":")[1]);

    String shom = time["shom_iftor"];
    int shomS = int.parse(shom.split(":")[0]);
    int shomM = int.parse(shom.split(":")[1]);

    String hufton = time["hufton"];
    int huftonS = int.parse(hufton.split(":")[0]);
    int huftonM = int.parse(hufton.split(":")[1]);

    if (hour >= huftonS && min >= huftonM) {
      names = "Hufton";
      nameTime = hufton;
      namesNext = "Bomdod";
      nameTimeNext = bomdod;
      rasm = image[5];
    } else if (hour >= shomS && min >= shomM) {
      print("object");
      names = "Shom";
      nameTime = shom;
      rasm = image[4];
      namesNext = "Hufton";
      nameTimeNext = hufton;
    } else if (hour >= asrS && min >= asrM) {
      names = "Asr";
      print(shomS);
      nameTime = asr;
      rasm = image[3];
      namesNext = "Shom";
      nameTimeNext = shom;
    } else if (hour >= peshinS && min >= peshinM) {
      names = "Peshin";
      nameTime = peshin;
      rasm = image[2];
      namesNext = "Asr";
      nameTimeNext = asr;
    } else if (hour >= bomdodS && min >= bomdodM) {
      names = "Bomdod";
      nameTime = bomdod;
      rasm = image[0];
      namesNext = "Peshin";
      nameTimeNext = peshin;
    }
  }
}
