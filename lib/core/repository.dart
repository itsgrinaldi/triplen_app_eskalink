import 'package:triplen_app/core/entity/board.dart';
import 'package:triplen_app/core/entity/user.dart';

abstract class UserRepo {
  Future<UserAuthResponse> doAuth(UserAuthRequest request);
}

abstract class BoardRepo {
  Future<BoardResponse> get(String token);
  Future<BoardDetailResponse> detail(int id, String token);
}
