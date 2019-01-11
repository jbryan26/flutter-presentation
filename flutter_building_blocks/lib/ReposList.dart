import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_building_blocks/Repo.dart';
import 'package:http/http.dart' as http;

class ReposList extends StatelessWidget {
  final String username;

  ReposList({Key key, @required this.username}) : super(key: key);

  Future<List<Repo>> fetchRepos() async {
    print("Started fetch");
    var result = await http.get(
        'https://api.github.com/users/${this.username}/repos',
        headers: {HttpHeaders.acceptHeader: "accept:application/json"});
    List responseJson = json.decode(result.body);
    print("Result body is ${result.body}");
    return responseJson.map((m) => new Repo.fromJson(m)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          "https://avatars0.githubusercontent.com/u/66577?v=4",
                          fit: BoxFit.fitHeight,
                          height: 160.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${this.username}"),
                    ),
                  ],
                ),
                Expanded(
                  child: FutureBuilder<List<Repo>>(
                      future: fetchRepos(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return Text("No data");
                          }
                        }
                        List<Repo> repos = snapshot.data;
                        return ListView(
                          children: repos.map((repo) =>
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                                      ),
                                      padding: EdgeInsets.all(16.0),
                                        child: Text(repo.name)
                                    ),
                                  ),
                                ],
                              ),
                          ).toList(),
                        );
                      }),
                )
              ]
          )),
    );
  }
}
