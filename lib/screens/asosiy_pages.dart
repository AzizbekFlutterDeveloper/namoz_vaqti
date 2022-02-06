import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:namoz_vaqti/core/consts.dart';
import 'package:namoz_vaqti/core/db.dart';
import 'package:namoz_vaqti/model/model.dart';
import 'package:namoz_vaqti/screens/bosh_page.dart';
import 'package:namoz_vaqti/services/services.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AsossiyPage extends StatefulWidget {
  const AsossiyPage({Key? key}) : super(key: key);

  @override
  _AsossiyPageState createState() => _AsossiyPageState();
}

class _AsossiyPageState extends State<AsossiyPage> {
  
  AndroidInitializationSettings? initializationSettingsAndroid;
  IOSInitializationSettings? initializationSettingsIOS;
  InitializationSettings? initializationSettings;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Box<Model> habar = Hive.box<Model>("habar");
  @override
  void initState() {
    super.initState();
    //korsat();
    NewsApiService.getNewsApi();
    if(habar.isEmpty){
      habar.add(Model(bomdod: false, quyosh: false, peshin: false, asr: false, shom: false, hufton: false));
    }
    tz.initializeTimeZones();
    initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, subtitle, content) {});
    initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings!,
      onSelectNotification: (v) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => Scaffold(
              appBar: AppBar(),
            ),
          ),
        );
      },
    );
  }

  int bugun = DateTime.now().day;
  int buOy = DateTime.now().month;
  int son = oylar[DateTime.now().month];

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
                top: size.height * 0.03,
                bottom: size.height * 0.03,
                right: size.width * 0.8,
              ),
              child: InkWell(
                child: const Opacity(
                  opacity: 0.4,
                  child: Chip(
                    label:  Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  ),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(),
              height: size.height * 0.1,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: MyDecoration.myBorder,
                color: Colors.black.withOpacity(0.3),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(
                  "Namoz Vaqtlari",
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Container(
              height: size.height * 0.07,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius:
                    MyDecoration.myRadius(topRight: 20.0, topLeft: 20.0),
                color: Colors.white.withOpacity(0.2),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: MyDecoration.myBorder,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          DropdownButton(
                            dropdownColor: Colors.black.withOpacity(0.4),
                            borderRadius: MyDecoration.myBorder,
                            value: NewsApiService.city,
                            items: City.citys
                                .map((e) => DropdownMenuItem(
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontSize: size.width * 0.03,
                                            color: Colors.white),
                                      ),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (v) {
                              setState(() {
                                NewsApiService.city = v.toString();
                                NewsApiService.getNewsApi();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: MyDecoration.myBorder,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: (NewsApiService.day == bugun &&
                                    NewsApiService.month == buOy)
                                ? null
                                : () {
                                    setState(() {
                                      monthminus();
                                    });
                                  },
                          ),
                          Text(
                            "${NewsApiService.day} - ${oyNomi[NewsApiService.month]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.05,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_outlined,
                                color: Colors.white),
                            onPressed: () {
                              setState(() {
                                monthplus();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.45,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius:
                    MyDecoration.myRadius(bottomRight: 20.0, bottomLeft: 20.0),
                color: Colors.white.withOpacity(0.2),
                border: Border.all(color: Colors.grey),
              ),
              child: ValueListenableBuilder<Box>(
                valueListenable: Hive.box("data").listenable(),
                builder: (context, box, __) {
                  final times = box.values.toList();
                  return mySizedBox(size, times);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox mySizedBox(Size size, times) {
    return SizedBox(
      height: size.height * 0.43,
      width: size.width * 0.88,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        physics: ScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          String names = vaqt[index];
          return Container(
            margin: EdgeInsets.all(size.height * 0.005),
            height: size.height * 0.06,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: index == 1 ? 0 : size.height * 0.01),
                    padding:
                        EdgeInsets.all(index == 1 ? size.height * 0.013 : 0),
                    height: size.height * 0.06,
                    width: size.width * 0.15,
                    child: Center(
                        child: Image.asset(
                      image[index],
                      fit: BoxFit.cover,
                    )),
                  ),
                  Text(
                    name[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    times[0]['times'][names].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      onPressed: (){
                        setState(() {
                          
                        });
                      },
                      icon: habar.values.first.bomdod == false ?const  Icon(
                        Icons.notifications_off_outlined,
                        color: Colors.white,
                      ) : const Icon(Icons.notifications_none_outlined, color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  monthplus() {
    if (NewsApiService.day >= son) {
      NewsApiService.day = 1;
      NewsApiService.month += 1;
      son = oylar[NewsApiService.month];
      NewsApiService.getNewsApi();
    } else {
      NewsApiService.day += 1;
      NewsApiService.getNewsApi();
    }
  }

  monthminus() {
    if (NewsApiService.day <= 1) {
      NewsApiService.month -= 1;
      NewsApiService.day = oylar[NewsApiService.month];
      son = oylar[NewsApiService.month];
      NewsApiService.getNewsApi();
    } else {
      NewsApiService.day -= 1;
      NewsApiService.getNewsApi();
    }
  }
 
  b(int day, int hour, int minute, String namozName, String vaqti) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("channelId", "channelName",
            channelDescription: "your channel description",
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        namozName,
        vaqti,
        tz.TZDateTime.from(
          DateTime(2022, NewsApiService.month, day, hour, minute),
          tz.getLocation('America/Detroit'),
        ),
        const NotificationDetails(
          android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        channelDescription: "channel description",
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: "",

       );
  }

  korsat(){
    

    String bomdod = time['tong_saharlik'];
    int bomdodS = int.parse(bomdod.split(":")[0]);
    int bomdodM = int.parse(bomdod.split(":")[1]);
    b(NewsApiService.day, bomdodS, bomdodM, "Bomdod",bomdod);

    String peshin = time["peshin"];
    int peshinS = int.parse(peshin.split(":")[0]);
    int peshinM = int.parse(peshin.split(":")[1]);
    b(NewsApiService.day, peshinS, peshinM, "Bomdod",peshin);

    String asr = time["asr"];
    int asrS = int.parse(asr.split(":")[0]);
    int asrM = int.parse(asr.split(":")[1]);
    b(NewsApiService.day, asrS, asrM, "Bomdod",asr);

    String shom = time["shom_iftor"];
    int shomS = int.parse(shom.split(":")[0]);
    int shomM = int.parse(shom.split(":")[1]);
    b(NewsApiService.day, shomS, shomM, "Bomdod",shom);

    String hufton = time["hufton"];
    int huftonS = int.parse(hufton.split(":")[0]);
    int huftonM = int.parse(hufton.split(":")[1]);
    b(NewsApiService.day + 1, huftonS, huftonM, "Bomdod",hufton);

    String quyosh = time["quyosh"];
    int quyoshS = int.parse(quyosh.split(":")[0]);
    int quyoshM = int.parse(quyosh.split(":")[1]);
    b(NewsApiService.day, quyoshS, quyoshM, "Bomdod",quyosh);

    
  }
  
 

}

 
