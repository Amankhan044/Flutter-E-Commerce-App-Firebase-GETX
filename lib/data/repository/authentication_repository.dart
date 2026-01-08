import 'package:e_commerce/data/repository/banner/banner_repository.dart';
import 'package:e_commerce/data/repository/category/category_repository.dart';
import 'package:e_commerce/data/repository/user/user_repository.dart';
import 'package:e_commerce/features/authentication/view/onboarding/onboarding_view.dart';
import 'package:e_commerce/features/personalization/view_model/user/user_viewmodel.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/dummy_data.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/authentication/view/login/login_view.dart';
import '../../features/authentication/view/signup/verify_email.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';

class AuthenticationRepository  extends GetxController{


    static AuthenticationRepository get instance => Get.find();

    final localStorage= GetStorage();
    final _auth = FirebaseAuth.instance;

    User? get currentUser => _auth.currentUser;

    @override
  void onReady() {

    FlutterNativeSplash.remove();
    screenRedirect();

  }

  void screenRedirect(){


    final user = _auth.currentUser;
    if (user!= null) {
      if (user.emailVerified) {

        Get.offAll(()=> NavigationMenu());
        
      } else {
        Get.offAll(()=> VerifyEmailView(email: user.email,));
        
      }
      
    } else {
      localStorage.writeIfNull('isFirstTime', true);
    localStorage.read( 'isFirstTime') == true ? Get.to(()=> OnboardingView()) : Get.to(()=> LoginView());
 
    }


     }


  Future<UserCredential> registerUser(String email, String password)async{

    try {

     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     return userCredential;
      
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    }on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    }
    
     catch(e){
      throw 'Something went wrong, Please try again';
    }

  }
  Future<UserCredential> loginWithEmailAndPassword(String email, String password)async{

    try {

     UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
     return userCredential;
      
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    }on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    }
    
     catch(e){
      throw 'Something went wrong, Please try again';
    }

  }


  Future<void> sendEmailVerification()async{
    try {

    await  _auth.currentUser?.sendEmailVerification();
      
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    }on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    }
    
     catch(e){
      throw 'Something went wrong, Please try again';
    }

  }


 Future<void> forgetPasswordResetEmail(String email)async{
    try {

    await  _auth.sendPasswordResetEmail(email: email);
      
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    }on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    }
    
     catch(e){
      throw 'Something went wrong, Please try again';
    }

  }


  Future<void> logout()async{
     try {

    await  FirebaseAuth.instance.signOut();
    Get.to(() => LoginView());

      
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    }on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    }
    
     catch(e){
      throw 'Something went wrong, Please try again';
    }
  }


  Future<UserCredential> signInWithGoogle() async {
  try {
  

    // Trigger Google Sign-In
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // User cancelled login
    if (googleUser == null) {
      throw 'Google sign-in cancelled by user';
    }

    // Get auth details
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Make Firebase credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Login into Firebase
    final userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential;
  } on FirebaseAuthException catch (e) {
    throw UFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw UFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw UFormatException();
  } on PlatformException catch (e) {
    throw UPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong, Please try again';
  }
}

 Future<void> deleteAccount()async{
     try {

      await UserRepository.instance.removeUserRecord(currentUser!.uid);
      if (UserViewmodel.instance.user.value.publicId.isNotEmpty) {
        UserRepository.instance.deleteProfilePicture(UserViewmodel.instance.user.value.publicId);
        
      }
      await currentUser?.delete();

      
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    }on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    }
    
     catch(e){
      throw 'Something went wrong, Please try again';
    }
  }


  Future<void> reAutheticateWithEmailAndPassword(String email, String password)async{

    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await currentUser?.reauthenticateWithCredential(credential);

    
      
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    }on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    }
    
     catch(e){
      throw 'Something went wrong, Please try again';
    }

  }




}