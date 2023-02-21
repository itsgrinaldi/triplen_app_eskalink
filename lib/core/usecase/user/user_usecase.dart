import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/core/entity/user.dart';
import 'package:triplen_app/core/repository.dart';
import 'package:triplen_app/core/usecase.dart';

class UserUsecase extends UserUC {
  UserUsecase({required this.repository, required this.sharedPreferences});

  UserRepo repository;
  SharedPreferences sharedPreferences;

  @override
  Future<bool> doAuth(String email) async {
    UserAuthRequest request =
        UserAuthRequest(email: email, idGoogle: "12838213", name: "SAMPLE");
    UserAuthResponse result = await repository.doAuth(request);
    if (result.success != null && result.success == true) {
      sharedPreferences.setString("isLogin", "1");
      sharedPreferences.setString("token", result.data!.token!);
      return true;
    }

    return false;
  }
}
