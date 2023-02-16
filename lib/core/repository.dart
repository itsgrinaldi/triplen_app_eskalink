import 'package:triplen_app/core/entity/user.dart';

abstract class UserRepo {
  Future<UserAuthResponse> doAuth(UserAuthRequest request);
}
