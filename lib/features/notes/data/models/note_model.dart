import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String? id;
  final String? uid;
  final String? title;
  final String? content;
  final DateTime? createdAt;

  const NoteModel({
    this.id,
    this.uid,
    this.title,
    this.content,
    this.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json['id'] as String?,
    uid: json['uid'] as String?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] is Timestamp
        ? (json['createdAt'] as Timestamp).toDate()
        : json['createdAt'] as DateTime?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'uid': uid,
    'title': title,
    'content': content,
    'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
  };

  NoteModel copyWith({
    String? id,
    String? uid,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, uid, title, content, createdAt];
}
