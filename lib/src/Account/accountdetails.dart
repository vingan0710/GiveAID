import 'package:GiveAID/API/api_services.dart';
import 'package:GiveAID/src/Campaign/campaigndetails.dart';
import 'package:GiveAID/src/Components/custombutton.dart';
import 'package:GiveAID/src/Components/customlinebar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/link.dart';

class AccountDetails extends StatefulWidget {
  final idA;
  const AccountDetails({super.key, required this.idA});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  ScrollController verticalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FutureBuilder(
          future: APIServices().fetchAccountOrganizationGallery(widget.idA),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var money = NumberFormat('#,###,000');
              var f = NumberFormat("###.#", "en_US");

              String k_m_b_generator_num(num) {
                if (num > 999 && num < 99999) {
                  return "${(num / 1000).toStringAsFixed(1)} K";
                } else if (num > 99999 && num < 999999) {
                  return "${(num / 1000).toStringAsFixed(0)} K";
                } else if (num > 999999 && num < 999999999) {
                  return "${(num / 1000000).toStringAsFixed(1)} M";
                } else if (num > 999999999) {
                  return "${(num / 1000000000).toStringAsFixed(1)} B";
                } else {
                  return num.toString();
                }
              }

              var follower = k_m_b_generator_num(snapshot.data!.follower);
              var like = k_m_b_generator_num(snapshot.data!.like);
              var support = k_m_b_generator_num(snapshot.data!.support);

              return Positioned.fill(
                  child: SingleChildScrollView(
                controller: verticalController,
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 525,
                    child: Stack(children: <Widget>[
                      Image.asset('images/assets/volunteer.png'),
                      Positioned(
                        top: 200,
                        left: 105,
                        child: Column(children: [
                          CircleAvatar(
                            radius: 78,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 111, 15),
                            child: snapshot.data!.avt == null
                                ? const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://www.logolynx.com/images/logolynx/b4/b4ef8b89b08d503b37f526bca624c19a.jpeg'),
                                    radius: 75,
                                  )
                                : CircleAvatar(
                                    backgroundImage:
                                        NetworkImage('${snapshot.data!.avt}'),
                                    radius: 75),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text('${snapshot.data!.name}',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text('@${snapshot.data!.username}',
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                          ),
                          // ignore: unrelated_type_equality_checks
                          snapshot.data!.type_acc == true
                              ? Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(198, 253, 201, 178),
                                    // Set border width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: const Text(
                                    "Organization",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 111, 15)),
                                  ),
                                )
                              : Container(),
                          Row(children: [
                            CusIconButton(
                                onTap: () {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.info(
                                      backgroundColor: const Color.fromARGB(
                                          255, 246, 178, 0),
                                      icon: Image.asset(
                                          'images/assets/icon/1266877.png',
                                          color: const Color(0x15000000)),
                                      message:
                                          'The account has not yet set this information.',
                                    ),
                                  );
                                },
                                url:
                                    'images/assets/icon/170987_phone_icon.png'),
                            CusIconButton(
                                onTap: () {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.info(
                                      backgroundColor: const Color.fromARGB(
                                          255, 246, 178, 0),
                                      icon: Image.asset(
                                          'images/assets/icon/1266877.png',
                                          color: const Color(0x15000000)),
                                      message:
                                          'The account has not yet set this information.',
                                    ),
                                  );
                                },
                                url:
                                    'images/assets/icon/4202011_email_gmail_mail_logo_social_icon.png'),
                            Link(
                              uri: Uri.parse('https://github.com/vingan0710/'),
                              builder: (context, followLink) {
                                return InkWell(
                                    onTap: followLink,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5, top: 15),
                                        child: Image.asset(
                                          'images/assets/icon/website.png',
                                          width: 25,
                                          height: 25,
                                          fit: BoxFit.cover,
                                        )));
                              },
                            ),
                            CusIconButton(
                                onTap: () {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.info(
                                      backgroundColor: const Color.fromARGB(
                                          255, 246, 178, 0),
                                      icon: Image.asset(
                                          'images/assets/icon/1266877.png',
                                          color: const Color(0x15000000)),
                                      message:
                                          'The account has not yet set this information.',
                                    ),
                                  );
                                },
                                url:
                                    'images/assets/icon/5296499_fb_facebook_facebook logo_icon.png'),
                            CusIconButton(
                                onTap: () {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.info(
                                      backgroundColor: const Color.fromARGB(
                                          255, 246, 178, 0),
                                      icon: Image.asset(
                                          'images/assets/icon/1266877.png',
                                          color: const Color(0x15000000)),
                                      message:
                                          'The account has not yet set this information.',
                                    ),
                                  );
                                },
                                url:
                                    'images/assets/icon/7024783_tiktok_social media_icon.png'),
                            CusIconButton(
                                onTap: () {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.info(
                                      backgroundColor: const Color.fromARGB(
                                          255, 246, 178, 0),
                                      icon: Image.asset(
                                          'images/assets/icon/1266877.png',
                                          color: const Color(0x15000000)),
                                      message:
                                          'The account has not yet set this information.',
                                    ),
                                  );
                                },
                                url:
                                    'images/assets/icon/4375133_logo_youtube_icon.png'),
                          ]),
                        ]),
                      )
                    ]),
                  ),
                  snapshot.data!.description != null
                      ? Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    color: Colors.grey.shade300,
                                    width: 70,
                                    height: 1.5),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Image.asset(
                                        'images/assets/icon/inverted-commas.png',
                                        width: 20,
                                        height: 20)),
                                Container(
                                    color: Colors.grey.shade300,
                                    width: 70,
                                    height: 1.5),
                              ]),
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "${snapshot.data!.description}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 15),
                              )),
                        ])
                      : const Column(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    NormalButton(
                        text: 'Follow',
                        onPressed: () {},
                        width: 180,
                        height: 40),
                    Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade200,
                            ),
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_outline,
                                    color:
                                        Color.fromARGB(255, 255, 111, 15))))),
                    Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade200,
                            ),
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Image.asset(
                                  'images/assets/icon/8530608_comment_dots_icon.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                  color:
                                      const Color.fromARGB(255, 255, 111, 15)),
                              onPressed: () {},
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200,
                          ),
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Image.asset(
                                'images/assets/icon/share-network-256.webp',
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                                color: const Color.fromARGB(255, 255, 111, 15)),
                            onPressed: () {},
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200),
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Image.asset('images/assets/icon/12046243.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                              color: const Color.fromARGB(255, 255, 111, 15)),
                          onPressed: () {},
                        ))
                  ]),
                  const SizedBox(height: 30),
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [
                              Text(follower,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 3),
                              const Text('Followers',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54))
                            ]),
                            VerticalDivider(
                                color: Colors.grey.shade300, width: 45),
                            Column(children: [
                              Text(like,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 3),
                              const Text('Favorites',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54))
                            ]),
                            VerticalDivider(
                                color: Colors.grey.shade300, width: 45),
                            Column(children: [
                              Text(support,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 3),
                              const Text('Supports',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54))
                            ]),
                          ]),
                    ),
                  ),
                  Divider(
                      thickness: 7, color: Colors.grey.shade200, height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Fundraising campaign',
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
                        ]),
                  ),
                  Container(
                    width: double.infinity,
                    height: 293,
                    padding: const EdgeInsets.only(right: 12),
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      for (var item in snapshot.data!.getOrganizations())
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CampaignDetails(
                                                    idOrg: item.id)));
                                  },
                                  child: SizedBox(
                                      width: 375,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(children: [
                                            Positioned(
                                              child: TransparentImageCard(
                                                borderRadius: 0,
                                                width: double.infinity,
                                                height: 285,
                                                imageProvider: NetworkImage(
                                                    '${item.o_image}'),
                                              ),
                                            ),
                                            Positioned(
                                              top: 15,
                                              left: 15,
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Colors.white),
                                                width: 65,
                                                height: 22,
                                                child: const Text('14 day'),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 18,
                                                left: 15,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 340,
                                                      child: Text(
                                                        '${item.o_name}',
                                                        style: const TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(children: [
                                                      CustomLineBar(
                                                        width: 320,
                                                        height: 7.5,
                                                        number: item.current! /
                                                            item.target!,
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        '${f.format(item.current! / item.target! * 100)}%',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ]),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Text(
                                                              'Achieved ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15)),
                                                          Text(
                                                              money.format(
                                                                  item.current),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Text(
                                                              ' / ${money.format(item.target)} USD ',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15)),
                                                        ]),
                                                  ],
                                                )),
                                          ]),
                                        ],
                                      ))),
                            )),
                    ]),
                  ),
                  Divider(
                      thickness: 7, color: Colors.grey.shade200, height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Image',
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
                        ]),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 85,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      for (var item in snapshot.data!.getGallery())
                        Wrap(children: [
                          CusImageButton(
                              click: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              image: item.image,
                                            )));
                              },
                              url: '${item.image}'),
                          CusImageButton(
                              click: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              image: item.image1,
                                            )));
                              },
                              url: '${item.image1}'),
                          CusImageButton(
                              click: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              image: item.image2,
                                            )));
                              },
                              url: '${item.image2}'),
                        ]),
                    ]),
                  ),

                  Divider(
                      thickness: 7, color: Colors.grey.shade200, height: 50),
                  const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Action',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ])),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              // Set border width
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                            ),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Image.asset('images/assets/icon/add.png',
                                  width: 20,
                                  height: 20,
                                  color: Colors.grey.shade800),
                              Text(
                                "  Event",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800),
                              )
                            ]),
                          )),
                      const SizedBox(width: 15),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              // Set border width
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                            ),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Image.asset(
                                  'images/assets/icon/2849817_favorite_star_favorites_favourite_multimedia_icon.png',
                                  width: 20,
                                  height: 20,
                                  color: Colors.grey.shade800),
                              Text(
                                " Milestones",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800),
                              )
                            ]),
                          ))
                    ]),
                  ),
                  const SizedBox(height: 15),
                  //CardCampaign(gal: ,),
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
          top: 35,
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
            child: Column(children: [
              NormalButton(
                  text: 'Join hands with the same name organization',
                  onPressed: () {},
                  width: double.infinity,
                  height: 45)
            ])),
      )
    ]));
  }
}

class DetailScreen extends StatelessWidget {
  String? image;

  DetailScreen({this.image, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.close,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              '$image',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
