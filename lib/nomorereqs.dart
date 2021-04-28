import 'package:flutter/material.dart';

class NoMoreReqs extends StatelessWidget {
  const NoMoreReqs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MOBEAS Requests'),
        backgroundColor: Colors.red[700],
      ),
      body: Container(
        child: Center(
          child: Text(
            'No more requests for today',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
