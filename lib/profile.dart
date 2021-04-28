import 'package:flutter/material.dart';
import 'destinations.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              //height: MediaQuery.of(context).size.height / 3,
              //fit: BoxFit.cover,
              image: NetworkImage(
                  'https://better.net/wp-content/uploads/2019/08/heart-health-770x433.jpg'),
            ),
            Positioned(
              bottom: -50,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'https://scontent.fhre2-1.fna.fbcdn.net/v/t1.6435-9/88236475_1567749826714398_6940671466778132480_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=E3-YDd0D5hMAX8wH3Ly&_nc_ht=scontent.fhre2-1.fna&oh=e16e867cd68a78c997d26dac5ad568e9&oe=60A5A80F'),
              ),
            ),
            //Text("Profile");
          ],
        ),
        SizedBox(
          height: 40,
        ),
        ListTile(
          title: Center(
            child: Text('Tinaishe Tapera'),
          ),
          subtitle: Center(
            child: Text('MOBEAS Driver ID: A1P1JDK8'),
          ),
        ),
        Text('Number of Attended requests: ')
      ],
    );
  }
}
