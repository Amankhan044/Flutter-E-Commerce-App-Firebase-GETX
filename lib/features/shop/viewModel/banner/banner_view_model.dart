import 'package:e_commerce/data/repository/banner/banner_repository.dart';
import 'package:e_commerce/features/shop/model/banner_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';


class BannerViewModel extends GetxController{
  static BannerViewModel get instance => Get.find();


@override
  void onInit() {
    fetchBanners();
    super.onInit();

  }



  final _repository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isBannerLoading = false.obs;





  Future<void> fetchBanners()async{
    try {
      isBannerLoading.value = true;

    List<BannerModel> activeBanners   = await  _repository.fetchActiveBanners();
    banners.assignAll(activeBanners);
      
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
      
    } finally {
      isBannerLoading.value = false;
    }
  }
}