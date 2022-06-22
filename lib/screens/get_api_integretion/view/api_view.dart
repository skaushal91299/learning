import 'package:flutter/material.dart';

import '../Model/model_class.dart';
import '../services/api_services.dart';

class APIIntegration extends StatefulWidget {
  const APIIntegration({Key? key}) : super(key: key);

  @override
  _APIIntegrationState createState() => _APIIntegrationState();
}

class _APIIntegrationState extends State<APIIntegration> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
