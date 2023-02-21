import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/core/entity/board.dart';
import 'package:triplen_app/core/repository.dart';
import 'package:triplen_app/core/usecase.dart';

class BoardUsecase extends BoardUC {
  BoardRepo boardRepository;
  SharedPreferences sharedPreferences;
  String? _token = "";

  BoardUsecase({required this.boardRepository, required this.sharedPreferences});

  @override
  Future<Board> detail(int id) async {
    _token = sharedPreferences.getString("token");
    BoardDetailResponse boardDetailResponse = await boardRepository.detail(id, _token!);
    if (boardDetailResponse.success!) {
      return boardDetailResponse.data!;
    }

    return Board();
  }

  @override
  Future<List<Board>> get() async {
    _token = sharedPreferences.getString("token");
    BoardResponse boardResponse = await boardRepository.get(_token!);
    if (boardResponse.success!) {
      return boardResponse.data!;
    }

    return [];
  }

}