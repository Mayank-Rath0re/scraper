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

abstract class DBEmail implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = DBEmailTable();

  static const db = DBEmailRepository._();

  @override
  int? id;

  int scraperId;

  String status;

  List<int> processIds;

  int completed;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'scraperId': scraperId,
      'status': status,
      'processIds': processIds.toJson(),
      'completed': completed,
    };
  }

  static DBEmailInclude include() {
    return DBEmailInclude._();
  }

  static DBEmailIncludeList includeList({
    _i1.WhereExpressionBuilder<DBEmailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBEmailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBEmailTable>? orderByList,
    DBEmailInclude? include,
  }) {
    return DBEmailIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DBEmail.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DBEmail.t),
      include: include,
    );
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

class DBEmailTable extends _i1.Table {
  DBEmailTable({super.tableRelation}) : super(tableName: 'dbemail') {
    scraperId = _i1.ColumnInt(
      'scraperId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    processIds = _i1.ColumnSerializable(
      'processIds',
      this,
    );
    completed = _i1.ColumnInt(
      'completed',
      this,
    );
  }

  late final _i1.ColumnInt scraperId;

  late final _i1.ColumnString status;

  late final _i1.ColumnSerializable processIds;

  late final _i1.ColumnInt completed;

  @override
  List<_i1.Column> get columns => [
        id,
        scraperId,
        status,
        processIds,
        completed,
      ];
}

class DBEmailInclude extends _i1.IncludeObject {
  DBEmailInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DBEmail.t;
}

class DBEmailIncludeList extends _i1.IncludeList {
  DBEmailIncludeList._({
    _i1.WhereExpressionBuilder<DBEmailTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DBEmail.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DBEmail.t;
}

class DBEmailRepository {
  const DBEmailRepository._();

  Future<List<DBEmail>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBEmailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBEmailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBEmailTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DBEmail>(
      where: where?.call(DBEmail.t),
      orderBy: orderBy?.call(DBEmail.t),
      orderByList: orderByList?.call(DBEmail.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBEmail?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBEmailTable>? where,
    int? offset,
    _i1.OrderByBuilder<DBEmailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBEmailTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DBEmail>(
      where: where?.call(DBEmail.t),
      orderBy: orderBy?.call(DBEmail.t),
      orderByList: orderByList?.call(DBEmail.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBEmail?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DBEmail>(
      id,
      transaction: transaction,
    );
  }

  Future<List<DBEmail>> insert(
    _i1.Session session,
    List<DBEmail> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DBEmail>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBEmail> insertRow(
    _i1.Session session,
    DBEmail row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DBEmail>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBEmail>> update(
    _i1.Session session,
    List<DBEmail> rows, {
    _i1.ColumnSelections<DBEmailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DBEmail>(
      rows,
      columns: columns?.call(DBEmail.t),
      transaction: transaction,
    );
  }

  Future<DBEmail> updateRow(
    _i1.Session session,
    DBEmail row, {
    _i1.ColumnSelections<DBEmailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DBEmail>(
      row,
      columns: columns?.call(DBEmail.t),
      transaction: transaction,
    );
  }

  Future<List<DBEmail>> delete(
    _i1.Session session,
    List<DBEmail> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DBEmail>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBEmail> deleteRow(
    _i1.Session session,
    DBEmail row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DBEmail>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBEmail>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DBEmailTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DBEmail>(
      where: where(DBEmail.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBEmailTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DBEmail>(
      where: where?.call(DBEmail.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
