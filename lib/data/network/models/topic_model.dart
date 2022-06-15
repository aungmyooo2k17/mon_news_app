class TopicModel {
  final int? id;
  final String? name;
  final int priority;

  TopicModel({required this.id, required this.name, required this.priority});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
        id: json['id'], name: json['name'], priority: json['priority']);
  }
}
