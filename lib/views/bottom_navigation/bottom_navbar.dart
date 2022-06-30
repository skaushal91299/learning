import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final List<Widget> screens = const [
    FirstScrren(),
    SecondScrren(),
    ThirdScrren(),
    FourthScrren(),
  ];

  int _currentTab = 0;
  final ListQueue<int> _navigationQueue = ListQueue();

  // EXIT POPUP
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
                onPressed: () => Get.back(canPop: false),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Get.back(canPop: true),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigationQueue.isEmpty) {
          // If NavigationQueue is Empty show EXIT popup
          return showExitPopup();
        }
        setState(() {
          _navigationQueue.removeLast();
          int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
          _currentTab = position;
        });
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Bottom Navigaton Bar UI'),
            centerTitle: true,
          ),
          body: Center(
            child: screens[_currentTab],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentTab,
            onTap: (index) {
              // Remove Repeated Element from the Queue
              if (index != _currentTab) {
                _navigationQueue.removeWhere((element) => element == index);
                _navigationQueue.addLast(index);
                setState(() {
                  _currentTab = index;
                });
              }
            },
            unselectedItemColor: Colors.purple[600],
            showUnselectedLabels: true,
            selectedItemColor: Colors.red,
            elevation: 6.0,
            enableFeedback: true,
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
