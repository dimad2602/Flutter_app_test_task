import 'package:test_task/models/user_model/user_model.dart';

abstract class ISignInRepository {
  Future<User?> signInWithTelephone({
    required String telephone,
  });
}
