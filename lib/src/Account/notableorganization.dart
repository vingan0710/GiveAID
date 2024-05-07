import 'package:GiveAID/src/Account/accountdetails.dart';
import 'package:GiveAID/src/Components/customtextfield.dart';
import 'package:flutter/material.dart';

class NotableOrgazation extends StatefulWidget {
  const NotableOrgazation({super.key});

  @override
  State<NotableOrgazation> createState() => _NotableOrgazationState();
}

class _NotableOrgazationState extends State<NotableOrgazation> {
  ScrollController verticalController = ScrollController();
  bool _visibleTextField = false;
  bool _visibleText = true;
  bool _visibleIcon = true;
  @override
  void initState() {
    super.initState();
    setState(() {
      _visibleTextField = false;
      _visibleText = true;
      _visibleIcon = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                  onPressed: () {
                    if (_visibleTextField == true) {
                      setState(() {
                        _visibleTextField = false;
                        _visibleText = true;
                        _visibleIcon = true;
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black54,
                    size: 25,
                  ))),
          title: Column(children: [
            Visibility(
              visible: _visibleText,
              child: const Text('Outstanding fundraising campaign',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            Visibility(
                visible: _visibleTextField,
                child: CustomTextField(
                    icon: Icon(Icons.search,
                        color: Colors.grey.shade400, size: 25),
                    text: 'Search'))
          ]),
          actions: [
            Visibility(
                visible: _visibleIcon,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        _visibleTextField = !_visibleTextField;
                        _visibleText = !_visibleText;
                        _visibleIcon = false;
                      });
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.black54,
                      size: 25,
                    )))
          ]),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountDetails(idA: null,)));
                    },
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://ih1.redbubble.net/image.3884071365.1013/st,small,507x507-pad,600x600,f8f8f8.jpg'),
                      radius: 35,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 5),
                      width: 65,
                      child: const Text(
                        'Name of Account',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ))
                ],
              ));
        },
      ),
    );
  }
}
