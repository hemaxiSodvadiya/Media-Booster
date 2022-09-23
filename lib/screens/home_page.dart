import 'package:flutter/material.dart';

import 'detail_page/d2.dart';
import 'list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("___Audio___"),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          var Page = audio[i];
          return Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageD(Page)));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text("${Page.name}"),
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage("${Page.image}"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: audio.length,
      ),
    );
  }
}
