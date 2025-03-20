/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class DBProcess implements _i1.SerializableModel {
  DBProcess._({
    this.id,
    required this.niche,
    required this.location,
    String? status,
    int? processId,
  })  : status = status ?? 'Inactive',
        processId = processId ?? 0;

  factory DBProcess({
    int? id,
    required String niche,
    required String location,
    String? status,
    int? processId,
  }) = _DBProcessImpl;

  factory DBProcess.fromJson(Map<String, dynamic> jsonSerialization) {
    return DBProcess(
      id: jsonSerialization['id'] as int?,
      niche: jsonSerialization['niche'] as String,
      location: jsonSerialization['location'] as String,
      status: jsonSerialization['status'] as String,
      processId: jsonSerialization['processId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String niche;

  String location;

  String status;

  int processId;

  DBProcess copyWith({
    int? id,
    String? niche,
    String? location,
    String? status,
    int? processId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'niche': niche,
      'location': location,
      'status': status,
      'processId': processId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DBProcessImpl extends DBProcess {
  _DBProcessImpl({
    int? id,
    required String niche,
    required String location,
    String? status,
    int? processId,
  }) : super._(
          id: id,
          niche: niche,
          location: location,
          status: status,
          processId: processId,
        );

  @override
  DBProcess copyWith({
    Object? id = _Undefined,
    String? niche,
    String? location,
    String? status,
    int? processId,
  }) {
    return DBProcess(
      id: id is int? ? id : this.id,
      niche: niche ?? this.niche,
      location: location ?? this.location,
      status: status ?? this.status,
      processId: processId ?? this.processId,
    );
  }
}
