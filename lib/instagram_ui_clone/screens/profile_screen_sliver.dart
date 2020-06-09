import 'package:flutter/material.dart';
import 'package:flutter_example/instagram_ui_clone/common/utils.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/insta_app_bar.dart';
import 'package:flutter_example/instagram_ui_clone/widgets/profile_tab_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfileScreenSliver extends StatefulWidget {
  const ProfileScreenSliver({Key key}) : super(key: key);

  @override
  _ProfileScreenSliverState createState() => _ProfileScreenSliverState();
}

class _ProfileScreenSliverState extends State<ProfileScreenSliver> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            titleSpacing: 0,
            title: InstaAppBar(
              height: 56,
              isProfileScreen: true,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'gyakhoe',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  SimpleLineIcons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            expandedHeight: 371,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 72),
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: _profileAvatar(
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 100 - 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _statsBox(count: '57', title: 'Posts'),
                              _statsBox(count: '185', title: 'Followers'),
                              _statsBox(count: '241', title: 'Following'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 98,
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'GS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'All photos are '),
                              TextSpan(
                                text: '#shotoniphone ',
                                style: TextStyle(
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'unless stated otherwise. NTS-\"Have teh courage to follow your heart and intuation.\" ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                  text: '#100daysofcode #flutterdeveloper',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                  ))
                            ],
                          ),
                        ),
                        Text(
                          'gyakhoe.com',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[500]),
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColorDark,
                      ),
                      child: Center(
                          child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 12, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Story Highligts',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600],
                    height: 1,
                  ),
                ],
              ),
            ),
            pinned: true,
            bottom: ProfileTabBar(
              height: 45,
              onTap: (index) {
                setState(() => pageIndex = index);
              },
            ),
          ),
          SliverGrid.count(
            crossAxisCount: pageIndex == 1 ? 2 : 3,
            children: List.generate(
              Utils.listOfImageUrl.length,
              (index) => pageIndex != 1
                  ? Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      child: Image(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(Utils.listOfImageUrl.elementAt(index)),
                      ),
                    )
                  : Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image(
                        image: NetworkImage(
                          Utils.listOfImageUrl.elementAt(index),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget _statsBox({
    @required String count,
    @required String title,
  }) {
    return Container(
      height: 98,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            count,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _profileAvatar({
    @required double height,
    @required double width,
    bool isStorySeen = false,
  }) {
    return Container(
      height: height, //155,
      width: width, //155,
      child: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height, // 150,
                width: width, //150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isStorySeen ? Colors.grey[500] : Colors.red,
                      width: 3,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height - 10, //140,
                width: width - 10, //140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(Utils.getRandomImageUrl()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}