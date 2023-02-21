import 'package:dio/dio.dart';
import 'package:triplen_app/core/entity/board.dart';
import 'package:triplen_app/core/repository.dart';
import 'package:triplen_app/util/http_client.dart';

class BoardRepository extends BoardRepo {

  BoardRepository({required this.httpClient});

  HttpClient httpClient;

  @override
  Future<BoardDetailResponse> detail(int id, String token) async {
    Response response = await httpClient.dio.get("/boards/" + id.toString());
    if (response.statusCode == 200) {
      final data = BoardDetailResponse.fromJson(response.data);

      return data;
    }

    return BoardDetailResponse();
  }

  @override
  Future<BoardResponse> get(String token) async {
    Response response = await httpClient.dio.get("/boards");
    if (response.statusCode == 200) {
      final data = BoardResponse.fromJson(response.data);

      return data;
    }

    return BoardResponse();
  }

}