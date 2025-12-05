import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/repository/user/user_repository.dart';
import '../../../authentication/model/user_model.dart';

class UserViewmodel extends GetxController{
  static UserViewmodel get instance => Get.find();
  final _userRepository = Get.put(UserRepository()) ;

  Future<void> saveUserRecord(UserCredential userCredential)async{
    try {
      final namePart= UserModel.nameParts( userCredential.user!.displayName);
      final username= '${userCredential.user!.displayName}1234';
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: namePart[0],
        lastName: namePart.length>1 ? namePart.sublist(1).join(' '): '',
        username: username,
        email: userCredential.user!.email?? '',
        phoneNumber: userCredential.user!.phoneNumber?? '',
        profilePicture: userCredential.user!.photoURL?? '',
      );
      await _userRepository.saveUserRecord(userModel);
       
    } catch (e) {
      USnackBarHelpers.warningSnackBar(title: 'Data Not Saved', message: 'Something wentwrong while saving the data');
    }
  }
}