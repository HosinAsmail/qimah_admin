import 'package:equatable/equatable.dart';

class GroupModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final int? courseId;

  const GroupModel({this.id, this.name, this.description, this.courseId});

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        courseId: json['courseId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'courseId': courseId,
      };

  GroupModel copyWith({
    int? id,
    String? name,
    String? description,
    int? courseId,
  }) {
    return GroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      courseId: courseId ?? this.courseId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, description, courseId];
}
