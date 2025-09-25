import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  State<Home> createState() => _HomeState();
}

class Cat {
  String name;
  int age;
  String imgurl;

  Cat({required this.name, required this.age, required this.imgurl});
}

class _HomeState extends State<Home> {
  bool shadowColor = true;
  int currentPageIndex = 0;

  List<Cat> cats = [
    Cat(name: 'Leo', age: 3, imgurl: 'assets/images/cat.jpg'),
    Cat(name: 'Milo', age: 5, imgurl: 'assets/images/cat (2).jpg'),
    Cat(name: 'Chloe', age: 2, imgurl: 'assets/images/cat (3).jpg'),
    Cat(name: 'Bella', age: 1, imgurl: 'assets/images/cat (4).jpg'),
    Cat(name: 'Lucy', age: 4, imgurl: 'assets/images/cat (5).jpg'),
    Cat(name: 'Oliver', age: 6, imgurl: 'assets/images/cat (6).jpg'),
    Cat(name: 'Lily', age: 2, imgurl: 'assets/images/cat (7).jpg'),
    Cat(name: 'Tiger', age: 7, imgurl: 'assets/images/cat (8).jpg'),
    Cat(name: 'Shadow', age: 3, imgurl: 'assets/images/cat (9).jpg'),
    Cat(name: 'Smokey', age: 4, imgurl: 'assets/images/cat (10).jpg'),
    Cat(name: 'Toby', age: 2, imgurl: 'assets/images/cat (11).jpg'),
    Cat(name: 'Coco', age: 1, imgurl: 'assets/images/cat (12).jpg'),
    Cat(name: 'Simba', age: 5, imgurl: 'assets/images/cat (13).jpg'),
    Cat(name: 'Kitty', age: 3, imgurl: 'assets/images/cat (14).jpg'),
    Cat(name: 'Max', age: 6, imgurl: 'assets/images/cat (15).jpg'),
    Cat(name: 'Princess', age: 2, imgurl: 'assets/images/cat (16).jpg'),
    Cat(name: 'Rocky', age: 4, imgurl: 'assets/images/cat (17).jpg'),
    Cat(name: 'Sophie', age: 1, imgurl: 'assets/images/cat (18).jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(Icons.account_circle_outlined, size: 40),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(Icons.search, size: 40),
            ),
          ],
          shadowColor: shadowColor
              ? Theme.of(context).colorScheme.shadow
              : null,
        ),
        body: ListView.builder(
          itemCount: cats.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text(
                          "안녕하세요 사용자님!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                          left: 18,
                          right: 18,
                        ),
                        child: Divider(
                          color: Colors.blueAccent,
                          thickness: 1.2,
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 27,
                      right: 27,
                      bottom: 35,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 13,
                          right: 3,
                          top: 4,
                          bottom: 4,
                        ),
                        child: ListTile(
                          title: Text(
                            cats[index - 1].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("나이는 ${cats[index - 1].age}"),
                          trailing: SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                cats[index - 1].imgurl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
              icon: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('assets/icons/home.png', fit: BoxFit.fill),
                ),
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('assets/icons/skrr.png', fit: BoxFit.fill),
                ),
              ),
              label: 'Skrr',
            ),
            NavigationDestination(
              icon: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'assets/icons/notification.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              label: 'Noti',
            ),
            NavigationDestination(
              icon: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'assets/icons/setting.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
