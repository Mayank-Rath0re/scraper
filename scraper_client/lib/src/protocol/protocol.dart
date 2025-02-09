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
import 'db_email.dart' as _i2;
import 'db_extracted.dart' as _i3;
import 'db_leadinfo.dart' as _i4;
import 'db_process.dart' as _i5;
import 'db_scrapers.dart' as _i6;
import 'example.dart' as _i7;
import 'package:scraper_client/src/protocol/db_email.dart' as _i8;
import 'package:scraper_client/src/protocol/db_process.dart' as _i9;
import 'package:scraper_client/src/protocol/db_scrapers.dart' as _i10;
export 'db_email.dart';
export 'db_extracted.dart';
export 'db_leadinfo.dart';
export 'db_process.dart';
export 'db_scrapers.dart';
export 'example.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.DBEmail) {
      return _i2.DBEmail.fromJson(data) as T;
    }
    if (t == _i3.Extracted) {
      return _i3.Extracted.fromJson(data) as T;
    }
    if (t == _i4.DBLeadInfo) {
      return _i4.DBLeadInfo.fromJson(data) as T;
    }
    if (t == _i5.DBProcess) {
      return _i5.DBProcess.fromJson(data) as T;
    }
    if (t == _i6.DBScrapers) {
      return _i6.DBScrapers.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.DBEmail?>()) {
      return (data != null ? _i2.DBEmail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Extracted?>()) {
      return (data != null ? _i3.Extracted.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DBLeadInfo?>()) {
      return (data != null ? _i4.DBLeadInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DBProcess?>()) {
      return (data != null ? _i5.DBProcess.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DBScrapers?>()) {
      return (data != null ? _i6.DBScrapers.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i3.Extracted>) {
      return (data as List).map((e) => deserialize<_i3.Extracted>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.DBEmail>) {
      return (data as List).map((e) => deserialize<_i8.DBEmail>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.DBProcess>) {
      return (data as List).map((e) => deserialize<_i9.DBProcess>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i10.DBScrapers>) {
      return (data as List).map((e) => deserialize<_i10.DBScrapers>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.DBEmail) {
      return 'DBEmail';
    }
    if (data is _i3.Extracted) {
      return 'Extracted';
    }
    if (data is _i4.DBLeadInfo) {
      return 'DBLeadInfo';
    }
    if (data is _i5.DBProcess) {
      return 'DBProcess';
    }
    if (data is _i6.DBScrapers) {
      return 'DBScrapers';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'DBEmail') {
      return deserialize<_i2.DBEmail>(data['data']);
    }
    if (dataClassName == 'Extracted') {
      return deserialize<_i3.Extracted>(data['data']);
    }
    if (dataClassName == 'DBLeadInfo') {
      return deserialize<_i4.DBLeadInfo>(data['data']);
    }
    if (dataClassName == 'DBProcess') {
      return deserialize<_i5.DBProcess>(data['data']);
    }
    if (dataClassName == 'DBScrapers') {
      return deserialize<_i6.DBScrapers>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
