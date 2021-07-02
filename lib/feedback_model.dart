class FeedbackModel {
  var id;
  var name;
  var n;

  FeedbackModel({this.id, this.name, this.n});

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      id: "${json['id']}",
      name: "${json['name']}",
      n: "${json['n']}",
    );
  }

  Map toJson() => {
        "id": id,
        "name": name,
        "n": n,
      };
}
