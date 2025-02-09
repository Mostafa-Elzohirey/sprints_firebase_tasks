import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprints_firebase_tasks/locales.dart';
import 'package:sprints_firebase_tasks/sign_up_page.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.localization});

  final FlutterLocalization localization;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(deviceWidth * 0.03),
              child: Row(
                children: [
                  Icon(Icons.language),
                  TextButton(
                    onPressed: () {
                      showLanguageBottomSheet(widget.localization);
                    },
                    child: Text(
                      AppLocale.lang.getString(context),
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          AppLocale.login.getString(context),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: deviceWidth * 0.02,
              right: deviceWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocale.email.getString(context),
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.black),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocale.entermail.getString(context);
                    }
                    if (!value.contains("@")) {
                      return AppLocale.mailmust.getString(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Text(
                  AppLocale.password.getString(context),
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  obscureText: obsecurePass,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecurePass = !obsecurePass;
                          });
                        },
                        icon: Icon(obsecurePass
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      ),
                      border: OutlineInputBorder(),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.black),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocale.enterpass.getString(context);
                    }
                    if (value.length < 6) {
                      return AppLocale.passmust.getString(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      AppLocale.noAcc.getString(context),
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        navToSignUp(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            AppLocale.createAcc.getString(context),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Center(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.resolveWith((states) {
                        return Colors.blue;
                      }),
                      foregroundColor:
                          WidgetStateProperty.resolveWith((states) {
                        return Colors.white;
                      }),
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content:
                                      Text('No user found for that email.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(dialogContext)
                                            .pop(); // Dismiss alert dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (e.code == 'wrong-password') {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Wrong password provided for that user.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(dialogContext)
                                            .pop(); // Dismiss alert dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                        navToHome(context);
                      }
                    },
                    child: Text(AppLocale.login.getString(context)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navToHome(context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        duration: 1.seconds,
        child: HomeScreen(
          localization: widget.localization,
        ),
      ),
    );
  }

  void navToSignUp(context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        duration: 1.seconds,
        child: SignUpPage(
          localization: widget.localization,
        ),
      ),
    );
  }

  void showLanguageBottomSheet(FlutterLocalization localization) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          final deviceWidth = MediaQuery.of(context).size.width;
          final deviceHeight = MediaQuery.of(context).size.height;
          return Container(
            width: deviceWidth,
            height: deviceHeight * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.04),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      localization.translate('en');
                      setState(() {});
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(deviceWidth * 0.03),
                      child: Container(
                        color: Colors.black,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              AppLocale.english.getString(context),
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      localization.translate('ar');
                      setState(() {});
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(deviceWidth * 0.03),
                      child: Container(
                        color: Colors.black,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              AppLocale.arabic.getString(context),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
