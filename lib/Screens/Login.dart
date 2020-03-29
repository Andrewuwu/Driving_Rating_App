import 'package:drivingratingapp/Screens/Navigator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              .2,
              .5,
              .8
            ],
                colors: [
              Colors.lightBlueAccent,
              Colors.lightBlue,
              Colors.blue
            ])),
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
                  height: 30,
                ),

                Image(
                  image: AssetImage('assets/safeSpeed.png'),
                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  height: 35,
                  color: Colors.white70,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(labelText: ('  Username')),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                //username
                SizedBox(
                  width: 375,
                  child: Container(
                    height: 35,
                    width: 300,
                    color: Colors.white70,
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(labelText: ('  Password')),
                      obscureText: true,
                    ),
                  ),
                ), //password
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
