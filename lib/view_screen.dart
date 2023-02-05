import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'url_controller.dart';
import 'url_model.dart';

class ViewScreen extends StatefulWidget {
  @override
  State<ViewScreen> createState() => _ViewScreen();
}

class _ViewScreen extends State<ViewScreen> {
  late Future <Model> futureAlbum;
  final controller = Get.put(Controller());
  final myController = TextEditingController();

  var activity;
  var type="";
  var participants;
  var price;
  var link;
  var key;
  var accessibility;

  @override
  void initState() {
    super.initState();
    futureAlbum = controller.getData("usama");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Model>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error.toString()}"),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data;

            return Container(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text("activity : "),
                          Text(activity.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("type : "),
                          Text(type),
                        ],
                      ),
                      Row(
                        children: [
                          Text("participants : "),
                          Text(participants.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("price : "),
                          Text(price.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("link : "),
                          Text(link.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("key : "),
                          Text(key.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("accessibility : "),
                          Text(accessibility.toString()),
                        ],
                      ),
                     
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter Name',
                            hintText: 'Enter Your Name'),
                        controller: myController,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              futureAlbum =
                                  controller.getData(myController.text);
                              setState(() {
                                activity = data!.activity!;
                                type = data.type!;
                                participants = data.participants;
                                price = data.price;
                                link = data.link;
                                key = data.key;
                                accessibility = data.accessibility;
                                
                              });
                            },
                            child: Icon(
                              Icons.person_add_sharp,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}