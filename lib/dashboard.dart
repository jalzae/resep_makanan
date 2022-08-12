import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_masakan/controller.dart';
import 'package:resep_masakan/detail.dart';

MainControll controller = Get.put(MainControll());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loaddata();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Resep Masakan')),
        actions: [
          IconButton(
              onPressed: () {
                controller.loaddata();
              },
              icon: const Icon(Icons.replay_outlined))
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                'https://cdn0-production-images-kly.akamaized.net/kutsJcqqYV0-9pDI3l6YEl2v7xQ=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1367799/original/048059200_1475843806-Masakan_Indonesia.jpg',
                fit: BoxFit.fitHeight,
              ),
              const Positioned(
                bottom: 10,
                left: 30,
                child: Text(
                  "Resep Makanan",
                  style: TextStyle(
                    color: Color.fromARGB(255, 207, 18, 18),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 26.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.isResult.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(const DetailPage(),
                              arguments: {"first": controller.isResult[index]});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(3.0)),
                          child: ListTile(
                            title: Text(controller.isResult[index].strMeal),
                            trailing: const Icon(Icons.chevron_right),
                          ),
                        ),
                      );
                    });
              }
            }),
          )
        ],
      ),
    );
  }
}
