import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_commerce/data/repository/authentication_repository.dart';
import 'package:e_commerce/features/authentication/model/user_model.dart';
import 'package:e_commerce/utils/constants/apis.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart'
    show UFormatException;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
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

  Future<void> updateSingleRecord(Map<String, dynamic> map) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .update(map);
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

  Future<UserModel> fetchUserRecord() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        UserModel userModel = UserModel.fromSnapshot(documentSnapshot);
        return userModel;
      }

      return UserModel.empty();
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


   Future<void> removeUserRecord( String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
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


  Future<dio.Response> uploadImage(File image)async{
    try {

       String api = UApiUrls.uploadApi(UKeys.cloudName);

      dio.FormData formData =dio.FormData.fromMap({
        'file':await  dio.MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
      'folder':UKeys.profileFolder,
      'upload_preset': UKeys.uploadPreset,});

      dio.Response response=await dio.Dio().post(api, data:formData);

      return response;
      
    } catch (e) {

      throw 'Failed to upload picture! Please try again';
    }
  }

  Future<dio.Response> deleteProfilePicture(String publicId)async{
    try {
      String api = UApiUrls.deleteApi(UKeys.cloudName);

      int timestamp = (DateTime.now().millisecondsSinceEpoch/1000).round();
      String signatureBase = 'public_id=$publicId&timestamp=$timestamp&api_key=${UKeys.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();

       dio.FormData formData =dio.FormData.fromMap({
        'public_id': publicId,
      'api_key':UKeys.apiKey,
      'timestamp':timestamp ,
      'signature' :signature
      });

     dio.Response response=await dio.Dio().post(api, data:formData);

     return response;
      
    } catch (e) {

      throw 'something went wrong!. please try again';
      
    }
  }
}
