import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_masakan/controller.dart';
import 'package:url_launcher/url_launcher.dart';

MainControll controller = Get.find();
var arr = controller.isSelected.value;

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
              title: Text(arr.strMeal),
              subtitle: Text('${arr.strCategory}-${arr.strArea}'),
            ),
          ),
          body: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Image.network(
                    arr.strMealThumb,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                      bottom: 10,
                      left: 30,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          onPressed: () =>
                              {launcherUrl(Uri.parse(arr.strYoutube))},
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
                    textRow(arr.strIngredient1, arr.strMeasure1),
                    textRow(arr.strIngredient2, arr.strMeasure2),
                    textRow(arr.strIngredient3, arr.strMeasure3),
                    textRow(arr.strIngredient4, arr.strMeasure4),
                    textRow(arr.strIngredient5, arr.strMeasure5),
                    textHeading("Instructions :"),
                    Container(
                        margin: const EdgeInsets.all(12),
                        child: textPara(arr.strInstructions))
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
