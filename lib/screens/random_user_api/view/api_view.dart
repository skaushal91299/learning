import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/Model/random_user/random_user.dart';

class ApiProfileView extends StatefulWidget {
  const ApiProfileView({Key? key}) : super(key: key);

  @override
  State<ApiProfileView> createState() => _ApiProfileViewState();
}

class _ApiProfileViewState extends State<ApiProfileView> {
  Future<RandomUser?> fetchData() async {
    var response = await http.get(Uri.parse('https://randomuser.me/api/'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(data);
      return RandomUser.fromMap(data);
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
                      itemCount: snapshot.data!.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.all(50),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot
                                          .data!.results[index].picture.large,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                  text: 'E-Mail :- ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: snapshot.data!.results[index].email,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ])),
                              const SizedBox(height: 20),
                              RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(children: [
                                    const TextSpan(
                                      text: 'Gender :- ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          snapshot.data!.results[index].gender,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ])),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: SizedBox(
                        child: Text('Error Loading'),
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
