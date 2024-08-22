import 'package:equatable/equatable.dart';

class MosqueModel extends Equatable {
  final int? id;
  final String? name;
  final String? zone;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final String? courseName;
  final int? courseGender;

  const MosqueModel({
    this.id,
    this.name,
    this.zone,
    this.createdBy,
    this.createdAt,
    this.lastUpdatedAt,
    this.courseName,
    this.courseGender,
  });

  factory MosqueModel.fromJson(Map<String, dynamic> json) => MosqueModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        zone: json['zone'] as String?,
        createdBy: json['createdBy'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        lastUpdatedAt: json['lastUpdatedAt'] == null
            ? null
            : DateTime.parse(json['lastUpdatedAt'] as String),
        courseName: json['courseName'] as String?,
        courseGender: json['courseGender'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'zone': zone,
        'createdBy': createdBy,
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
        'courseName': courseName,
        'courseGender': courseGender,
      };

  MosqueModel copyWith({
    int? id,
    String? name,
    String? zone,
    int? createdBy,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
    String? courseName,
    int? courseGender,
  }) {
    return MosqueModel(
      id: id ?? this.id,
      name: name ?? this.name,
      zone: zone ?? this.zone,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      courseName: courseName ?? this.courseName,
      courseGender: courseGender ?? this.courseGender,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      zone,
      createdBy,
      createdAt,
      lastUpdatedAt,
      courseName,
      courseGender,
    ];
  }
}
