import 'package:fit4u/services/exercise_database.dart';
import 'package:flutter/material.dart';


class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal[100],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[100],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: 10
                      ),
                      Text(
                        "Need Help?",
                        key: ValueKey("help_page"),
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Here are some Frequently Asked Questions!",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),

                      SizedBox(height:25),
                      Text('I can’t login to Fit4U, what should I do?',style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15)),
                      SizedBox(height:5),
                      Text('Please check your username and password. If they are correct, you might close Fit4u and try it again for one or two times.',style: TextStyle(
                          fontSize: 12)),
                      SizedBox(height:25),
                      Text('I am unable to register, what should I do?',style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15)),
                      SizedBox(height:5),
                      Text('Please check that you are entering a valid email and password.',style: TextStyle(
                          fontSize: 12)),
                      SizedBox(height:25),
                      Text('Is filling out the survey mandatory?',style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15)),
                      SizedBox(height:5),
                      Text('In order to experience the full functionality of the application, it is recommended that you fill out the survey.',style: TextStyle(
                          fontSize: 12))

                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}