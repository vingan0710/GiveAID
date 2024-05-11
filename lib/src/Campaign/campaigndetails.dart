import 'package:GiveAID/API/api_services.dart';
import 'package:GiveAID/Models/organization.dart';
import 'package:GiveAID/src/Account/accountdetails.dart';
import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Components/customlinebar.dart';
import 'package:GiveAID/src/Donate/donatepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';

class CampaignDetails extends StatefulWidget {
  final idOrg;
  const CampaignDetails({super.key, required this.idOrg});

  @override
  State<CampaignDetails> createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  ScrollController verticalController = ScrollController();
  var money = NumberFormat('#,###,000');
  var f = NumberFormat("###.#", "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FutureBuilder(
          future: APIServices().fetchOrgDetails(widget.idOrg),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Organization org = snapshot.data!;
              DateTime dt1 = org.day_end!;
              DateTime dt2 = org.day_start!;

              Duration diff = dt1.difference(dt2);

              return Positioned.fill(
                  child: SingleChildScrollView(
                controller: verticalController,
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Stack(children: <Widget>[
                    Image.network(
                      '${org.o_image}',
                      height: 320,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 35,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 3, bottom: 3),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.black45,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: const Text("Share",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 15))),
                      ),
                    ),
                    Positioned(
                        bottom: 15,
                        left: 15,
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 3, bottom: 3),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 232, 199),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Text(
                              "${org.topic_name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 111, 15)),
                            )))
                  ]),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 135, 206, 67)),
                              child: Image.asset(
                                  'images/assets/icon/957443.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                  color: Colors.white),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Campaign goals',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black45)),
                                  const SizedBox(height: 5),
                                  Text('${money.format(org.target)} USD',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500))
                                ])
                          ]),
                          const SizedBox(width: 10),
                          Row(children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 68, 108, 253)),
                              child: Image.asset(
                                  'images/assets/icon/5208393_alarm_clock_time_timer_icon.png',
                                  width: 22,
                                  height: 22,
                                  fit: BoxFit.cover,
                                  color: Colors.white),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Time remaining',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black45)),
                                  const SizedBox(height: 5),
                                  Text('${diff.inDays} days',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500))
                                ])
                          ])
                        ]),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("${org.o_name}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('images/assets/icon/8751239.png',
                              width: 22,
                              height: 22,
                              fit: BoxFit.cover,
                              color: Colors.black45),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            width: 355,
                            child: Text("${org.o_address}",
                                style: const TextStyle(
                                    color: Colors.black45, fontSize: 17)),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'Created by ',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                    text: '${org.name}',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AccountDetails(
                                                      idA: org.id_account,
                                                    )));
                                      },
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 255, 111, 15),
                                      fontWeight: FontWeight.bold,
                                    )),
                              ])),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: CustomLineBar(
                        width: double.infinity,
                        height: 7.5,
                        number: org.current! / org.target!,
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: CustomAchieved(
                      money: '${money.format(org.current)} USD',
                      fontSizeM: 19,
                      number: '${f.format(org.current! / org.target! * 100)}%',
                      fontSizeN: 17,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(mainAxisSize: MainAxisSize.min, children: [
                            Text('Fundraising companion ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('(123)',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 111, 15),
                                    fontSize: 17)),
                          ]),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 111, 15),
                                    fontSize: 15),
                              ))
                        ]),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      children: List.generate(
                        3,
                        (index) => const Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    radius: 22,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 111, 15),
                                    child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://ih1.redbubble.net/image.3884071365.1013/st,small,507x507-pad,600x600,f8f8f8.jpg'),
                                        radius: 20)),
                                SizedBox(width: 10),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name account',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(height: 1.5),
                                      Text('Called 5.000.000 VND',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black45)),
                                      SizedBox(height: 1.5),
                                      Text('Day start 15/04/2024',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black45))
                                    ])
                              ]),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15, top: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Story',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ])),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    child: ReadMoreText(
                      "${org.o_description}",
                      style: const TextStyle(fontSize: 15),
                      trimMode: TrimMode.Line,
                      trimLines: 5,
                      colorClickableText: Colors.grey.shade500,
                      trimCollapsedText: 'View more',
                      trimExpandedText: 'View less',
                      moreStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Image/Video',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            TextButton(
                                onPressed: () {},
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
                        10,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://img.wattpad.com/story_parts/1152211050/images/16b5ce795a38845e420318233362.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(height: 65)
                ]),
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(
                child: LoadingAnimationWidget.prograssiveDots(
              color: Colors.blue.shade300,
              size: 45,
            ));
          }),
      Positioned(
          top: 30,
          left: -15,
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
        bottom: 0,
        left: 0,
        child: Container(
            width: 422,
            height: 65,
            padding:
                const EdgeInsets.only(left: 15, right: 25, bottom: 5, top: 10),
            alignment: Alignment.center,
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOutline(
                      onPressed: () {},
                      text: 'Companion',
                      height: 45,
                      width: 185),
                  GardientButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DonatePage()));
                      },
                      text: 'Donate',
                      height: 45,
                      width: 185)
                ])),
      )
    ]));
  }
}
