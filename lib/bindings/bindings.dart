
import 'package:e_commerce/features/shop/viewModel/banner/banner_view_model.dart';
import 'package:get/get.dart';
import '../utils/helpers/network_manager.dart';

class UBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());


  }

}