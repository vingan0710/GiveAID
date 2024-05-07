import 'package:GiveAID/src/Account/accountdetails.dart';
import 'package:GiveAID/src/Components/customtextfield.dart';
import 'package:flutter/material.dart';

class AllAccount extends StatefulWidget {
  const AllAccount({super.key});

  @override
  State<AllAccount> createState() => _AllAccountState();
}

class _AllAccountState extends State<AllAccount> with TickerProviderStateMixin {
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
              padding: EdgeInsets.only(left: 12),
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
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.5),
            tabs: const [
              Tab(text: 'Organization'),
              Tab(text: 'Individual'),
            ],
            controller: _listViewController,
          ),
        ),
        body: TabBarView(controller: _listViewController, children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
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
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
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
        ]));
  }
}
