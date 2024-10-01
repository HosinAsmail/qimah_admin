// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseInputModel {
  int? id;
  String? name;
  int? gender;
  int? mosqueId;
  DateTime? createdAt;
  DateTime? lastUpdatedAt;
  CourseInputModel({
    this.id,
    this.name,
    this.gender,
    this.mosqueId,
    this.createdAt,
    this.lastUpdatedAt,
  });

  CourseInputModel copyWith({
    int? id,
    String? name,
    int? gender,
    int? mosqueId,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) {
    return CourseInputModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      mosqueId: mosqueId ?? this.mosqueId,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'mosqueId': mosqueId,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'lastUpdatedAt': lastUpdatedAt?.millisecondsSinceEpoch,
    };
  }

  factory CourseInputModel.fromMap(Map<String, dynamic> map) {
    return CourseInputModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as int : null,
      mosqueId: map['mosqueId'] != null ? map['mosqueId'] as int : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      lastUpdatedAt: map['lastUpdatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdatedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseInputModel.fromJson(String source) =>
      CourseInputModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseInputModel(id: $id, name: $name, gender: $gender, mosqueId: $mosqueId, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(covariant CourseInputModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.gender == gender &&
        other.mosqueId == mosqueId &&
        other.createdAt == createdAt &&
        other.lastUpdatedAt == lastUpdatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        mosqueId.hashCode ^
        createdAt.hashCode ^
        lastUpdatedAt.hashCode;
  }
}
