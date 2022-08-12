import 'package:get/get.dart';
import 'package:resep_masakan/model.dart';
import 'package:resep_masakan/service.dart';

class MainControll extends GetxController {
  var isResult = <Meal>[].obs;
  var isLoading = true.obs;
  var isSelected = Meal(
          idMeal: "",
          strMeal: "",
          strCategory: "",
          strArea: "",
          strInstructions: "",
          strMealThumb: "",
          strYoutube: "",
          strIngredient1: "",
          strIngredient2: "",
          strIngredient3: "",
          strIngredient4: "",
          strIngredient5: "",
          strMeasure1: "",
          strMeasure2: "",
          strMeasure3: "",
          strMeasure4: "",
          strMeasure5: "")
      .obs;

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

  void select(Meal value) {
    isSelected.value = value;
  }
}
