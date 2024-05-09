import 'dart:io';

import 'package:GiveAID/API/api_services.dart';
import 'package:GiveAID/Models/account.dart';
import 'package:GiveAID/Models/organization.dart';
import 'package:GiveAID/src/Account/accountdetails.dart';
import 'package:GiveAID/src/Account/allaccount.dart';
import 'package:GiveAID/src/Account/notableorganization.dart';
import 'package:GiveAID/src/Campaign/allcampaign.dart';
import 'package:GiveAID/src/Campaign/campaigndetails.dart';
import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Components/customdialog.dart';
import 'package:GiveAID/src/Components/customlinebar.dart';
import 'package:GiveAID/src/Donate/donatepage.dart';
import 'package:GiveAID/src/search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_card/image_card.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> verticalData = [];
  List<int> horizontalData = [];

  final int increment = 10;

  bool isLoadingVertical = false;
  bool isLoadingHorizontal = false;

  @override
  void initState() {
    _loadMoreVertical();
    _loadMoreHorizontal();

    super.initState();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await Future.delayed(const Duration(seconds: 2));

    verticalData.addAll(
        List.generate(increment, (index) => verticalData.length + index));

    setState(() {
      isLoadingVertical = false;
    });
  }

  Future _loadMoreHorizontal() async {
    setState(() {
      isLoadingHorizontal = true;
    });

    // Add in an artificial delay
    await Future.delayed(const Duration(seconds: 2));

    horizontalData.addAll(
        List.generate(increment, (index) => horizontalData.length + index));

    setState(() {
      isLoadingHorizontal = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Image.asset('images/assets/icon/love.png',
              width: 35,
              height: 35,
              color: const Color.fromARGB(255, 255, 111, 15)),
          const Text(' GiveAID',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ]),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SearchPage()));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
              onPressed: () => _dialogLogin(context),
              icon: Image.asset(
                'images/assets/icon/avatar.webp',
                width: 35,
                height: 35,
                color: Colors.grey,
              ))
        ],
      ),
      body: LazyLoadScrollView(
        isLoading: isLoadingVertical,
        onEndOfPage: () => _loadMoreVertical(),
        child: Scrollbar(
          thickness: 0,
          child: ListView(children: [
            Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://serudsindia.org/wp-content/uploads/2018/07/3.png',
                        width: 370)),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Active Account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllAccount()));
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 111, 15),
                                  fontSize: 15),
                            ))
                      ],
                    )),
                Container(
                  width: double.infinity,
                  height: 90,
                  padding: const EdgeInsets.only(right: 12),
                  child: LazyLoadScrollView(
                    isLoading: isLoadingHorizontal,
                    scrollDirection: Axis.horizontal,
                    onEndOfPage: () => _loadMoreHorizontal(),
                    child: Scrollbar(
                      thickness: 0,
                      child: FutureBuilder<List<Account>>(
                        future: APIServices().fetchAccount(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Account>? accList = snapshot.data;
                            return ListView.builder(
                                // shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: accList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Column(children: [
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AccountDetails(
                                                              idA:
                                                                  accList[index]
                                                                      .id)));
                                            },
                                            child: accList[index].avt == null
                                                ? const CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        'https://www.logolynx.com/images/logolynx/b4/b4ef8b89b08d503b37f526bca624c19a.jpeg'),
                                                    radius: 30,
                                                  )
                                                : CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        '${accList[index].avt}'),
                                                    radius: 30,
                                                  )),
                                        Container(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            width: 65,
                                            child: Text(
                                              '${accList[index].name}',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 15),
                                            ))
                                      ]));
                                });
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return Center(
                              child: LoadingAnimationWidget.threeArchedCircle(
                            color: Colors.blue.shade300,
                            size: 45,
                          ));
                        },
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade300, height: 30),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          Image.asset('images/assets/icon/graduation.png',
                              width: 18,
                              height: 18,
                              color: const Color.fromARGB(255, 255, 111, 15)),
                          const Text(' Outstanding fundraising campaign',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18))
                        ]),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllCampaign()));
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 111, 15),
                                  fontSize: 15),
                            ))
                      ],
                    )),
                Container(
                  width: double.infinity,
                  height: 320,
                  padding: const EdgeInsets.only(right: 12),
                  child: LazyLoadScrollView(
                    isLoading: isLoadingHorizontal,
                    scrollDirection: Axis.horizontal,
                    onEndOfPage: () => _loadMoreHorizontal(),
                    child: Scrollbar(
                      thickness: 0,
                      child: FutureBuilder<List<Organization>>(
                        future: APIServices().fetchOrganizationOutstanding(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Organization>? outList = snapshot.data;
                            return ListView.builder(
                                // shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: outList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardOutstanding(out: outList[index]);
                                });
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return Center(
                              child: LoadingAnimationWidget.threeArchedCircle(
                            color: Colors.blue.shade300,
                            size: 45,
                          ));
                        },
                      ),
                    ),
                  ),
                ),
                Divider(
                    color: Colors.grey.shade300, thickness: 5.5, height: 30),
                const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [CardCampaign(), CardDonate()],
                    )),
                Divider(color: Colors.grey.shade300, thickness: 5, height: 30),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Image.asset('images/assets/icon/people-256.webp',
                                width: 18,
                                height: 18,
                                color: const Color.fromARGB(255, 255, 111, 15)),
                            const Text(' Notable fundraising organization',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18))
                          ]),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NotableOrgazation()));
                              },
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 111, 15),
                                    fontSize: 15),
                              ))
                        ])),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                          10, (index) => const CardOrganization())),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _dialogLogin(BuildContext context) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const CustomDialog();
      },
    );
  }
}

// ignore: must_be_immutable
class CardOutstanding extends StatelessWidget {
  Organization? out;
  var money = NumberFormat('#,###,000');
  var f = NumberFormat("###.#", "en_US");
  
  CardOutstanding({
    this.out,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dt1 = DateTime.now();
    DateTime dt2 = out!.day_start!;

    Duration diff = dt1.difference(dt2);

    return Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CampaignDetails()));
            },
            child: Container(
                width: 280,
                height: 315,
                color: Colors.grey.shade100,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Positioned(
                            child: TransparentImageCard(
                          borderRadius: 0,
                          width: double.infinity,
                          height: 150,
                          imageProvider: NetworkImage(out!.o_image!),
                        )),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                                width: 65,
                                height: 22,
                                child: Text("${diff.inDays} days"),),),
                        Positioned(
                            bottom: 18,
                            left: 10,
                            child: Row(
                              children: [
                                out!.avt == null
                                    ? const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.logolynx.com/images/logolynx/b4/b4ef8b89b08d503b37f526bca624c19a.jpeg'),
                                        radius: 20)
                                    : CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(out!.avt!),
                                        radius: 20),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(out!.name!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                    Text(
                                      '@${out!.username!}',
                                      style: const TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ]),
                      const SizedBox(height: 10),
                      Container(
                          padding: const EdgeInsets.only(left: 15),
                          width: 270,
                          child: Text(
                            out!.o_name!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 15, top: 10, right: 15),
                          child: CustomAchieved(
                            money: '${money.format(out!.current)} USD',
                            fontSizeM: 19,
                            number:
                                '${f.format(out!.current! / out!.target! * 100)}%',
                            fontSizeN: 17,
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 15, top: 10, right: 15),
                          child: CustomLineBar(
                              width: double.infinity,
                              height: 10,
                              number: out!.current! / out!.target!,
                              color: Colors.grey.withOpacity(0.15))),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
                        child: ButtonOutline(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DonatePage()));
                            },
                            text: 'Donate',
                            height: 30,
                            width: double.infinity),
                      ),
                      
                    ])),
          ),
        ));
  }
}

class CardCampaign extends StatefulWidget {
  const CardCampaign({super.key});

  @override
  State<CardCampaign> createState() => _CardCampaignState();
}

class _CardCampaignState extends State<CardCampaign> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () {},
        child: SizedBox(
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://ih1.redbubble.net/image.3884071365.1013/st,small,507x507-pad,600x600,f8f8f8.jpg'),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 340,
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: 'Name of account ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AccountDetails(
                                                  idA: null,
                                                )));
                                  },
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  const TextSpan(
                                      text: ' added 3 new images for the ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal)),
                                  TextSpan(
                                      text: 'Name of campaign ',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CampaignDetails()));
                                        },
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const TextSpan(
                                      text: ' campaign',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal)),
                                ],
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '... minute before',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: ReadMoreText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: const TextStyle(fontSize: 15),
                    trimMode: TrimMode.Line,
                    trimLines: 3,
                    colorClickableText: Colors.grey.shade500,
                    trimCollapsedText: 'View more',
                    trimExpandedText: 'View less',
                    moreStyle:
                        TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  )),
              ImageSlideshow(
                width: double.infinity,
                height: 300,
                isLoop: false,
                initialPage: 0,
                indicatorColor: const Color.fromARGB(255, 255, 111, 15),
                indicatorBackgroundColor: Colors.grey,
                indicatorRadius: 4,
                children: [
                  Image.network(
                    'https://i.pinimg.com/originals/44/21/ed/4421ed1a61043d664419920bac159697.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://i.pinimg.com/originals/13/d6/a4/13d6a41a687130e63cc54f62a1c8b08f.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://i.pinimg.com/originals/08/5f/4c/085f4cbbacbfb1b6cea9fa47f9ecb29b.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: isSelected == true
                            ? const Icon(Icons.favorite_border_sharp)
                            : const Icon(Icons.favorite_sharp),
                        iconSize: 25,
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                      ),
                      IconButton(
                        icon: Image.asset('images/assets/icon/7561933.png',
                            width: 20, height: 20, fit: BoxFit.cover),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Image.asset('images/assets/icon/13326643.png',
                        width: 25, height: 25, fit: BoxFit.cover),
                    onPressed: () {},
                  ),
                ],
              )
            ])),
      ),
    );
  }
}

class CardDonate extends StatefulWidget {
  const CardDonate({super.key});

  @override
  State<CardDonate> createState() => _CardDonateState();
}

class _CardDonateState extends State<CardDonate> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://ih1.redbubble.net/image.3884071365.1013/st,small,507x507-pad,600x600,f8f8f8.jpg'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 340,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        "Name of account ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text('is calling for support',
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '... minute before',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CampaignDetails()));
          },
          child: Container(
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Positioned(
                          child: Image.network(
                              'https://i.pinimg.com/originals/44/21/ed/4421ed1a61043d664419920bac159697.jpg',
                              height: 280,
                              width: double.infinity,
                              fit: BoxFit.cover)),
                      Positioned(
                          top: 15,
                          left: 20,
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              width: 65,
                              height: 22,
                              child: const Text('14 day')))
                    ]),
                    const SizedBox(height: 10),
                    Container(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        width: double.infinity,
                        child: const Text(
                          "It's not how much we give but how much love we put into giving",
                          style: TextStyle(fontSize: 17),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                    const Padding(
                        padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                        child: CustomAchieved(
                          money: '123.456.789 VND',
                          fontSizeM: 19,
                          number: '13%',
                          fontSizeN: 17,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                        child: CustomLineBar(
                          width: double.infinity,
                          height: 10,
                          number: 0.13,
                          color: Colors.grey.withOpacity(0.15),
                        )),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 15, bottom: 8),
                          child: GardientButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DonatePage()));
                              },
                              text: 'Donate',
                              height: 40,
                              width: 80))
                    ])
                  ])),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: isSelected == true
                    ? const Icon(Icons.favorite_border_sharp)
                    : const Icon(Icons.favorite_sharp),
                iconSize: 25,
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              ),
              IconButton(
                icon: Image.asset('images/assets/icon/7561933.png',
                    width: 20, height: 20, fit: BoxFit.cover),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('images/assets/icon/share-network-256.webp',
                    width: 20, height: 20, fit: BoxFit.cover),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: Image.asset('images/assets/icon/13326643.png',
                width: 25, height: 25, fit: BoxFit.cover),
            onPressed: () {},
          ),
        ],
      )
    ]);
  }
}

class CardOrganization extends StatelessWidget {
  const CardOrganization({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountDetails(
                            idA: null,
                          )));
            },
            child: Container(
                width: 220,
                color: Colors.grey.shade100,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://th.bing.com/th?id=OIF.JqHEZWAGwYykgo%2bJa7Lp4Q&rs=1&pid=ImgDetMain'),
                            radius: 40,
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('Name of organization',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Text('72 favorites ',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          Image.asset(
                              'images/assets/icon/record-round-circle-dot-256.webp',
                              width: 5,
                              height: 5,
                              color: Colors.grey),
                          const Text(' 1N upvotes',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                        ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 30, right: 12, left: 12, bottom: 15),
                          child: ButtonOutline(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DonatePage()));
                              },
                              text: 'Donate',
                              height: 30,
                              width: double.infinity))
                    ])),
          ),
        ));
  }
}
