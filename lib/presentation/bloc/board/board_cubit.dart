import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:triplen_app/core/entity/board.dart';
import 'package:triplen_app/core/usecase.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardUC boardUsecase;
  List<Board> boards = [];

  BoardCubit({required this.boardUsecase}) : super(BoardInitial());

  void loadBoards() async {
    emit(BoardLoading());
    List<Board> listBoards = await boardUsecase.get();
    if (listBoards.isEmpty) {
      emit(BoardListLoadFailed());
    } else {
      boards = listBoards;
      emit(BoardListLoaded());
    }
  }
}
