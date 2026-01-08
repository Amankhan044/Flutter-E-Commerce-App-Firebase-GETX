
import 'package:e_commerce/features/authentication/view/forget_password/forget_password.dart';
import 'package:e_commerce/features/authentication/view/login/login_view.dart';
import 'package:e_commerce/features/authentication/view/onboarding/onboarding_view.dart';
import 'package:e_commerce/features/authentication/view/signup/signup_view.dart';
import 'package:e_commerce/features/authentication/view/signup/verify_email.dart';
import 'package:e_commerce/features/personalization/view/address/address_view.dart';
import 'package:e_commerce/features/personalization/view/edit_profile/edit_profile_view.dart';
import 'package:e_commerce/features/personalization/view/profile/profile_view.dart';
import 'package:e_commerce/features/shop/view/cart/cart_view.dart';
import 'package:e_commerce/features/shop/view/checkout/checkout_view.dart';
import 'package:e_commerce/features/shop/view/order/order_view.dart';
import 'package:e_commerce/features/shop/view/store/store_view.dart';
import 'package:e_commerce/features/shop/view/wishlist/wishlist_view.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:get/get.dart';



class UAppRoutes{

  static final screens = [
    GetPage(name: URoutes.home, page: () => const NavigationMenu()),
    GetPage(name: URoutes.store, page: () => const StoreView(),),
    GetPage(name: URoutes.wishlist, page: () =>const  WishlistView(),),
    GetPage(name: URoutes.profile, page: () => const ProfileView(),),
    GetPage(name: URoutes.order, page: () => const OrderView(),),
    GetPage(name: URoutes.checkout, page: () => const CheckOutView(),),
    GetPage(name: URoutes.cart, page: () => const CartView(),),
    GetPage(name: URoutes.editProfile, page: () => const EditProfileView(),),
    GetPage(name: URoutes.userAddress, page: () => const AddressView(),),
    GetPage(name: URoutes.signup, page: () => const SignUpView(),),
    GetPage(name: URoutes.verifyEmail, page: () => const VerifyEmailView(),),
    GetPage(name: URoutes.signIn, page: () => const LoginView(),),
    GetPage(name: URoutes.forgetPassword, page: () => const ForgetPasswordView(),),
    GetPage(name: URoutes.onBoarding, page: () => const OnboardingView(),),
  ];
}