import 'package:triplen_app/core/entity/board.dart';

abstract class UserUC {
  Future<bool> doAuth(String email);
}

abstract class BoardUC {
  Future<List<Board>> get();
  Future<Board> detail(int id);
}