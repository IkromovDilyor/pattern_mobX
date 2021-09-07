import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pattern_mobX/stores/home_store.dart';
import 'package:pattern_mobX/views/item_of_post.dart';

class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {



@override
void initState() {
  super.initState();
  store.apiPostList();
}
HomeStore store = HomeStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body:
              Stack(
                  children: [
                    ListView.builder(
                      itemCount: store.items.length,
                      itemBuilder: (ctx, index){
                        return itemOfPost(store,store.items[index]);
                      },

                    ),
                    store.isLoading  ?
                    Center(
                      child: CircularProgressIndicator(),
                    ):SizedBox.shrink(),
                  ],
                ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          //Navigator.pushNamed(context, CreatePage.id);

        },
        child: Icon(Icons.add),
      ),

    );
  }


}
