import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_log/dialog.dart';
import 'package:firebase_log/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_log/main.dart';

class ShowApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EIEI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShowPage(),
    );
  }
}

class ShowPage extends StatefulWidget {
  @override
  Derdahtv createState() => Derdahtv();
  
}

class Derdahtv extends State<ShowPage> {
  void initState(){
    super.initState();
    readdata();  
    checkRoom();
  }
  final database = FirebaseDatabase.instance.reference();
  var status_water;
  var selectedType;
  List<String> _bloodType = <String>[
    'มกนาคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฏาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];
  final formkey = GlobalKey<FormState>();
  String textt = 'Welcome to MyApp naja';
  // Default placeholder text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[100],
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: [Colors.yellow[200], Colors.red[200]])),
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(24),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    sizeBox(),
                    sizeBox(),
                    buildTextShow(),
                    labelinput(),
                    sizeBox(),
                    labelinshow(),
                    outputShow(),
                    sizeBox(),
                    labelbutton(),
                    sizeBox(),
                  ],
                ),
              )
            ],
          ),
        )
        );
  }

  Container labelinput() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child:
          Center(child: Text('รายการย้อนหลัง', style: TextStyle(fontSize: 26))),
    );
  }
  

  Container labelinshow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Text("เดือน", style: TextStyle(fontSize: 23)),
            SizedBox(
              width: 60,
            ),
            Text('จำนวน', style: TextStyle(fontSize: 23)),
            SizedBox(
              width: 55,
            ),
            Text('ราคา', style: TextStyle(fontSize: 23))
          ],
          
        ),
      ),
    );
  }

  Container outputShow() {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text("มกราคม"+"                         "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("กุมภาพันธ์"+"                       "+"/หน่วย"+"                   "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("มีนาคม"+"                         "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("เมษายน"+"                         "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("พฤษภาคม"+"                      "+"/หน่วย"+"                   "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("มิถุนายน"+"                         "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("กรกฏาคม"+"                      "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("สิงหาคม"+"                         "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("กันยายน"+"                         "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("ตุลาคม"+"                         "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("พฤศจิกายน"+"                      "+"/หน่วย"+"                  "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("ธันวาคม"+"                       "+"/หน่วย"+"                    "+"/บาท", style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Container buildTextShow() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient:
              LinearGradient(colors: [Colors.yellow[200], Colors.red[200]])),
    );
  }
Container labelbutton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            buttonNext(),
            SizedBox(
              width: 80,
            ),
            buttonSinIn(),
          ],
        ),
      ),
    );
  }
  Container buttonSinIn() {
    return Container(
        child: ClipRRect(
      //ลดเหลี่ยมปุ่ม
      borderRadius: BorderRadius.circular(10),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        color: Colors.redAccent[700],
        onPressed: () {
            check();
        },
        child: Text(
          'เริ่มคำนวณ',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    ));
  }

  Container buttonNext() {
    return Container(
        child: ClipRRect(
      //ลดเหลี่ยมปุ่ม
      borderRadius: BorderRadius.circular(10),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        color: Colors.redAccent[700],
        onPressed: () {
          next();
        },
        child: Text(
          'กลับ',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    ));
  }
sizeBox() =>SizedBox(height: 30,);
sizeBox1() =>SizedBox(height: 20,);

  void check() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (context) => SampleApp());
    Navigator.push(context, materialPageRoute);
  }

  void next() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (context) => MyLoginPage());
    Navigator.push(context, materialPageRoute);
  }
  void readdata() async {
     print('Work it');
    //  DatabaseReference databaseReference = database.reference().child('member');
    //  await databaseReference.once().then((DataSnapshot dataSnapshot){
    //    print("Data => ${dataSnapshot.value}");
    //  });
  }
  void checkRoom() {
    var db = database.child("member").child("bonz").child("month");
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      // print(values);
      values.forEach((k, v) {
      // print(k);
      print(v['หน่วย']);

      });
    });
  }
}
