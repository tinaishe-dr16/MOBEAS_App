import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_signup.dart';

class NavDrawer extends StatelessWidget {
  //final auth = Firebase.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/cover.png'))),
            child: null,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => {
              /*Navigator.of(context).pop(Profile())*/ Navigator
                  .pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(pageNumber: 2)))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              /*Navigator.of(context).pop(Settings())*/ Navigator
                  .pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(pageNumber: 3)))
            },
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('First Aid'),
            onTap: () => {
              /*Navigator.of(context).pop(FirstAid())*/ Navigator
                  .pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(pageNumber: 1)))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginSignup()))
            },
          ),
          SizedBox(
            height: 90.0,
          ),
          Text("  Copyright © 2021 MOBEAS by Tinaishe Tapera"),
        ],
      ),
    );
  }
}
