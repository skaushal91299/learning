import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/enteries/enteries.dart';
import '/views/test_api/Model/enteries/enteries.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  Future<Enteries?> fetchData() async {
    var response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return Enteries.fromMap(data);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 9,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(snapshot.data!.entries[index].category),
                                Text(snapshot.data!.entries[index].description),
                                Text(snapshot.data!.entries[index].api),
                                Text(snapshot.data!.entries[index].link),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
