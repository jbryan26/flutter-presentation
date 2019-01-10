import 'package:flutter/material.dart';

class ReposList extends StatefulWidget {
  @override
  _ReposListState createState() => _ReposListState();
}

class _ReposListState extends State<ReposList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Repo Lists'),
        ),
        body: Center(
          child: Text("This is the repos list page"),
          ),
        ),
      );
  }
}
