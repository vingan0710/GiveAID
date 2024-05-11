import 'package:GiveAID/src/Account/accountdetails.dart';
import 'package:GiveAID/src/Campaign/campaigndetails.dart';
import 'package:GiveAID/src/Components/customlinebar.dart';
import 'package:GiveAID/src/Components/customtextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AllCampaign extends StatefulWidget {
  const AllCampaign({super.key});

  @override
  State<AllCampaign> createState() => _AllCampaignState();
}

class _AllCampaignState extends State<AllCampaign> {
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
      body: 
      SingleChildScrollView(
        controller: verticalController,
        scrollDirection: Axis.vertical,
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 2),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      splashColor: Colors.grey.shade100,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CampaignDetails(idOrg: null,)));
                      },
                      child: Container(
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  image: NetworkImage(
                                                      'https://img.wattpad.com/story_parts/1152211050/images/16b5ce795a38845e420318233362.jpg'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 15,
                                          left: 0,
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(2.5),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4)),
                                                color: Color.fromARGB(
                                                    255, 255, 111, 15)),
                                            height: 22,
                                            child: const Text(
                                              '114 day',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: SizedBox(
                                                  width: 235,
                                                  child: Text(
                                                    "It's not how much we give but how much love we put into giving",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                            ),
                                            const SizedBox(height: 5),
                                            RichText(
                                              text: TextSpan(
                                                  text: 'Created by ',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            'Name of account ',
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const AccountDetails(idA: null,)));
                                                              },
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              111,
                                                              15),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                  ]),
                                            ),
                                            const SizedBox(height: 10),
                                            CustomLineBar(
                                                width: 235,
                                                height: 4,
                                                number: 0.22,
                                                color: Colors.grey
                                                    .withOpacity(0.2)),
                                            const SizedBox(height: 5),
                                            const Row(children: [
                                              Row(children: [
                                                Text('Achieved '),
                                                Text('123.456.789 VND',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 111, 15)))
                                              ]),
                                              SizedBox(width: 50),
                                              Text('22%',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ])
                                          ]),
                                    ])
                              ])),
                    ),
                  ),
                )),
      ),
    );
  }
}
