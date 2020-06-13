import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class Post {
  String userId;
  String title;
  int id;
  String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
    );
  }

  Map tomap() {
    var map = new Map<String, dynamic>();
    map['userId'] = userId;
    map["title"] = title;
    map["body"] = body;
    return map;
  }

  Future<Post> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      } else {
        debugPrint("success");
        print(response.body.toString());
        return Post.fromJson(json.decode(response.body));
      }
    });
  }
}
