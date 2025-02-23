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

abstract class DBScrapers implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = DBScrapersTable();

  static const db = DBScrapersRepository._();

  @override
  int? id;

  List<String> niche;

  List<String> location;

  String status;

  String logs;

  DateTime createdAt;

  List<int> processes;

  int processCount;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static DBScrapersInclude include() {
    return DBScrapersInclude._();
  }

  static DBScrapersIncludeList includeList({
    _i1.WhereExpressionBuilder<DBScrapersTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBScrapersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBScrapersTable>? orderByList,
    DBScrapersInclude? include,
  }) {
    return DBScrapersIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DBScrapers.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DBScrapers.t),
      include: include,
    );
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

class DBScrapersTable extends _i1.Table {
  DBScrapersTable({super.tableRelation}) : super(tableName: 'dbscrapers') {
    niche = _i1.ColumnSerializable(
      'niche',
      this,
    );
    location = _i1.ColumnSerializable(
      'location',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    logs = _i1.ColumnString(
      'logs',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    processes = _i1.ColumnSerializable(
      'processes',
      this,
    );
    processCount = _i1.ColumnInt(
      'processCount',
      this,
    );
  }

  late final _i1.ColumnSerializable niche;

  late final _i1.ColumnSerializable location;

  late final _i1.ColumnString status;

  late final _i1.ColumnString logs;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnSerializable processes;

  late final _i1.ColumnInt processCount;

  @override
  List<_i1.Column> get columns => [
        id,
        niche,
        location,
        status,
        logs,
        createdAt,
        processes,
        processCount,
      ];
}

class DBScrapersInclude extends _i1.IncludeObject {
  DBScrapersInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DBScrapers.t;
}

class DBScrapersIncludeList extends _i1.IncludeList {
  DBScrapersIncludeList._({
    _i1.WhereExpressionBuilder<DBScrapersTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DBScrapers.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DBScrapers.t;
}

class DBScrapersRepository {
  const DBScrapersRepository._();

  Future<List<DBScrapers>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBScrapersTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DBScrapersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBScrapersTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DBScrapers>(
      where: where?.call(DBScrapers.t),
      orderBy: orderBy?.call(DBScrapers.t),
      orderByList: orderByList?.call(DBScrapers.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBScrapers?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBScrapersTable>? where,
    int? offset,
    _i1.OrderByBuilder<DBScrapersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DBScrapersTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DBScrapers>(
      where: where?.call(DBScrapers.t),
      orderBy: orderBy?.call(DBScrapers.t),
      orderByList: orderByList?.call(DBScrapers.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DBScrapers?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DBScrapers>(
      id,
      transaction: transaction,
    );
  }

  Future<List<DBScrapers>> insert(
    _i1.Session session,
    List<DBScrapers> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DBScrapers>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBScrapers> insertRow(
    _i1.Session session,
    DBScrapers row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DBScrapers>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBScrapers>> update(
    _i1.Session session,
    List<DBScrapers> rows, {
    _i1.ColumnSelections<DBScrapersTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DBScrapers>(
      rows,
      columns: columns?.call(DBScrapers.t),
      transaction: transaction,
    );
  }

  Future<DBScrapers> updateRow(
    _i1.Session session,
    DBScrapers row, {
    _i1.ColumnSelections<DBScrapersTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DBScrapers>(
      row,
      columns: columns?.call(DBScrapers.t),
      transaction: transaction,
    );
  }

  Future<List<DBScrapers>> delete(
    _i1.Session session,
    List<DBScrapers> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DBScrapers>(
      rows,
      transaction: transaction,
    );
  }

  Future<DBScrapers> deleteRow(
    _i1.Session session,
    DBScrapers row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DBScrapers>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DBScrapers>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DBScrapersTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DBScrapers>(
      where: where(DBScrapers.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DBScrapersTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DBScrapers>(
      where: where?.call(DBScrapers.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
