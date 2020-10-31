import 'package:firebase_log/dialog.dart';
import 'package:firebase_log/show.dart';
import 'package:flutter/material.dart';
import 'package:firebase_log/main.dart';
import 'package:firebase_database/firebase_database.dart';

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EIEI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  Derdahtv createState() => Derdahtv();
}

class Derdahtv extends State<SampleAppPage> {
  final database = FirebaseDatabase.instance.reference();
  var point = 100;
  var money = 200;
  var status_water;
  var selectedType;
  List<String> _bloodType = <String>[
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
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
                    buildTextFieldEmail(),
                    dropdown(),
                    sizeBox1(),
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
          Center(child: Text('ค่าน้ำเดือนนี้', style: TextStyle(fontSize: 26))),
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
            Text("หน่อยน้ำที่ใช้", style: TextStyle(fontSize: 23)),
            SizedBox(
              width: 120,
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
        child: Row(
          children: <Widget>[
            Text("$point/หน่อย", style: TextStyle(fontSize: 23)),
            SizedBox(
              width: 100,
              height: 50,
            ),
            Text('$money/บาท', style: TextStyle(fontSize: 23))
          ],
        ),
      ),
    );
  }

  Container buildTextFieldEmail() {
    return Container(
        width: 200,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) => status_water = value.trim(),
            decoration: InputDecoration.collapsed(hintText: "Enter piont"),
            style: TextStyle(fontSize: 18)));
  }

  Container dropdown() {
    return Container(
      child: DropdownButton(
        items: _bloodType.map((value) {
          var dropdownMenuItem = DropdownMenuItem(
            child: Text(
              value,
            ),
            value: value,
          );
          return dropdownMenuItem;
        }).toList(),
        onChanged: (selectBloodType) {
          setState(() {
            selectedType = selectBloodType;
          });
        },
        value: selectedType,
        hint: Text('Select Month', style: TextStyle(fontSize: 20)),
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
          if (status_water == null ||
              status_water.isEmpty ||
              selectedType == null) {
            print('กรุณากรอกข้อมูล');
            normalDialog(context, 'enter your piont');
          } else {
            check();
          }
        },
        child: Text(
          'คำนวณ',
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
    var value = int.tryParse(status_water);
    var result = value * 10;
    database
        .child("member")
        .child(test)
        .child("month")
        .child(selectedType)
        .set({"หน่วย": value, "ราคา": result});
    print(selectedType);
    print(result);
    checkDialog(context, 'Do you want stay this page ?');
  }

  void next() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (context) => ShowApp());
    Navigator.push(context, materialPageRoute);
  }
}
