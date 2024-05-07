import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Components/customtextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ScrollController verticalController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Scrollbar(
          thickness: 0,
          thumbVisibility: true,
          controller: verticalController,
          child: SingleChildScrollView(
            controller: verticalController,
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(children: [
                Stack(children: <Widget>[
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Image.asset(
                      'images/assets/GiveAID.png',
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 15,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                            'images/assets/icon/4115230_cancel_close_delete_icon.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 300,
                    left: -5,
                    child: ClipPath(
                      clipper: OvalTopBorderClipper(),
                      child: Container(
                        width: 422,
                        color: Colors.white,
                        child: Padding(padding: EdgeInsets.only(top: 75)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 265,
                    left: 120,
                    child: IconButton(
                        onPressed: () {},
                        icon: PhysicalModel(
                            color: Colors.grey.shade100,
                            elevation: 5,
                            shape: BoxShape.circle,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                  'images/assets/icon/317746_facebook_social media_social_icon.png',
                                  width: 30,
                                  height: 30),
                              radius: 30,
                            ))),
                  ),
                  Positioned(
                    top: 265,
                    left: 220,
                    child: IconButton(
                        onPressed: () {},
                        icon: PhysicalModel(
                            color: Colors.grey.shade100,
                            elevation: 5,
                            shape: BoxShape.circle,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                  'images/assets/icon/zalotext.png',
                                  width: 40,
                                  height: 40),
                              radius: 30,
                            ))),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Colors.grey.shade300, width: 110, height: 1),
                        const Text("    or continue with email    "),
                        Container(
                            color: Colors.grey.shade300, width: 110, height: 1)
                      ]),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: CustomTextField(icon: Image.asset(
                                    'images/assets/icon/817562.png',
                                    width: 5,
                                    height: 5,
                                    fit: BoxFit.fill,
                                    color: Colors.grey.shade400,
                                  ), text: 'Enter your email address')
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: TextFormField(
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(
                                    'images/assets/icon/812519.png',
                                    width: 5,
                                    height: 5,
                                    fit: BoxFit.fill,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey.shade400,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        passwordVisible = !passwordVisible;
                                      },
                                    );
                                  },
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: 'Enter password',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot password',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 111, 15)),
                                  ))
                            ]),
                        NormalButton(
                            text: 'Login',
                            onPressed: () {},
                            width: double.infinity,
                            height: 40),
                            Padding(padding: EdgeInsets.only(top: 25),child: 
                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                              text: 'No account? ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black45),
                              children: [
                                TextSpan(
                                    text: 'Create account',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 255, 111, 15),
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            )),
                          ],
                        ))
                        
                      ],
                    )),
              ]),
            ),
          ),
        ));
  }
}
