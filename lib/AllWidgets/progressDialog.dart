import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
	String message;
	ProgressDialog({this.message});
	
	@override
	Widget build(BuildContext context){
		return Dialog(
			backgroundColor: Colors.red,
			child: Container (
				margin: EdgeInsets.all(15.0),
				width: double.infinity,
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(6.0)
				),
				child: Padding (
					padding: const EdgeInsets.all(15.0),
					child: Row(
					children: [
						SizedBox(width: 6.0),
						CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
						SizedBox(width: 26.0),
						Text(
							message,
							style: TextStyle(color: Colors.black, fontSize: 10.0),
						)
					],
				),
			  ),
			),
		);
	}
}


// Login Page
// under loginUser function:
// showDialog(
//		context: context,
//		barrierDismissible: false,
//		builder: (BuildContext context){
//			return ProgressDialog(message: "Authenticating, //   please wait...",);
//		}
//
//   );

// inside catchErr & inside else statement of (if user != null) & other else statement of snap wat wat
// Navigator.pop(context);  