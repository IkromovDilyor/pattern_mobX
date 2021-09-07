

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobX/stores/create_store.dart';


class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateStore store = CreateStore();



  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Observer(
        builder: (_)=>Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Title
                  Container(
                    height: 50,

                    child: Center(
                      child: TextField(
                        controller: store.titleTextEditingController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // Body
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: store.bodyTextEditingController,
                      style: TextStyle(fontSize: 18),
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Body',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            store.isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          store.apiPostCreate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
