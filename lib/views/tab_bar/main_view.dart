// ignore_for_file: avoid_print, must_call_super

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TABBarView extends StatefulWidget {
  const TABBarView({Key? key}) : super(key: key);

  @override
  State<TABBarView> createState() => _TABBarViewState();
}

class _TABBarViewState extends State<TABBarView>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<TABBarView> {
  final List<Tab> tabs = const <Tab>[
    Tab(
      icon: Icon(Icons.home),
    ),
    Tab(
      icon: Icon(Icons.home),
    ),
    Tab(
      icon: Icon(Icons.home),
    ),
  ].toList();

  // final ListQueue<int> _navigationQueue = ListQueue();
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    _tabController.addListener(() {
      // setState(() {
      //   _tabController.index = _cuurentTab;
      // });
      print(_tabController.index);
    });
    super.initState();
  }

  @override
  // ignore: todo
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Future<bool> _onWillPop() async {
    print("on will pop");
    if (_tabController.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      print("set index");
      _tabController.index = 0;
    });

    print("return");
    return _tabController.index == 0;
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: const [
        Icon(
          Icons.home,
          color: Colors.white,
          size: 300,
        ),
        Icon(
          Icons.car_crash,
          color: Colors.white,
          size: 300,
        ),
        Icon(
          Icons.flight,
          color: Colors.white,
          size: 300,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('TAB BAR'),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
          ),
        ),
        body: _tabBarView(),
      ),
    );
  }
}
