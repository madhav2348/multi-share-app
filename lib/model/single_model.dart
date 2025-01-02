class SingleModel {
  final String data;

  SingleModel({required this.data});

  Map<String, dynamic> toJson() {
    return {"data": data};
  }

  factory SingleModel.fromJson(Map<String, dynamic> data) {
    return SingleModel(data: data['data']);
  }
}
