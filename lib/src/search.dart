import 'package:GiveAID/src/Account/accountdetails.dart';
import 'package:GiveAID/src/Campaign/campaigndetails.dart';
import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Components/customlinebar.dart';
import 'package:GiveAID/src/Components/customtextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  TabController? _listViewController;
  ScrollController verticalController = ScrollController();
  @override
  void initState() {
    super.initState();
    _listViewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black54,
                    size: 25,
                  ))),
          centerTitle: true,
          title: CustomTextField(
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade400,
                size: 25,
              ),
              text: 'Search'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.5,
            indicatorColor: const Color.fromARGB(255, 255, 111, 15),
            dividerColor: Colors.grey.shade200,
            labelColor: const Color.fromARGB(255, 255, 111, 15),
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.5),
            tabs: const [
              Tab(text: 'Account'),
              Tab(text: 'Campaign'),
            ],
            controller: _listViewController,
          ),
        ),
        body: TabBarView(
          controller: _listViewController,
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AccountDetails(idA: null,)));
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
            SingleChildScrollView(
                controller: verticalController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        SortButton(onTap: () {}, text: 'Arrange', width: 110),
                        SortButton(onTap: () {}, text: 'Followed', width: 120),
                        SortButton(onTap: () {}, text: 'Location', width: 120),
                        SortButton(onTap: () {}, text: 'Category', width: 120),
                      ]),
                    ),
                    ListView.builder(
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
                                            builder: (context) =>
                                                const CampaignDetails(idOrg: null,)));
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      color: Colors.grey.shade200,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: const DecorationImage(
                                                              image: NetworkImage(
                                                                  'https://img.wattpad.com/story_parts/1152211050/images/16b5ce795a38845e420318233362.jpg'),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 15,
                                                      left: 0,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.5),
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        4),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            4)),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    111,
                                                                    15)),
                                                        height: 22,
                                                        child: const Text(
                                                          '114 day',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                          child: SizedBox(
                                                              width: 235,
                                                              child: Text(
                                                                "It's not how much we give but how much love we put into giving",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  'Created by ',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        'Name of account ',
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (context) => const AccountDetails(idA: null,)));
                                                                          },
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          111,
                                                                          15),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    )),
                                                              ]),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        CustomLineBar(
                                                            width: 235,
                                                            height: 4,
                                                            number: 0.22,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2)),
                                                        const SizedBox(
                                                            height: 5),
                                                        const Row(children: [
                                                          Row(children: [
                                                            Text('Achieved '),
                                                            Text(
                                                                '123.456.789 VND',
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            111,
                                                                            15)))
                                                          ]),
                                                          SizedBox(width: 50),
                                                          Text('22%',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))
                                                        ])
                                                      ]),
                                                ])
                                          ])),
                                ),
                              ),
                            )),
                  ],
                )),
          ],
        ));
  }
}
