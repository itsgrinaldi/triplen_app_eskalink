import 'package:dio/dio.dart';
import 'package:triplen_app/core/entity/user.dart';
import 'package:triplen_app/core/repository.dart';
import 'package:triplen_app/util/http_client.dart';

class UserRepository extends UserRepo {
  HttpClient client = HttpClient();

  @override
  Future<UserAuthResponse> doAuth(UserAuthRequest request) async {
    Response response =
        await client.dio.post("/user/auth", data: request.toJson());
    if (response.statusCode == 200) {
      return UserAuthResponse.fromJson(response.data);
    }

    return UserAuthResponse();
  }
}
