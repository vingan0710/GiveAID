// ignore_for_file: prefer_const_constructors

import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Components/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_card/image_card.dart';
import 'package:masked_text/masked_text.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  ScrollController verticalController = ScrollController();
  TextEditingController _controller = TextEditingController();
  bool? checkVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
            Color.fromARGB(250, 250, 244, 238), //rgb(250, 244, 238),
        body: Stack(children: [
          Positioned.fill(
              child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: verticalController,
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(children: <Widget>[
                TransparentImageCard(
                  borderRadius: 0,
                  width: double.infinity,
                  height: 320,
                  imageProvider: NetworkImage(
                      'https://i.pinimg.com/474x/7d/4a/e3/7d4ae336325d6aafea503c4224c2b00f.jpg'),
                ),
                Positioned(
                    top: 75,
                    left: -5,
                    child: MaterialButton(
                        shape: const CircleBorder(),
                        color: Colors.black12,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ))),
                Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Text(
                    "It's not how much we give but how much love we put into giving. It's not how much we give but how much love we put into giving",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ]),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text("Supporting Information",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text("Enter donation amount"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: MaskedTextField(
                  controller: _controller,
                  mask: "###.###.###.###",
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 111, 15),
                      fontWeight: FontWeight.bold,
                      fontSize: 23.5),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text('VND',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      counterText: ''),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: <Widget>[
                    MoneyButton(onTap: () {}, text: '5.000'),
                    MoneyButton(onTap: () {}, text: '10.000'),
                    MoneyButton(onTap: () {}, text: '50.000'),
                    MoneyButton(onTap: () {}, text: '100.000'),
                    MoneyButton(onTap: () {}, text: '200.000'),
                    MoneyButton(onTap: () {}, text: '500.000'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text("Message",
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ),
              TextFieldDonate(text: "Let's exchange words of love together"),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 25),
                child: Text("Your Information",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text("Full name",
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ),
              TextFieldDonate(text: "Enter your fullname"),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text("Email",
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ),
              TextFieldDonate(text: 'Enter your email address'),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  'You will receive an email confirmation of your donation',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              Row(children: [
                Checkbox(
                  value: checkVisible,
                  onChanged: (bool? value) {
                    setState(() {
                      checkVisible = value;
                    });
                  },
                  side: MaterialStateBorderSide.resolveWith(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return null;
                      }
                      return const BorderSide(
                          width: 2, color: Color.fromARGB(255, 255, 111, 15));
                    },
                  ),
                  hoverColor: Color.fromARGB(255, 255, 111, 15),
                  activeColor: Color.fromARGB(255, 255, 111, 15),
                  checkColor: Colors.white,
                ),
                Text(
                  'Hide your support information from everyone',
                  style: TextStyle(fontSize: 16),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    'Or login with',
                    style: TextStyle(
                        fontSize: 16, color: Colors.deepOrange.shade600),
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: 135,
                          height: 65,
                          child: Center(
                              child: Image.asset(
                                  'images/assets/icon/2018_social_media_popular_app_logo_facebook-512.webp',
                                  width: 30,
                                  height: 30,fit: BoxFit.cover,))),
                    )),
                    Padding(
                    padding: EdgeInsets.only(top: 12,left: 15),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: 135,
                          height: 65,
                          child: Center(
                              child: Image.asset(
                                  'images/assets/icon/zalo-seeklogo.png',
                                  width: 40,
                                  height: 40,fit: BoxFit.cover,))),
                    )),
              ]),
              Container(height: 80)
            ]),
          )),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
                width: 422,
                height: 65,
                padding: const EdgeInsets.only(
                    left: 15, right: 25, bottom: 5, top: 10),
                alignment: Alignment.center,
                color: Colors.white,
                child: GardientButton(
                    onPressed: () {},
                    text: 'Donate now',
                    height: 45,
                    width: double.infinity)),
          )
        ]));
  }
}
