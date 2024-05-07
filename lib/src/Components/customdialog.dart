import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Log/login.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)), //this right here
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Another time',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 111, 15))))),
              Image.asset(
                'images/assets/1704817829043.png',
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                      'Welcome to the transparent philanthropy platform',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500))),
              const Padding(
                  padding: EdgeInsets.only(top: 25, right: 30, left: 30),
                  child: Text(
                      'We will help you have a unique volunteering experience',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey))),
              Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: NormalButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    height: 40,
                    width: 220,
                    text: 'Login or create an account',
                  ))
            ],
          )),
    );
  }
}
