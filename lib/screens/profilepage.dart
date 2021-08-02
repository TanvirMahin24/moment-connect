import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:momentconnect/vars.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  bool loading = true;
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot userDoc =
        await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username = userDoc['username'];
      loading = false;
    });
  }

  saveData() async {
    usercollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'username': usernameController.text});

    setState(() {
      username = usernameController.text;
    });

    Navigator.pop(context);
  }

  openEditDialog() async {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: TextField(
                        controller: usernameController,
                        style: coolText(16, Colors.black, FontWeight.normal),
                        decoration: InputDecoration(
                            labelText: 'Update Username',
                            labelStyle:
                                coolText(16, Colors.grey, FontWeight.normal),
                            prefixIcon: const Icon(Icons.person)),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () => saveData(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              colors: GradientColors.facebookMessenger),
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style:
                                coolText(16, Colors.white, FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.facebookMessenger),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2 - 64,
                    top: MediaQuery.of(context).size.height / 3.1,
                  ),
                  child: const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://www.pasrc.org/sites/g/files/toruqf431/files/styles/freeform_750w/public/2021-03/blank-profile-picture_0.jpg?itok=iSBmDxc8'),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 130,
                      ),
                      Text(
                        username,
                        style: coolText(30, Colors.black87, FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => openEditDialog(),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                                colors: GradientColors.facebookMessenger),
                          ),
                          child: Center(
                            child: Text(
                              'Edit Profile',
                              style:
                                  coolText(16, Colors.white, FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
