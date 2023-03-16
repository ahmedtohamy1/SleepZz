// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _urlWhy = Uri.parse('https://en.wikipedia.org/wiki/Sleep_cycle');
final Uri _urlSite = Uri.parse('https://ahmedtohamy.tech/#about');
final Uri _urlDonate = Uri.parse('https://ahmedtohamy.tech/#donate');
final Uri _urlDownload =
    Uri.parse('https://github.com/ahmedtohamy1/SleepZz/releases');

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

void main() {
  runApp(MaterialApp(
    home: Sleepzz(),
    theme: ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.lime,
      brightness: Brightness.dark,
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class Sleepzz extends StatefulWidget {
  const Sleepzz({super.key});

  @override
  State<Sleepzz> createState() => _SleepzzState();
}

class _SleepzzState extends State<Sleepzz> {
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        timePicked = value!;
      });
    });
  }

  var dt = DateTime.now();
  TimeOfDay timePicked = TimeOfDay.now();

  String timeNow = DateFormat.jm()
      .format(DateTime.now().add(Duration(hours: 1, minutes: 30)));
  String firstCycle = 'A sleep cycle of 1:30h';
  String secondCycle = 'A sleep cycle of 3h';
  String thirdCycle = 'A sleep cycle of 4:30h';
  String fourthCycle = 'A sleep cycle of 6h';
  String fifthCycle = 'A sleep cycle of 7:30h';
  String sixthCycle = 'A sleep cycle of 9h';

  Future<void> _launchUrlWhy() async {
    if (!await launchUrl(
      _urlWhy,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_urlWhy');
    }
  }

  Future<void> _launchUrlDownload() async {
    LaunchMode.externalApplication;
    if (!await launchUrl(
      _urlDownload,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_urlDownload');
    }
  }

  Future<void> _launchUrlSite() async {
    LaunchMode.externalApplication;
    if (!await launchUrl(
      _urlSite,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_urlSite');
    }
  }

  Future<void> _launchUrlDonate() async {
    if (!await launchUrl(
      _urlDonate,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_urlDonate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(22, 255, 255, 255),
      ),
      drawer: Drawer(
        semanticLabel: 'SleepZz',
        child: Column(
          children: [
            Spacer(
              flex: 7,
            ),
            Text(
              "SleepZz",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(
              flex: 6,
            ),
            GestureDetector(
              onTap: () {
                _launchUrlWhy();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.bed),
                  title: Text(
                    "Why use our algorithm of sleep?",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                _launchUrlDownload();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.share),
                  title: Text(
                    "Share the app, Spread the health",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                _launchUrlSite();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.idBadge),
                  title: Text(
                    "Contact the developer",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                _launchUrlDonate();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.handHoldingDollar),
                  title: Text(
                    "Donate & Encourage for More",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 60,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            child: Column(
              children: [
                Container(
                  height: 180,
                  color: Color.fromARGB(22, 255, 255, 255),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, right: 15, left: 15),
                    child: Text("Sleep Better, Live Healthier.",
                        style: GoogleFonts.inter(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.black12,
                child: Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.black38,
                      onPressed: () async {
                        TimeOfDay? timePicked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (timePicked == null) {
                          Fluttertoast.showToast(
                              msg: "Idiot, you should pick a Zz time",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 14.0);
                        } else {
                          setState(() {
                            firstCycle = DateFormat.jm().format(dt
                                .applied(timePicked!)
                                .add(Duration(hours: 1, minutes: 30)));
                            secondCycle = DateFormat.jm().format(dt
                                .applied(timePicked!)
                                .add(Duration(hours: 3)));
                            thirdCycle = DateFormat.jm().format(dt
                                .applied(timePicked!)
                                .add(Duration(hours: 4, minutes: 30)));
                            fourthCycle = DateFormat.jm().format(dt
                                .applied(timePicked!)
                                .add(Duration(hours: 6)));
                            fifthCycle = DateFormat.jm().format(dt
                                .applied(timePicked!)
                                .add(Duration(hours: 7, minutes: 30)));
                            sixthCycle = DateFormat.jm().format(dt
                                .applied(timePicked!)
                                .add(Duration(hours: 9)));
                          });
                        }
                      },
                      child: Text(
                        'Pick Your Zz Time',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.black38,
                      onPressed: () {
                        setState(() {
                          firstCycle = DateFormat.jm().format(DateTime.now()
                              .add(Duration(hours: 1, minutes: 30)));
                          secondCycle = DateFormat.jm()
                              .format(DateTime.now().add(Duration(hours: 3)));
                          thirdCycle = DateFormat.jm().format(DateTime.now()
                              .add(Duration(hours: 4, minutes: 30)));
                          fourthCycle = DateFormat.jm()
                              .format(DateTime.now().add(Duration(hours: 6)));
                          fifthCycle = DateFormat.jm().format(DateTime.now()
                              .add(Duration(hours: 7, minutes: 30)));
                          sixthCycle = DateFormat.jm()
                              .format(DateTime.now().add(Duration(hours: 9)));
                        });
                      },
                      child: Text(
                        'Simply Sleep Now',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.black38),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 2,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AnimatedTextKit(
                                totalRepeatCount: 2,
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                                animatedTexts: [
                                  TyperAnimatedText(
                                    "Here's The Best Hours to Wake up at:",
                                    textStyle: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.one,
                                size: 20,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "$firstCycle",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.two,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "$secondCycle",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.three,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "$thirdCycle",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 18),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.four,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "$fourthCycle",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.five,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "$fifthCycle",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.six,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "$sixthCycle",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
