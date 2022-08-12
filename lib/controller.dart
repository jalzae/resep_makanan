import 'package:get/get.dart';
import 'package:resep_masakan/model.dart';
import 'package:resep_masakan/service.dart';

class MainControll extends GetxController {
  var isResult = <Meal>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void loaddata() async {
    var todos = await ServiceFood.loadmain();
    Meals data = mealsFromJson(todos);
    isResult.value = data.meals;
    isLoading.value = false;
  }
}
