import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprints_firebase_tasks/locales.dart';
import 'package:validators/validators.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.localization});

  final FlutterLocalization localization;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  bool obsecurePass = true;
  bool obsecureConfirmPass = true;

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
          AppLocale.signUp.getString(context),
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
                  AppLocale.name.getString(context),
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
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
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocale.entername.getString(context);
                    }
                    if (!isAlpha(value) || !isUppercase(value[0])) {
                      if (!isAlpha(value)) {
                        return AppLocale.namemust2.getString(context);
                      } else if (!isUppercase(value[0])) {
                        return AppLocale.namemust1.getString(context);
                      }
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
                Text(
                  AppLocale.conPassword.getString(context),
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  obscureText: obsecureConfirmPass,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecureConfirmPass = !obsecureConfirmPass;
                          });
                        },
                        icon: Icon(obsecureConfirmPass
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
                  controller: confirmController,
                  validator: (value) {
                    if (passwordController.text != value) {
                      return AppLocale.noMatch.getString(context);
                    }
                    return null;
                  },
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
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'The password provided is too weak.'),
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
                          } else if (e.code == 'email-already-in-use') {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'The account already exists for that email.'),
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
                        } catch (e) {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                  e.toString(),
                                ),
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
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  AppLocale.acc.getString(context),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      AppLocale.cont.getString(context),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      navToLogin(context);
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Text(AppLocale.signUp.getString(context)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navToLogin(context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        duration: 1.seconds,
        child: LoginPage(
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
