

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobX/stores/update_store.dart';




class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateStore store = UpdateStore();


  @override
  void initState() {
    super.initState();

    store.titleTextEditingController.text = widget.title;
    store.bodyTextEditingController.text = widget.body;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Observer(
        builder:(_)=> Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          // Title
                          Container(
                            height: 100,
                            padding: EdgeInsets.all(5),

                            child: Center(
                              child: TextField(maxLines: 2,
                                controller: store.titleTextEditingController,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Title',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),




                          // Body
                          Container(
                            height: 500,
                            padding: EdgeInsets.all(5),

                            child: TextField(
                              controller: store.bodyTextEditingController,
                              style: TextStyle(fontSize: 20),
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
          store.apiPostUpdate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
