import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momentconnect/screens/profilepage.dart';
import 'package:momentconnect/screens/videocallpage.dart';
import 'package:momentconnect/vars.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pages = [VideoCallPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: coolText(16, Colors.blue, FontWeight.normal),
        unselectedItemColor: Colors.black,
        currentIndex: page,
        unselectedLabelStyle: coolText(16, Colors.black, FontWeight.normal),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_call,
              size: 32,
            ),
            title: Text("Video Call"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 32,
            ),
            title: Text("Profile"),
          ),
        ],
      ),
      body: pages[page],
    );
  }
}
