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
import 'db_extracted.dart' as _i2;

abstract class DBLeadInfo implements _i1.SerializableModel {
  DBLeadInfo._({
    this.id,
    required this.niche,
    required this.location,
    required this.isExtracted,
    required this.data,
  });

  factory DBLeadInfo({
    int? id,
    required String niche,
    required String location,
    required bool isExtracted,
    required List<_i2.Extracted> data,
  }) = _DBLeadInfoImpl;

  factory DBLeadInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return DBLeadInfo(
      id: jsonSerialization['id'] as int?,
      niche: jsonSerialization['niche'] as String,
      location: jsonSerialization['location'] as String,
      isExtracted: jsonSerialization['isExtracted'] as bool,
      data: (jsonSerialization['data'] as List)
          .map((e) => _i2.Extracted.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String niche;

  String location;

  bool isExtracted;

  List<_i2.Extracted> data;

  DBLeadInfo copyWith({
    int? id,
    String? niche,
    String? location,
    bool? isExtracted,
    List<_i2.Extracted>? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'niche': niche,
      'location': location,
      'isExtracted': isExtracted,
      'data': data.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DBLeadInfoImpl extends DBLeadInfo {
  _DBLeadInfoImpl({
    int? id,
    required String niche,
    required String location,
    required bool isExtracted,
    required List<_i2.Extracted> data,
  }) : super._(
          id: id,
          niche: niche,
          location: location,
          isExtracted: isExtracted,
          data: data,
        );

  @override
  DBLeadInfo copyWith({
    Object? id = _Undefined,
    String? niche,
    String? location,
    bool? isExtracted,
    List<_i2.Extracted>? data,
  }) {
    return DBLeadInfo(
      id: id is int? ? id : this.id,
      niche: niche ?? this.niche,
      location: location ?? this.location,
      isExtracted: isExtracted ?? this.isExtracted,
      data: data ?? this.data.map((e0) => e0.copyWith()).toList(),
    );
  }
}
