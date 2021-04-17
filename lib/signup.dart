import 'package:flutter/material.dart';
import 'login_signup.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final textUsername = TextField(
      cursorColor: Colors.red,
      controller: usernameController,
      decoration: InputDecoration(
        hintText: 'Enter Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final textPassword = TextField(
      cursorColor: Colors.red,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final textConfirmPassword = TextField(
      cursorColor: Colors.red,
      controller: confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Re-enter Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final btnSignup = RaisedButton(
        child: Text('Signup'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {});

    final btnLogin = FlatButton(
      onPressed: () => {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginSignup()))
      },
      child: Text(
        "Login",
        style: new TextStyle(color: Colors.blue),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MOBEAS Signup'),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: new Center(
        child: new ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 25, right: 25),
          children: [
            textUsername,
            SizedBox(
              height: 20.0,
            ),
            textPassword,
            SizedBox(
              height: 20.0,
            ),
            textConfirmPassword,
            SizedBox(
              height: 20.0,
            ),
            btnSignup,
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Already have an account?'), btnLogin],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
