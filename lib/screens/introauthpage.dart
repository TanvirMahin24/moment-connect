import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:momentconnect/auth/authscreen.dart';
import 'package:momentconnect/vars.dart';

class IntroAuthPage extends StatefulWidget {
  const IntroAuthPage({Key? key}) : super(key: key);

  @override
  _IntroAuthPageState createState() => _IntroAuthPageState();
}

class _IntroAuthPageState extends State<IntroAuthPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to the moment connect forr friends and family",
          image: Center(
            child: Image.asset(
              'images/welcome.png',
              height: 175,
            ),
          ),
          decoration: PageDecoration(
              bodyTextStyle: coolText(20, Colors.black, FontWeight.normal),
              titleTextStyle: coolText(20)),
        ),
        PageViewModel(
          title: "Welcome 2",
          body: "Welcome to the moment connect forr friends and family 2",
          image: Center(
            child: Image.asset(
              'images/conference.png',
              height: 175,
            ),
          ),
          decoration: PageDecoration(
              bodyTextStyle: coolText(20, Colors.black, FontWeight.normal),
              titleTextStyle: coolText(20)),
        ),
        PageViewModel(
          title: "Welcome 3",
          body: "Welcome to the moment connect forr friends and family 3",
          image: Center(
            child: Image.asset(
              'images/secure.jpg',
              height: 175,
            ),
          ),
          decoration: PageDecoration(
              bodyTextStyle: coolText(20, Colors.black, FontWeight.normal),
              titleTextStyle: coolText(20)),
        )
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AuthScreen()));
      },
      onSkip: () {},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next, size: 45),
      next: const Icon(Icons.arrow_forward_ios, size: 45),
      done: const Text(
        "done",
      ),
    );
  }
}
