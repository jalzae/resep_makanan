import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_masakan/controller.dart';
import 'package:url_launcher/url_launcher.dart';

MainControll controller = Get.find();

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left)),
            title: ListTile(
              title: Text(controller.isSelected.value.strMeal),
              subtitle: Text(
                  '${controller.isSelected.value.strCategory}-${controller.isSelected.value.strArea}'),
            ),
          ),
          body: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Image.network(
                    controller.isSelected.value.strMealThumb,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                      bottom: 10,
                      left: 30,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          onPressed: () => {
                                launcherUrl(Uri.parse(
                                    controller.isSelected.value.strYoutube))
                              },
                          child: Row(
                            children: const [
                              Icon(Icons.play_arrow),
                              Text(' Youtube'),
                            ],
                          ))),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textHeading("Ingredients :"),
                    textRow(controller.isSelected.value.strIngredient1,
                        controller.isSelected.value.strMeasure1),
                    textRow(controller.isSelected.value.strIngredient2,
                        controller.isSelected.value.strMeasure2),
                    textRow(controller.isSelected.value.strIngredient3,
                        controller.isSelected.value.strMeasure3),
                    textRow(controller.isSelected.value.strIngredient4,
                        controller.isSelected.value.strMeasure4),
                    textRow(controller.isSelected.value.strIngredient5,
                        controller.isSelected.value.strMeasure5),
                    textHeading("Instructions :"),
                    Container(
                        margin: const EdgeInsets.all(12),
                        child: textPara(
                            controller.isSelected.value.strInstructions))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget textHeading(String string) {
    return Container(
      margin: const EdgeInsets.only(left: 2, top: 2, bottom: 2),
      child: Text(
        string,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  Widget textRow(String column, String value) {
    return ListTile(
      title: Text(column),
      trailing: Text(value),
    );
  }

  Widget textPara(String string) {
    return Text(string);
  }

  Future<void> launcherUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Get.snackbar("Message", 'Could not launch $url');
    }
  }
}
