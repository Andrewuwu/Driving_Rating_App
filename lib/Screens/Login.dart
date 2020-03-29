import 'package:drivingratingapp/Screens/Navigation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _textControllerName = new TextEditingController();
  final TextEditingController _textControllerPass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(25, 22, 55, 1),
        /* decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              .2,
              .5,
              .8
            ],
                colors: [
              Color.fromRGBO(25, 22, 55, 1),
            ])),*/
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 60.0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),

                Container(
                  /*decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ]),*/
                  child: Image(
                    image: AssetImage('assets/final_logo.jpg'),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _textControllerName,
                    decoration: InputDecoration(hintText: ('  Username')),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                //username
                Container(
                  height: 35,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _textControllerPass,
                    decoration: InputDecoration(hintText: ('  Password')),
                    obscureText: true,
                  ),
                ),
                //password
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 400,
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    elevation: 10.0,
                    color: Colors.white,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Color.fromRGBO(35, 35, 35, 1.0),
                          letterSpacing: 3.0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage())),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
