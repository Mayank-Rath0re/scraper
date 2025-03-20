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

abstract class DBProcess implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = DBProcessTable();

  static const db = DBProcessRepository._();

  @override
  int? id;

  String niche;

  String location;

  String status;

  int processId;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'niche': niche,
      'location': location,
      'status': status,
      'processId': processId,
    };
  }

  static DBProcessInclude include() {
    return DBProcessInclude._();
  }

  static DBProcessIncludeList includeList({
    _i1.WhereExpressionBuilder<DBProcessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBProcessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBProcessTable>? orderByList,
    DBProcessInclude? include,
  }) {
    return DBProcessIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DBProcess.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DBProcess.t),
      include: include,
    );
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

class DBProcessTable extends _i1.Table {
  DBProcessTable({super.tableRelation}) : super(tableName: 'dbprocess') {
    niche = _i1.ColumnString(
      'niche',
      this,
    );
    location = _i1.ColumnString(
      'location',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    processId = _i1.ColumnInt(
      'processId',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnString niche;

  late final _i1.ColumnString location;

  late final _i1.ColumnString status;

  late final _i1.ColumnInt processId;

  @override
  List<_i1.Column> get columns => [
        id,
        niche,
        location,
        status,
        processId,
      ];
}

class DBProcessInclude extends _i1.IncludeObject {
  DBProcessInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DBProcess.t;
}

class DBProcessIncludeList extends _i1.IncludeList {
  DBProcessIncludeList._({
    _i1.WhereExpressionBuilder<DBProcessTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DBProcess.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DBProcess.t;
}

class DBProcessRepository {
  const DBProcessRepository._();

  Future<List<DBProcess>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBProcessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBProcessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBProcessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DBProcess>(
      where: where?.call(DBProcess.t),
      orderBy: orderBy?.call(DBProcess.t),
      orderByList: orderByList?.call(DBProcess.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBProcess?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBProcessTable>? where,
    int? offset,
    _i1.OrderByBuilder<DBProcessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBProcessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DBProcess>(
      where: where?.call(DBProcess.t),
      orderBy: orderBy?.call(DBProcess.t),
      orderByList: orderByList?.call(DBProcess.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBProcess?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DBProcess>(
      id,
      transaction: transaction,
    );
  }

  Future<List<DBProcess>> insert(
    _i1.Session session,
    List<DBProcess> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DBProcess>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBProcess> insertRow(
    _i1.Session session,
    DBProcess row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DBProcess>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBProcess>> update(
    _i1.Session session,
    List<DBProcess> rows, {
    _i1.ColumnSelections<DBProcessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DBProcess>(
      rows,
      columns: columns?.call(DBProcess.t),
      transaction: transaction,
    );
  }

  Future<DBProcess> updateRow(
    _i1.Session session,
    DBProcess row, {
    _i1.ColumnSelections<DBProcessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DBProcess>(
      row,
      columns: columns?.call(DBProcess.t),
      transaction: transaction,
    );
  }

  Future<List<DBProcess>> delete(
    _i1.Session session,
    List<DBProcess> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DBProcess>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBProcess> deleteRow(
    _i1.Session session,
    DBProcess row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DBProcess>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBProcess>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DBProcessTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DBProcess>(
      where: where(DBProcess.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBProcessTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DBProcess>(
      where: where?.call(DBProcess.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
