import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetRequest extends StatefulWidget {
  @override
  _GetRequestState createState() => _GetRequestState();
}

class _GetRequestState extends State<GetRequest> {
  List list = new List();
  bool isLoading = false;
  static final Base_URL = 'https://jsonplaceholder.typicode.com/photos';

  @override
  void initState() {
    super.initState();
    // _fetchData(); //uncomment if you want to fetch data when screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Json Data"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: new Text("Get Data"),
          onPressed: () => _fetchData(),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int position) {
                return ListTile(
                  leading:new Image.network(
                    list[position]['thumbnailUrl'],
                    fit: BoxFit.cover,
                    height: 50.0,
                    width: 50.0,
                  ) ,
                    title: new Text(list[position]['title']),
                    );
              }),
    );
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == 200) {
      list = json.decode(response.body) as List;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
