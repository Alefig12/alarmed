import 'package:alarmed/ui/assets/constant.dart';
import 'package:alarmed/ui/pages/Registration_page.dart';
import 'package:alarmed/ui/pages/calendar_page.dart';
import 'package:alarmed/ui/pages/scheduling_page.dart';
import 'package:alarmed/ui/pages/alarms_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
// ignore: prefer_const_constructors

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarmed',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: NavigationPage(),
    );
  }
}

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
    AlarmPage(),
    CalendarPage(),
    SchedulingPage(),
    RegistrationPage(),
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
    // _pageController = PageController();

    //THIS SHIT IS FOR THE LOGIN PAGE
    // Future.delayed(Duration.zero, () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => LoginPage()),
    //   );
    // });
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Constant.mainCont,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            backgroundColor: Constant.mainCont,
            label: 'Alarmas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Programación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Constant.inCont,
        selectedItemColor: Constant.secondCont,
        onTap: _onItemTapped,
      ),
    );
  }
}
