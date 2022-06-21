import 'package:flutter/material.dart';

import 'first.dart';
import 'fourth.dart';
import 'second.dart';
import 'third.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> screens = const [
    FirstScrren(
      key: PageStorageKey('First Screen'),
    ),
    SecondScrren(
      key: PageStorageKey('Second Screen'),
    ),
    ThirdScrren(
      key: PageStorageKey('Third Screen'),
    ),
    FourthScrren(
      key: PageStorageKey('Fourth Screen'),
    ),
  ];

  int _currentTab = 0;

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  void _onSelectedIndex(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Bottom Navigaton Bar UI'),
            centerTitle: true,
          ),
          body: Center(
            child: PageStorage(
              bucket: bucket,
              child: screens[_currentTab],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentTab,
            onTap: _onSelectedIndex,
            unselectedItemColor: Colors.purple[600],
            showUnselectedLabels: true,
            selectedItemColor: Colors.red,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                label: 'Edit',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.phone),
                label: 'Phone',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dangerous),
                label: 'Alert',
              ),
            ],
          )),
    );
  }
}
