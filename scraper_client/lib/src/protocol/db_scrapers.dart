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

abstract class DBScrapers implements _i1.SerializableModel {
  DBScrapers._({
    this.id,
    required this.niche,
    required this.location,
    required this.status,
    required this.logs,
    required this.createdAt,
    required this.processes,
    required this.processCount,
  });

  factory DBScrapers({
    int? id,
    required List<String> niche,
    required List<String> location,
    required String status,
    required String logs,
    required DateTime createdAt,
    required List<int> processes,
    required int processCount,
  }) = _DBScrapersImpl;

  factory DBScrapers.fromJson(Map<String, dynamic> jsonSerialization) {
    return DBScrapers(
      id: jsonSerialization['id'] as int?,
      niche:
          (jsonSerialization['niche'] as List).map((e) => e as String).toList(),
      location: (jsonSerialization['location'] as List)
          .map((e) => e as String)
          .toList(),
      status: jsonSerialization['status'] as String,
      logs: jsonSerialization['logs'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      processes: (jsonSerialization['processes'] as List)
          .map((e) => e as int)
          .toList(),
      processCount: jsonSerialization['processCount'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<String> niche;

  List<String> location;

  String status;

  String logs;

  DateTime createdAt;

  List<int> processes;

  int processCount;

  DBScrapers copyWith({
    int? id,
    List<String>? niche,
    List<String>? location,
    String? status,
    String? logs,
    DateTime? createdAt,
    List<int>? processes,
    int? processCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'niche': niche.toJson(),
      'location': location.toJson(),
      'status': status,
      'logs': logs,
      'createdAt': createdAt.toJson(),
      'processes': processes.toJson(),
      'processCount': processCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DBScrapersImpl extends DBScrapers {
  _DBScrapersImpl({
    int? id,
    required List<String> niche,
    required List<String> location,
    required String status,
    required String logs,
    required DateTime createdAt,
    required List<int> processes,
    required int processCount,
  }) : super._(
          id: id,
          niche: niche,
          location: location,
          status: status,
          logs: logs,
          createdAt: createdAt,
          processes: processes,
          processCount: processCount,
        );

  @override
  DBScrapers copyWith({
    Object? id = _Undefined,
    List<String>? niche,
    List<String>? location,
    String? status,
    String? logs,
    DateTime? createdAt,
    List<int>? processes,
    int? processCount,
  }) {
    return DBScrapers(
      id: id is int? ? id : this.id,
      niche: niche ?? this.niche.map((e0) => e0).toList(),
      location: location ?? this.location.map((e0) => e0).toList(),
      status: status ?? this.status,
      logs: logs ?? this.logs,
      createdAt: createdAt ?? this.createdAt,
      processes: processes ?? this.processes.map((e0) => e0).toList(),
      processCount: processCount ?? this.processCount,
    );
  }
}
