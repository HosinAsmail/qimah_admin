import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final int? id;
  final String? name;
  final int? gender;
  final int? mosqueId;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;

  const CourseModel({
    this.id,
    this.name,
    this.gender,
    this.mosqueId,
    this.createdAt,
    this.lastUpdatedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        gender: json['gender'] as int?,
        mosqueId: json['mosqueId'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        lastUpdatedAt: json['lastUpdatedAt'] == null
            ? null
            : DateTime.parse(json['lastUpdatedAt'] as String),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'gender': gender,
      'mosqueId': mosqueId,
      'createdAt': createdAt?.toIso8601String(),
      'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  CourseModel copyWith({
    int? id,
    String? name,
    int? gender,
    int? mosqueId,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      mosqueId: mosqueId ?? this.mosqueId,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      gender,
      mosqueId,
      createdAt,
      lastUpdatedAt,
    ];
  }
}
