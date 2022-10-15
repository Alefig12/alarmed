// ignore_for_file: prefer_const_constructors
import 'package:alarmed/custom_icons_icons.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/pages/location_page.dart';
import 'package:alarmed/ui/pages/calendar_page.dart';
import 'package:alarmed/ui/pages/scheduling_page.dart';
import 'package:alarmed/ui/pages/alarms_page.dart';
import 'package:alarmed/ui/pages/help_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    HelpPage(),
    LocationPage(),
    AlarmPage(),
    SchedulingPage(),
    CalendarPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions,
      )

          // _widgetOptions.elementAt(_selectedIndex),
          ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Constant.mainCont,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: MainRoundedBox(
                  radius: 30,
                  width: 60,
                  height: 60,
                  color: Constant.inCont,
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.question,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                backgroundColor: Constant.mainCont,
                label: 'Ayuda',
              ),
              BottomNavigationBarItem(
                icon: MainRoundedBox(
                  radius: 30,
                  width: 60,
                  height: 60,
                  color: Constant.inCont,
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                backgroundColor: Constant.mainCont,
                label: 'Farmacias',
              ),
              BottomNavigationBarItem(
                icon: MainRoundedBox(
                  radius: 30,
                  width: 60,
                  height: 60,
                  color: Constant.inCont,
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.clock,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                backgroundColor: Constant.mainCont,
                label: 'Programación',
              ),
              BottomNavigationBarItem(
                icon: MainRoundedBox(
                  radius: 30,
                  width: 60,
                  height: 60,
                  color: Constant.inCont,
                  child: Center(
                    child: Transform.rotate(
                      angle: -math.pi / 1.65,
                      child: Icon(
                        CustomIcons.pill,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                backgroundColor: Constant.mainCont,
                label: 'Alarmas',
              ),
              BottomNavigationBarItem(
                icon: MainRoundedBox(
                  radius: 30,
                  width: 60,
                  height: 60,
                  color: Constant.inCont,
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.calendar,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                backgroundColor: Constant.mainCont,
                label: 'Calendario',
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Constant.inCont,
            selectedItemColor: Constant.secondCont,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
