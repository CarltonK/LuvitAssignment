import 'dart:convert';

LuvitModel luvitModelFromJson(String str) =>
    LuvitModel.fromJson(json.decode(str));

class LuvitModel {
  DataModel apple, banana, melon, peach;

  LuvitModel({
    required this.apple,
    required this.banana,
    required this.melon,
    required this.peach,
  });

  factory LuvitModel.fromJson(Map<String, dynamic> json) => LuvitModel(
        apple: DataModel.fromJson(json['apple']),
        banana: DataModel.fromJson(json['banana']),
        melon: DataModel.fromJson(json['melon']),
        peach: DataModel.fromJson(json['peach']),
      );

  Map<String, dynamic> toJson() => {
        'apple': apple.toJson(),
        'banana': banana.toJson(),
        'melon': melon.toJson(),
        'peach': peach.toJson(),
      };
}

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

class DataModel {
  int age;
  String description;
  List<String> images;
  int likeCount;
  String location;
  String name;
  List<String> tags;

  DataModel({
    required this.age,
    required this.description,
    required this.images,
    required this.likeCount,
    required this.location,
    required this.name,
    required this.tags,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        age: json['age'],
        description: json['description'],
        images: List<String>.from(json['images'].map((x) => x)),
        likeCount: json['likeCount'],
        location: json['location'],
        name: json['name'],
        tags: List<String>.from(json['tags'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'age': age,
        'description': description,
        'images': List<dynamic>.from(images.map((x) => x)),
        'likeCount': likeCount,
        'location': location,
        'name': name,
        'tags': List<dynamic>.from(tags.map((x) => x)),
      };
}
