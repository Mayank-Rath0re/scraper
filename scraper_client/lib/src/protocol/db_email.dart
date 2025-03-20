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

abstract class DBEmail implements _i1.SerializableModel {
  DBEmail._({
    this.id,
    required this.scraperId,
    required this.status,
    required this.processIds,
    required this.completed,
  });

  factory DBEmail({
    int? id,
    required int scraperId,
    required String status,
    required List<int> processIds,
    required int completed,
  }) = _DBEmailImpl;

  factory DBEmail.fromJson(Map<String, dynamic> jsonSerialization) {
    return DBEmail(
      id: jsonSerialization['id'] as int?,
      scraperId: jsonSerialization['scraperId'] as int,
      status: jsonSerialization['status'] as String,
      processIds: (jsonSerialization['processIds'] as List)
          .map((e) => e as int)
          .toList(),
      completed: jsonSerialization['completed'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int scraperId;

  String status;

  List<int> processIds;

  int completed;

  DBEmail copyWith({
    int? id,
    int? scraperId,
    String? status,
    List<int>? processIds,
    int? completed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'scraperId': scraperId,
      'status': status,
      'processIds': processIds.toJson(),
      'completed': completed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DBEmailImpl extends DBEmail {
  _DBEmailImpl({
    int? id,
    required int scraperId,
    required String status,
    required List<int> processIds,
    required int completed,
  }) : super._(
          id: id,
          scraperId: scraperId,
          status: status,
          processIds: processIds,
          completed: completed,
        );

  @override
  DBEmail copyWith({
    Object? id = _Undefined,
    int? scraperId,
    String? status,
    List<int>? processIds,
    int? completed,
  }) {
    return DBEmail(
      id: id is int? ? id : this.id,
      scraperId: scraperId ?? this.scraperId,
      status: status ?? this.status,
      processIds: processIds ?? this.processIds.map((e0) => e0).toList(),
      completed: completed ?? this.completed,
    );
  }
}
