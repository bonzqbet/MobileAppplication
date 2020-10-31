import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_log/dialog.dart';
import 'package:firebase_log/main.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final database = FirebaseDatabase.instance.reference();
  String email,password,conpassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            color: Colors.green[200],
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Colors.yellow[200], Colors.red[200]])),
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildTextFieldEmail(),
                      buildTextFieldPassword(),
                      buildTextFieldEnterPassword(),
                      sizeBox(),
                      labelbutton(),
                    ],
                  )),
            ))
    );
  }

  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            onChanged: (value) => email = value.trim(),
            decoration: InputDecoration.collapsed(hintText: "email"),
            style: TextStyle(fontSize: 18)));
            
  }
  Container buildTextFieldPassword() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
          onChanged: (value) => password = value.trim(),
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "password"),
            style: TextStyle(fontSize: 18)));
  }
  Container buildTextFieldEnterPassword() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
          onChanged: (value) => conpassword = value.trim(),
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "confirm password"),
            style: TextStyle(fontSize: 18)));
  }
sizeBox() =>SizedBox(height: 30,);
sizeBox1() =>SizedBox(height: 20,);
Container labelbutton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            buttonback(),
            SizedBox(
              width: 75,
            ),
            buttonSignUp(),
          ],
        ),
      ),
    );
  }
  Container buttonSignUp(){
    return Container(
      child: ClipRRect(
        //ลดเหลี่ยมปุ่ม
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          color: Colors.redAccent[700],
          onPressed: () {
            if (email == null ||
                email.isEmpty ||
                password == null ||
                password.isEmpty) {
              print('กรุณากรอกข้อมูล');
              normalDialog(context, 'enter your information');
            } else {
              regis();
              route();
            }
          },
          child: Text(
            'Sign Up',
          ),
        ),
      ));
  }
  Container buttonback(){
    return Container(
      child: ClipRRect(
        //ลดเหลี่ยมปุ่ม
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          color: Colors.redAccent[700],
          onPressed: () {
            // MaterialPageRoute route = MaterialPageRoute(builder: (context) => Register(),); 
            MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (context) => MyLoginPage());
            Navigator.push(context, materialPageRoute);
          },
          child: Text(
            'Back',
            ),
          ),
        ),
      );
  }
  
  void regis(){
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
  int count = _bloodType.length;
    database.child("member").child(email).set({"password":password});
    // database.child("member").child(email).set({"month"});
    // database.child("member").child(email).child("มกราคม").set({"หน่วย":"0"});
    for (var i = 0; i<= count;i++){
      database.child("member").child(email).child("month").child(_bloodType[i]).set({"หน่วย":"0","ราคา":"0"});
      if(i==13){
        break;
      }
    }
  }
  void route(){
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => MyLoginPage(),);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
}

