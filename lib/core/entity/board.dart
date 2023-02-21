import 'package:triplen_app/core/entity/task.dart';

class BoardResponse {
  bool? success;
  List<Board>? data;
  String? message;

  BoardResponse({this.success, this.data, this.message});

  BoardResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Board>[];
      json['data'].forEach((v) {
        data!.add(new Board.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class BoardDetailResponse {
  bool? success;
  Board? data;
  String? message;

  BoardDetailResponse({this.success, this.data, this.message});

  BoardDetailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Board.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Board {
  int? id;
  int? idUser;
  String? board;
  int? status;
  String? date;
  String? created;
  List<Task>? task;

  Board(
      {this.id, this.idUser, this.board, this.status, this.date, this.created, this.task});

  Board.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    board = json['board'];
    status = json['status'];
    date = json['date'];
    created = json['created'];
    task = json['task'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_user'] = idUser;
    data['board'] = board;
    data['status'] = status;
    data['date'] = date;
    data['created'] = created;
    data['task'] = task!.map((v) => v.toJson()).toList();
    return data;
  }
}
