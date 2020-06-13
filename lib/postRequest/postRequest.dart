import 'package:flutterhttpgetandpost/postRequest/post_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PostRequest extends StatefulWidget {
  @override
  _PostRequestState createState() => _PostRequestState();
}

class _PostRequestState extends State<PostRequest> {
  Future<Post> post;
  static final Base_URL = 'https://jsonplaceholder.typicode.com/posts';
  TextEditingController titleControler = new TextEditingController();
  TextEditingController bodyControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Create Post"),
        ),
        body: new Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: titleControler,
                decoration: InputDecoration(
                    hintText: "title....", labelText: 'Post Title'),
              ),
              new TextFormField(
                controller: bodyControler,
                decoration: InputDecoration(
                    hintText: "body....", labelText: 'Add Descrioption'),
              ),
              new RaisedButton(
                  child: Text("Post Data"),
                  onPressed: () async {

                    Post postData = new Post(
                        "123", 0, titleControler.text, bodyControler.text);
                    Post p = await postData.createPost(Base_URL,
                        body: postData.tomap());

                    titleControler.text="";
                    bodyControler.text="";
                   })
            ],
          ),
        ),
      );
  }
}
