import 'package:triplen_app/core/entity/user.dart';
import 'package:triplen_app/core/repository/user/user_repository.dart';
import 'package:triplen_app/core/usecase.dart';

class UserUsecase extends UserUC {
  UserRepository repository = UserRepository();

  @override
  Future<bool> doAuth(String email) async {
    UserAuthRequest request =
        UserAuthRequest(email: email, idGoogle: "12838213", name: "SAMPLE");
    UserAuthResponse result = await repository.doAuth(request);
    if (result.success != null && result.success == true) {
      return true;
    }

    return false;
  }
}
