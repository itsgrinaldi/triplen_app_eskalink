class Task {
  int? id;
  int? idUser;
  int? idBoard;
  String? task;
  String? location;
  String? latitude;
  String? longitude;
  String? budget;
  String? date;
  int? status;
  String? created;

  Task(
      {this.id,
        this.idUser,
        this.idBoard,
        this.task,
        this.location,
        this.latitude,
        this.longitude,
        this.budget,
        this.date,
        this.status,
        this.created});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    idBoard = json['id_board'];
    task = json['task'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    budget = json['budget'];
    date = json['date'];
    status = json['status'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['id_board'] = this.idBoard;
    data['task'] = this.task;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['budget'] = this.budget;
    data['date'] = this.date;
    data['status'] = this.status;
    data['created'] = this.created;
    return data;
  }
}