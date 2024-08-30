import 'package:test_task/data/repositories/sign_in_repo/i_sign_in_repo.dart';
import 'package:test_task/data/storage/user_storage.dart';
import 'package:test_task/models/user_model/user_model.dart';

class SignInRepo implements ISignInRepository {
  final SecureStorage storage = SecureStorage();

  // Любой номер
  //final RegExp _phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$');

  // Только русский формат номера
  //final RegExp _phoneRegExp = RegExp(r'^(?:\+7|8)?\d{10}$');

  // Только русский формат номера + номера из 3 цифр
  final RegExp _phoneRegExp = RegExp(r'^(?:\+7|8)\d{10}$|^\d{3}$');

  @override
  Future<User?> signInWithTelephone({required String telephone}) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_isValidPhoneNumber(telephone)) {
      final user = User(telephone: telephone);
      storage.saveUserTel(user.telephone);
      return user;
    } else {
      return null;
    }
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    if (phoneNumber == '911') {
      return false;
    }

    return _phoneRegExp.hasMatch(phoneNumber);
  }
}
