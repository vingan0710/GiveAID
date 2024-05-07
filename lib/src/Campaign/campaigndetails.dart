import 'package:GiveAID/src/Account/accountdetails.dart';
import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Components/customlinebar.dart';
import 'package:GiveAID/src/Donate/donatepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CampaignDetails extends StatefulWidget {
  const CampaignDetails({super.key});

  @override
  State<CampaignDetails> createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  ScrollController verticalController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: SingleChildScrollView(
        controller: verticalController,
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Stack(children: <Widget>[
            Image.network(
              'https://i.pinimg.com/474x/7d/4a/e3/7d4ae336325d6aafea503c4224c2b00f.jpg',
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
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const Text("Share",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 15))),
                )),
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
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Text(
                      "Other",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 111, 15)),
                    )))
          ]),
          const SizedBox(height: 20),
          Row(children: [
            Row(children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 135, 206, 67)),
                child: Image.asset('images/assets/icon/957443.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                    color: Colors.white),
              ),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Campaign goals',
                        style: TextStyle(fontSize: 15, color: Colors.black45)),
                    SizedBox(height: 5),
                    Text('5.000.000.000 VND',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500))
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
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Time remaining',
                        style: TextStyle(fontSize: 15, color: Colors.black45)),
                    SizedBox(height: 5),
                    Text('345 days',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500))
                  ])
            ])
          ]),
          const SizedBox(height: 20),
          const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Name of campaign",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start)),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset('images/assets/icon/8751239.png',
                    width: 22,
                    height: 22,
                    fit: BoxFit.cover,
                    color: Colors.black45),
                Container(
                    padding: const EdgeInsets.only(left: 5),
                    width: 355,
                    child: const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(color: Colors.black45, fontSize: 17)))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 18, top: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                RichText(
                    text: TextSpan(
                  text: 'Created by ',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'Name of account ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountDetails(idA: null,)));
                          },
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 111, 15),
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )),
              ])),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: CustomLineBar(
                  width: double.infinity,
                  height: 7.5,
                  number: 0.19,
                  color: Colors.grey.withOpacity(0.5))),
          const Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: CustomAchieved(
                money: '123.456.789 VND',
                fontSizeM: 19,
                number: '13%',
                fontSizeN: 17,
              )),
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
                  ])),
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
                              ]))))),
          const Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Story',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ])),
          Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 20),
              child: ReadMoreText(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: const TextStyle(fontSize: 15),
                trimMode: TrimMode.Line,
                trimLines: 5,
                colorClickableText: Colors.grey.shade500,
                trimCollapsedText: 'View more',
                trimExpandedText: 'View less',
                moreStyle: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              )),
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
      )),
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
                                builder: (context) => DonatePage()));
                      },
                      text: 'Donate',
                      height: 45,
                      width: 185)
                ])),
      )
    ]));
  }
}
