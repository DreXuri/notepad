// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class Notes with _$Notes {
  const factory Notes({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'description') @Default('') String description,
  }) = _Notes;

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);
}
