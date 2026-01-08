import 'package:e_commerce/features/shop/model/category_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

import '../../../../data/repository/category/category_repository.dart';

class CategoryViewModel extends GetxController{
  static CategoryViewModel get instance => Get.find();


@override
  void onInit() {
    fetchCategories();
    super.onInit();

  }



  final _repository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxBool isCategoriesLoading = false.obs;





  Future<void> fetchCategories()async{
    try {
      isCategoriesLoading.value = true;

    List<CategoryModel> categories   = await  _repository.getAllCategories();
    allCategories.assignAll(categories);
    featuredCategories.assignAll(categories.where((category)=> category.isFeatured && category.parentId.isEmpty));
      
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
      
    } finally {
      isCategoriesLoading.value = false;
    }
  }
}