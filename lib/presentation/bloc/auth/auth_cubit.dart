import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:triplen_app/core/usecase.dart';
import 'package:triplen_app/core/usecase/user/user_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  UserUC usecase = UserUsecase();

  AuthCubit() : super(AuthInitial());

  void doAuth(String email) async {
    emit(AuthLoading());
    bool login = await usecase.doAuth(email);
    if (login) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailed());
    }
  }
}
