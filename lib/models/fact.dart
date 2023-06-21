import 'package:hive/hive.dart';

part 'fact.g.dart';

@HiveType(typeId: 1)
class Fact extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  DateTime createdAt;

  Fact({required this.text, required this.createdAt});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
