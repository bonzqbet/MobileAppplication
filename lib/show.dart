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
  void initState() {
    checkM1();
    checkM2();
    checkM3();
    checkM4();
    checkM5();
    checkM6();
    checkM7();
    checkM8();
    checkM9();
    checkM10();
    checkM11();
    checkM12();
    checkVm1();
    checkVm2();
    checkVm3();
    checkVm4();
    checkVm5();
    checkVm6();
    checkVm7();
    checkVm8();
    checkVm9();
    checkVm10();
    checkVm11();
    checkVm12();
    super.initState();
    // checkRoom();
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
        ));
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
    checkM1();
    checkM2();
    checkM3();
    checkM4();
    checkM5();
    checkM6();
    checkM7();
    checkM8();
    checkM9();
    checkM10();
    checkM11();
    checkM12();
    checkVm1();
    checkVm2();
    checkVm3();
    checkVm4();
    checkVm5();
    checkVm6();
    checkVm7();
    checkVm8();
    checkVm9();
    checkVm10();
    checkVm11();
    checkVm12();
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text("มกราคม" + "                  " +unitM1+"/หน่วย" +"                " +valueM1 +"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("กุมภาพันธ์" +"                  " +unitM2+"/หน่วย" +"              "+valueM2 +"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("มีนาคม" +"                    " +unitM3+"/หน่วย" +"              "+valueM3+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("เมษายน" +"                    " +unitM4+"/หน่วย" +"             "+valueM4+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("พฤษภาคม" +"                 " +unitM5+"/หน่วย" +"              "+valueM5+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("มิถุนายน" +"                  " +unitM6+"/หน่วย" +"             "+valueM6+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("กรกฏาคม" +"                 " +unitM7+"/หน่วย" +"               "+valueM7+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("สิงหาคม" +"                  " +unitM8+"/หน่วย" +"                "+valueM8+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("กันยายน" +"                  " +unitM9+"/หน่วย" +"                "+valueM9+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("ตุลาคม" +"                  " +unitM10+"/หน่วย" +"               "+valueM10+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("พฤศจิกายน" +"           " +unitM11+"/หน่วย" +"            "+valueM11+"/บาท",style: TextStyle(fontSize: 15)),
            SizedBox(
              width: 100,
              height: 5,
            ),
            Text("ธันวาคม" +"                  " +unitM12+"/หน่วย" +"            "+valueM12+"/บาท",style: TextStyle(fontSize: 15)),
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

  sizeBox() => SizedBox(
        height: 30,
      );
  sizeBox1() => SizedBox(
        height: 20,
      );

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

  var unitM1,
      unitM2,
      unitM3,
      unitM4,
      unitM5,
      unitM6,
      unitM7,
      unitM8,
      unitM9,
      unitM10,
      unitM11,
      unitM12;
  var valueM1,
      valueM2,
      valueM3,
      valueM4,
      valueM5,
      valueM6,
      valueM7,
      valueM8,
      valueM9,
      valueM10,
      valueM11,
      valueM12;
  void checkVm1() {
    var dbvm1 =
        database.child("member").child(test).child("month").child("มกราคม");
    dbvm1.once().then((DataSnapshot snapshotV1) {
      valueM1 = snapshotV1.value['ราคา'].toString();
    });
  }

  void checkVm2() {
    var dbvm2 =
        database.child("member").child(test).child("month").child("กุมภาพันธ์");
    dbvm2.once().then((DataSnapshot snapshotV2) {
      valueM2 = snapshotV2.value['ราคา'].toString();
    });
  }

  void checkVm3() {
    var dbvm3 =
        database.child("member").child(test).child("month").child("มีนาคม");
    dbvm3.once().then((DataSnapshot snapshotV3) {
      valueM3 = snapshotV3.value['ราคา'].toString();
    });
  }
  void checkVm4() {
    var dbvm4 =
        database.child("member").child(test).child("month").child("เมษายน");
    dbvm4.once().then((DataSnapshot snapshotV4) {
      valueM4 = snapshotV4.value['ราคา'].toString();
    });
  }
  void checkVm5() {
    var dbvm5 =
        database.child("member").child(test).child("month").child("พฤษภาคม");
    dbvm5.once().then((DataSnapshot snapshotV5) {
      valueM5 = snapshotV5.value['ราคา'].toString();
    });
  }
  void checkVm6() {
    var dbvm6 =
        database.child("member").child(test).child("month").child("มิถุนายน");
    dbvm6.once().then((DataSnapshot snapshotV6) {
      valueM6 = snapshotV6.value['ราคา'].toString();
    });
  }
  void checkVm7() {
    var dbvm7 =
        database.child("member").child(test).child("month").child("กรกฎาคม");
    dbvm7.once().then((DataSnapshot snapshotV7) {
      valueM7 = snapshotV7.value['ราคา'].toString();
    });
  }
  void checkVm8() {
    var dbvm8 =
        database.child("member").child(test).child("month").child("สิงหาคม");
    dbvm8.once().then((DataSnapshot snapshotV8) {
      valueM8 = snapshotV8.value['ราคา'].toString();
    });
  }
  void checkVm9() {
    var dbvm9 =
        database.child("member").child(test).child("month").child("กันยายน");
    dbvm9.once().then((DataSnapshot snapshotV9) {
      valueM9 = snapshotV9.value['ราคา'].toString();
    });
  }
  void checkVm10() {
    var dbvm10 =
        database.child("member").child(test).child("month").child("ตุลาคม");
    dbvm10.once().then((DataSnapshot snapshotV10) {
      valueM10 = snapshotV10.value['ราคา'].toString();
    });
  }
  void checkVm11() {
    var dbvm11 =
        database.child("member").child(test).child("month").child("พฤศจิกายน");
    dbvm11.once().then((DataSnapshot snapshotV11) {
      valueM11 = snapshotV11.value['ราคา'].toString();
    });
  }
  void checkVm12() {
    var dbvm12 =
        database.child("member").child(test).child("month").child("ธันวาคม");
    dbvm12.once().then((DataSnapshot snapshotV12) {
      valueM12 = snapshotV12.value['ราคา'].toString();
    });
  }

  // ////////////////////////////////////////////////////////////////
  void checkM1() {
    var db1 =
        database.child("member").child(test).child("month").child("มกราคม");
    db1.once().then((DataSnapshot snapshot1) {
      unitM1 = snapshot1.value['หน่วย'].toString();
    });
  }

  void checkM2() {
    var db2 =
        database.child("member").child(test).child("month").child("กุมภาพันธ์");
    db2.once().then((DataSnapshot snapshot2) {
      unitM2 = snapshot2.value['หน่วย'].toString();
    });
  }

  void checkM3() {
    var db3 =
        database.child("member").child(test).child("month").child("มีนาคม");
    db3.once().then((DataSnapshot snapshot3) {
      unitM3 = snapshot3.value['หน่วย'].toString();
    });
  }

  void checkM4() {
    var db4 =
        database.child("member").child(test).child("month").child("เมษายน");
    db4.once().then((DataSnapshot snapshot4) {
      unitM4 = snapshot4.value['หน่วย'].toString();
    });
  }

  void checkM5() {
    var db5 =
        database.child("member").child(test).child("month").child("พฤษภาคม");
    db5.once().then((DataSnapshot snapshot5) {
      unitM5 = snapshot5.value['หน่วย'].toString();
    });
  }

  void checkM6() {
    var db6 =
        database.child("member").child(test).child("month").child("มิถุนายน");
    db6.once().then((DataSnapshot snapshot6) {
      unitM6 = snapshot6.value['หน่วย'].toString();
    });
  }

  void checkM7() {
    var db7 =
        database.child("member").child(test).child("month").child("กรกฎาคม");
    db7.once().then((DataSnapshot snapshot7) {
      unitM7 = snapshot7.value['หน่วย'].toString();
    });
  }

  void checkM8() {
    var db8 =
        database.child("member").child(test).child("month").child("สิงหาคม");
    db8.once().then((DataSnapshot snapshot8) {
      unitM8 = snapshot8.value['หน่วย'].toString();
    });
  }

  void checkM9() {
    var db9 =
        database.child("member").child(test).child("month").child("กันยายน");
    db9.once().then((DataSnapshot snapshot9) {
      unitM9 = snapshot9.value['หน่วย'].toString();
    });
  }

  void checkM10() {
    var db10 =
        database.child("member").child(test).child("month").child("ตุลาคม");
    db10.once().then((DataSnapshot snapshot10) {
      unitM10 = snapshot10.value['หน่วย'].toString();
    });
  }

  void checkM11() {
    var db11 =
        database.child("member").child(test).child("month").child("พฤศจิกายน");
    db11.once().then((DataSnapshot snapshot11) {
      unitM11 = snapshot11.value['หน่วย'].toString();
    });
  }

  void checkM12() {
    var db12 =
        database.child("member").child(test).child("month").child("ธันวาคม");
    db12.once().then((DataSnapshot snapshot12) {
      unitM12 = snapshot12.value['หน่วย'].toString();
    });
  }

  void readdata() async {
    print('Work it');
    //  DatabaseReference databaseReference = database.reference().child('member');
    //  await databaseReference.once().then((DataSnapshot dataSnapshot){
    //    print("Data => ${dataSnapshot.value}");
    //  });
    // print(test);
  }
}
