import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{

  static HomeViewModel get instance => Get.find();

  final carouselController  = CarouselSliderController();

  RxInt currentIndex = 0.obs;

void onPaggedChanged(int index) => currentIndex.value = index;

}