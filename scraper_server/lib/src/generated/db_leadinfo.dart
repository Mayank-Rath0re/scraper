/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'db_extracted.dart' as _i2;

abstract class DBLeadInfo implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = DBLeadInfoTable();

  static const db = DBLeadInfoRepository._();

  @override
  int? id;

  String niche;

  String location;

  bool isExtracted;

  List<_i2.Extracted> data;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'niche': niche,
      'location': location,
      'isExtracted': isExtracted,
      'data': data.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static DBLeadInfoInclude include() {
    return DBLeadInfoInclude._();
  }

  static DBLeadInfoIncludeList includeList({
    _i1.WhereExpressionBuilder<DBLeadInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBLeadInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBLeadInfoTable>? orderByList,
    DBLeadInfoInclude? include,
  }) {
    return DBLeadInfoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DBLeadInfo.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DBLeadInfo.t),
      include: include,
    );
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

class DBLeadInfoTable extends _i1.Table {
  DBLeadInfoTable({super.tableRelation}) : super(tableName: 'dbleadinfo') {
    niche = _i1.ColumnString(
      'niche',
      this,
    );
    location = _i1.ColumnString(
      'location',
      this,
    );
    isExtracted = _i1.ColumnBool(
      'isExtracted',
      this,
    );
    data = _i1.ColumnSerializable(
      'data',
      this,
    );
  }

  late final _i1.ColumnString niche;

  late final _i1.ColumnString location;

  late final _i1.ColumnBool isExtracted;

  late final _i1.ColumnSerializable data;

  @override
  List<_i1.Column> get columns => [
        id,
        niche,
        location,
        isExtracted,
        data,
      ];
}

class DBLeadInfoInclude extends _i1.IncludeObject {
  DBLeadInfoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DBLeadInfo.t;
}

class DBLeadInfoIncludeList extends _i1.IncludeList {
  DBLeadInfoIncludeList._({
    _i1.WhereExpressionBuilder<DBLeadInfoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DBLeadInfo.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DBLeadInfo.t;
}

class DBLeadInfoRepository {
  const DBLeadInfoRepository._();

  Future<List<DBLeadInfo>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBLeadInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBLeadInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBLeadInfoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DBLeadInfo>(
      where: where?.call(DBLeadInfo.t),
      orderBy: orderBy?.call(DBLeadInfo.t),
      orderByList: orderByList?.call(DBLeadInfo.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBLeadInfo?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBLeadInfoTable>? where,
    int? offset,
    _i1.OrderByBuilder<DBLeadInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBLeadInfoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DBLeadInfo>(
      where: where?.call(DBLeadInfo.t),
      orderBy: orderBy?.call(DBLeadInfo.t),
      orderByList: orderByList?.call(DBLeadInfo.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBLeadInfo?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DBLeadInfo>(
      id,
      transaction: transaction,
    );
  }

  Future<List<DBLeadInfo>> insert(
    _i1.Session session,
    List<DBLeadInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DBLeadInfo>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBLeadInfo> insertRow(
    _i1.Session session,
    DBLeadInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DBLeadInfo>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBLeadInfo>> update(
    _i1.Session session,
    List<DBLeadInfo> rows, {
    _i1.ColumnSelections<DBLeadInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DBLeadInfo>(
      rows,
      columns: columns?.call(DBLeadInfo.t),
      transaction: transaction,
    );
  }

  Future<DBLeadInfo> updateRow(
    _i1.Session session,
    DBLeadInfo row, {
    _i1.ColumnSelections<DBLeadInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DBLeadInfo>(
      row,
      columns: columns?.call(DBLeadInfo.t),
      transaction: transaction,
    );
  }

  Future<List<DBLeadInfo>> delete(
    _i1.Session session,
    List<DBLeadInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DBLeadInfo>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBLeadInfo> deleteRow(
    _i1.Session session,
    DBLeadInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DBLeadInfo>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBLeadInfo>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DBLeadInfoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DBLeadInfo>(
      where: where(DBLeadInfo.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBLeadInfoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DBLeadInfo>(
      where: where?.call(DBLeadInfo.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
