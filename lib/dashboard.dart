import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_masakan/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Resep Masakan')),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://cdn0-production-images-kly.akamaized.net/kutsJcqqYV0-9pDI3l6YEl2v7xQ=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1367799/original/048059200_1475843806-Masakan_Indonesia.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const DetailPage());
                  },
                  child: const ListTile(
                    title: Text("Nama Resep"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
