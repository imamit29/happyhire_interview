import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happyhire_interview/screens/homescreen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {

  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          debugPrint("didPop1: $didPop");
          if (didPop) {
            return;
          }
          final bool shouldPop = await _onWillPop();
          if (shouldPop) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('LOGO', style: TextStyle(color: Colors.indigo),),
            //backgroundColor: Colors.white,
            elevation: 5,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
      body: SafeArea(child: Container(
        height: double.infinity,
        width: double.infinity,
        child:  _pages[_selectedIndex],
      )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.blue),
              label: '홈',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps_outlined, color: Colors.grey),
                activeIcon: Icon(Icons.apps_outlined, color: Colors.blue),
                label: '카테고리'), // Dummy for FAB
            BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Colors.grey),
              activeIcon: Icon(Icons.group, color: Colors.blue),
              label: '커뮤니티',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey),
              activeIcon: Icon(Icons.person, color: Colors.blue),
              label: '마이페이지',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            _onItemTapped(index);
          },
          selectedItemColor: Colors.blue,

        ),
        ));
  }

  _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit this App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
}