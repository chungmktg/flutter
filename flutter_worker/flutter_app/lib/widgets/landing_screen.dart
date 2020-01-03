import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/login_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Image.asset("assets/image_landing.webp",
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          fit: BoxFit.cover,),
        ),
        ListView(
          children: <Widget>[
            SizedBox(
              height: 550.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
                ),
                color: Colors.deepOrange,
                child: Text("Login with Email"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
