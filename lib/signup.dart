import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'login_signup.dart';
import 'signup_successful.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignupState();
}

class _SignupState extends State<Signup> {
  String _email, _password, _username, _confirmpassword;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  //final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    // final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    // final emailController = TextEditingController();

    final textUsername = TextField(
      cursorColor: Colors.red,
      controller: usernameController,
      //   onChanged: (value) {
      //   setState(() {
      //      _username = value.trim();
      //    });
      // },
      decoration: InputDecoration(
        hintText: 'Enter Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final textEmail = TextField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.red,
      controller: emailController,
      //  onChanged: (value) {
      //  setState(() {
      //    _email = value.trim();
      //    });
      //  },
      decoration: InputDecoration(
        hintText: 'Enter an Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final textPassword = TextField(
      cursorColor: Colors.red,
      controller: passwordController,
      // onChanged: (value) {
      //  setState(() {
      //  _password = value.trim();
      //    });
      // },
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
      //   onChanged: (value) {
      //    setState(() {
      //_confirmpassword = value.trim();
      //    });
      //  },
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
      onPressed: () {
        if (passwordController.text.length < 8) {
          displayToastMessage(
              "Password must be at least 8 characters long", context);
        } else if (!emailController.text.contains("@")) {
          displayToastMessage("Email address not valid", context);
        } else if (passwordController.text != confirmPasswordController.text) {
          displayToastMessage("Passwords do not match!", context);
        } else {
          registerNewUser(context);
        }

        // auth.createUserWithEmailAndPassword(email: _email, password: _password);
        // Navigator.pushReplacement(
        //   context, MaterialPageRoute(builder: (context) => SignupSuccess()));
      },
    );

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
            textEmail,
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

  final FirebaseAuth auth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    final user = (await auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;
    if (user != null) {
    } else {
      displayToastMessage("New User has not been created", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
