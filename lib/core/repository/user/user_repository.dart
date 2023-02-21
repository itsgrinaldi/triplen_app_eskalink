import 'package:dio/dio.dart';
import 'package:triplen_app/core/entity/user.dart';
import 'package:triplen_app/core/repository.dart';
import 'package:triplen_app/util/http_client.dart';

class UserRepository extends UserRepo {
  UserRepository({required this.client});

  HttpClient client;

  @override
  Future<UserAuthResponse> doAuth(UserAuthRequest request) async {
    Response response =
        await client.dio.post("/user/auth", data: request.toJson());
    if (response.statusCode == 200) {
      final data = UserAuthResponse.fromJson(response.data);
      client.setBearerFromLogin(data.data!.token!);

      return data;
    }

    return UserAuthResponse();
  }
}
