
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/core/repository.dart';
import 'package:triplen_app/core/repository/board/board_repository.dart';
import 'package:triplen_app/core/repository/user/user_repository.dart';
import 'package:triplen_app/core/usecase.dart';
import 'package:triplen_app/core/usecase/board/board_usecase.dart';
import 'package:triplen_app/core/usecase/user/user_usecase.dart';
import 'package:triplen_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:triplen_app/presentation/bloc/board/board_cubit.dart';
import 'package:triplen_app/util/http_client.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // add sharedPreferences into dependency list
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  final httpClient = HttpClient();
  sl.registerLazySingleton<HttpClient>(() => httpClient);

  // add every repository into dependency list
  sl.registerLazySingleton<UserRepo>(() => UserRepository(client: sl()));
  sl.registerLazySingleton<BoardRepo>(() => BoardRepository(httpClient: sl()));

  // add every usecase into dependency list
  sl.registerLazySingleton<UserUC>(() => UserUsecase(repository: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton<BoardUC>(() => BoardUsecase(boardRepository: sl(), sharedPreferences: sl()));


  // add every cubit into dependency list
  AuthCubit authCubit = AuthCubit(usecase: sl(), sharedPreferences: sl());
  sl.registerSingleton<AuthCubit>(authCubit);

  BoardCubit boardCubit = BoardCubit(boardUsecase: sl());
  sl.registerSingleton<BoardCubit>(boardCubit);
}