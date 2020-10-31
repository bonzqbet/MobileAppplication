// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_log/dialog.dart';
import 'package:firebase_log/register.dart';
import 'package:firebase_log/show.dart';
import 'package:flutter/material.dart';
import 'package:firebase_log/home.dart';
String test;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyLoginPage(),
      );
    }
  }
class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key}) : super(key: key);
  
 
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}
 
class _MyLoginPageState extends State<MyLoginPage> {
  final database = FirebaseDatabase.instance.reference();
  
  @override
  String email,password;
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
                      buttonSinUp(),
                      buttonSinIn(),
                    ],
                  )),
            )));
  }
  Container buttonSinUp(){
    return Container(
      child: ClipRRect(
        //ลดเหลี่ยมปุ่ม
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          onPressed: () {
            // MaterialPageRoute route = MaterialPageRoute(builder: (context) => Register(),); 
            MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (context) => Register());
            Navigator.push(context, materialPageRoute);
          },
          child: Text(
            'Sign Up for usage ?',
            ),
          ),
        ),
      );
  }
  Container buttonSinIn(){
    return Container(
      child: ClipRRect(
        //ลดเหลี่ยมปุ่ม
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          color: Colors.redAccent[700],
          onPressed: () {
            if (email == null ||
                email.isEmpty ||
                password == null ||
                password.isEmpty) {
              print('กรุณากรอกข้อมูล');
              normalDialog(context, 'Enter your email or password');
            } else {
              checkAuthe();
            }
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ));
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
  void checkAuthe()  {
      var data = database.child("member");
      data.child(email).once().then((DataSnapshot snapshot){
        test = snapshot.key;
      print('Data ======>${snapshot.value}');
      if('${snapshot.value}' == 'null'){
        print('user');
        normalDialog(context, 'username ของท่านผิด'); 
      }
      else if(password == '${snapshot.value['password']}'){
        MaterialPageRoute route = MaterialPageRoute(builder: (context) => ShowApp(),);
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
        }else{
        print('รหัสไม่ถูก');
        normalDialog(context,'รหัสไม่ถูกต้อง กรุณากรอกใหม่');
        }


    });
  }
}


