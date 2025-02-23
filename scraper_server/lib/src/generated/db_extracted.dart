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

abstract class Extracted implements _i1.TableRow, _i1.ProtocolSerialization {
  Extracted._({
    this.id,
    required this.inputId,
    required this.link,
    required this.title,
    required this.category,
    required this.address,
    required this.openHours,
    required this.popularTimes,
    required this.website,
    required this.phone,
    required this.plusCode,
    required this.reviewCount,
    required this.reviewRating,
    required this.reviewPerRating,
    required this.latitude,
    required this.longitude,
    required this.cid,
    required this.status,
    required this.description,
    required this.reviewsLink,
    required this.thumbnail,
    required this.timezone,
    required this.priceRange,
    required this.dataId,
    required this.images,
    required this.reservations,
    required this.orderOnline,
    required this.menu,
    required this.owner,
    required this.completeAddress,
    required this.about,
    required this.userReviews,
    required this.emails,
  });

  factory Extracted({
    int? id,
    required String inputId,
    required String link,
    required String title,
    required String category,
    required String address,
    required String openHours,
    required String popularTimes,
    required String website,
    required String phone,
    required String plusCode,
    required String reviewCount,
    required String reviewRating,
    required String reviewPerRating,
    required String latitude,
    required String longitude,
    required String cid,
    required String status,
    required String description,
    required String reviewsLink,
    required String thumbnail,
    required String timezone,
    required String priceRange,
    required String dataId,
    required String images,
    required String reservations,
    required String orderOnline,
    required String menu,
    required String owner,
    required String completeAddress,
    required String about,
    required String userReviews,
    required String emails,
  }) = _ExtractedImpl;

  factory Extracted.fromJson(Map<String, dynamic> jsonSerialization) {
    return Extracted(
      id: jsonSerialization['id'] as int?,
      inputId: jsonSerialization['inputId'] as String,
      link: jsonSerialization['link'] as String,
      title: jsonSerialization['title'] as String,
      category: jsonSerialization['category'] as String,
      address: jsonSerialization['address'] as String,
      openHours: jsonSerialization['openHours'] as String,
      popularTimes: jsonSerialization['popularTimes'] as String,
      website: jsonSerialization['website'] as String,
      phone: jsonSerialization['phone'] as String,
      plusCode: jsonSerialization['plusCode'] as String,
      reviewCount: jsonSerialization['reviewCount'] as String,
      reviewRating: jsonSerialization['reviewRating'] as String,
      reviewPerRating: jsonSerialization['reviewPerRating'] as String,
      latitude: jsonSerialization['latitude'] as String,
      longitude: jsonSerialization['longitude'] as String,
      cid: jsonSerialization['cid'] as String,
      status: jsonSerialization['status'] as String,
      description: jsonSerialization['description'] as String,
      reviewsLink: jsonSerialization['reviewsLink'] as String,
      thumbnail: jsonSerialization['thumbnail'] as String,
      timezone: jsonSerialization['timezone'] as String,
      priceRange: jsonSerialization['priceRange'] as String,
      dataId: jsonSerialization['dataId'] as String,
      images: jsonSerialization['images'] as String,
      reservations: jsonSerialization['reservations'] as String,
      orderOnline: jsonSerialization['orderOnline'] as String,
      menu: jsonSerialization['menu'] as String,
      owner: jsonSerialization['owner'] as String,
      completeAddress: jsonSerialization['completeAddress'] as String,
      about: jsonSerialization['about'] as String,
      userReviews: jsonSerialization['userReviews'] as String,
      emails: jsonSerialization['emails'] as String,
    );
  }

  static final t = ExtractedTable();

  static const db = ExtractedRepository._();

  @override
  int? id;

  String inputId;

  String link;

  String title;

  String category;

  String address;

  String openHours;

  String popularTimes;

  String website;

  String phone;

  String plusCode;

  String reviewCount;

  String reviewRating;

  String reviewPerRating;

  String latitude;

  String longitude;

  String cid;

  String status;

  String description;

  String reviewsLink;

  String thumbnail;

  String timezone;

  String priceRange;

  String dataId;

  String images;

  String reservations;

  String orderOnline;

  String menu;

  String owner;

  String completeAddress;

  String about;

  String userReviews;

  String emails;

  @override
  _i1.Table get table => t;

  Extracted copyWith({
    int? id,
    String? inputId,
    String? link,
    String? title,
    String? category,
    String? address,
    String? openHours,
    String? popularTimes,
    String? website,
    String? phone,
    String? plusCode,
    String? reviewCount,
    String? reviewRating,
    String? reviewPerRating,
    String? latitude,
    String? longitude,
    String? cid,
    String? status,
    String? description,
    String? reviewsLink,
    String? thumbnail,
    String? timezone,
    String? priceRange,
    String? dataId,
    String? images,
    String? reservations,
    String? orderOnline,
    String? menu,
    String? owner,
    String? completeAddress,
    String? about,
    String? userReviews,
    String? emails,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'inputId': inputId,
      'link': link,
      'title': title,
      'category': category,
      'address': address,
      'openHours': openHours,
      'popularTimes': popularTimes,
      'website': website,
      'phone': phone,
      'plusCode': plusCode,
      'reviewCount': reviewCount,
      'reviewRating': reviewRating,
      'reviewPerRating': reviewPerRating,
      'latitude': latitude,
      'longitude': longitude,
      'cid': cid,
      'status': status,
      'description': description,
      'reviewsLink': reviewsLink,
      'thumbnail': thumbnail,
      'timezone': timezone,
      'priceRange': priceRange,
      'dataId': dataId,
      'images': images,
      'reservations': reservations,
      'orderOnline': orderOnline,
      'menu': menu,
      'owner': owner,
      'completeAddress': completeAddress,
      'about': about,
      'userReviews': userReviews,
      'emails': emails,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'inputId': inputId,
      'link': link,
      'title': title,
      'category': category,
      'address': address,
      'openHours': openHours,
      'popularTimes': popularTimes,
      'website': website,
      'phone': phone,
      'plusCode': plusCode,
      'reviewCount': reviewCount,
      'reviewRating': reviewRating,
      'reviewPerRating': reviewPerRating,
      'latitude': latitude,
      'longitude': longitude,
      'cid': cid,
      'status': status,
      'description': description,
      'reviewsLink': reviewsLink,
      'thumbnail': thumbnail,
      'timezone': timezone,
      'priceRange': priceRange,
      'dataId': dataId,
      'images': images,
      'reservations': reservations,
      'orderOnline': orderOnline,
      'menu': menu,
      'owner': owner,
      'completeAddress': completeAddress,
      'about': about,
      'userReviews': userReviews,
      'emails': emails,
    };
  }

  static ExtractedInclude include() {
    return ExtractedInclude._();
  }

  static ExtractedIncludeList includeList({
    _i1.WhereExpressionBuilder<ExtractedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExtractedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExtractedTable>? orderByList,
    ExtractedInclude? include,
  }) {
    return ExtractedIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Extracted.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Extracted.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExtractedImpl extends Extracted {
  _ExtractedImpl({
    int? id,
    required String inputId,
    required String link,
    required String title,
    required String category,
    required String address,
    required String openHours,
    required String popularTimes,
    required String website,
    required String phone,
    required String plusCode,
    required String reviewCount,
    required String reviewRating,
    required String reviewPerRating,
    required String latitude,
    required String longitude,
    required String cid,
    required String status,
    required String description,
    required String reviewsLink,
    required String thumbnail,
    required String timezone,
    required String priceRange,
    required String dataId,
    required String images,
    required String reservations,
    required String orderOnline,
    required String menu,
    required String owner,
    required String completeAddress,
    required String about,
    required String userReviews,
    required String emails,
  }) : super._(
          id: id,
          inputId: inputId,
          link: link,
          title: title,
          category: category,
          address: address,
          openHours: openHours,
          popularTimes: popularTimes,
          website: website,
          phone: phone,
          plusCode: plusCode,
          reviewCount: reviewCount,
          reviewRating: reviewRating,
          reviewPerRating: reviewPerRating,
          latitude: latitude,
          longitude: longitude,
          cid: cid,
          status: status,
          description: description,
          reviewsLink: reviewsLink,
          thumbnail: thumbnail,
          timezone: timezone,
          priceRange: priceRange,
          dataId: dataId,
          images: images,
          reservations: reservations,
          orderOnline: orderOnline,
          menu: menu,
          owner: owner,
          completeAddress: completeAddress,
          about: about,
          userReviews: userReviews,
          emails: emails,
        );

  @override
  Extracted copyWith({
    Object? id = _Undefined,
    String? inputId,
    String? link,
    String? title,
    String? category,
    String? address,
    String? openHours,
    String? popularTimes,
    String? website,
    String? phone,
    String? plusCode,
    String? reviewCount,
    String? reviewRating,
    String? reviewPerRating,
    String? latitude,
    String? longitude,
    String? cid,
    String? status,
    String? description,
    String? reviewsLink,
    String? thumbnail,
    String? timezone,
    String? priceRange,
    String? dataId,
    String? images,
    String? reservations,
    String? orderOnline,
    String? menu,
    String? owner,
    String? completeAddress,
    String? about,
    String? userReviews,
    String? emails,
  }) {
    return Extracted(
      id: id is int? ? id : this.id,
      inputId: inputId ?? this.inputId,
      link: link ?? this.link,
      title: title ?? this.title,
      category: category ?? this.category,
      address: address ?? this.address,
      openHours: openHours ?? this.openHours,
      popularTimes: popularTimes ?? this.popularTimes,
      website: website ?? this.website,
      phone: phone ?? this.phone,
      plusCode: plusCode ?? this.plusCode,
      reviewCount: reviewCount ?? this.reviewCount,
      reviewRating: reviewRating ?? this.reviewRating,
      reviewPerRating: reviewPerRating ?? this.reviewPerRating,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      cid: cid ?? this.cid,
      status: status ?? this.status,
      description: description ?? this.description,
      reviewsLink: reviewsLink ?? this.reviewsLink,
      thumbnail: thumbnail ?? this.thumbnail,
      timezone: timezone ?? this.timezone,
      priceRange: priceRange ?? this.priceRange,
      dataId: dataId ?? this.dataId,
      images: images ?? this.images,
      reservations: reservations ?? this.reservations,
      orderOnline: orderOnline ?? this.orderOnline,
      menu: menu ?? this.menu,
      owner: owner ?? this.owner,
      completeAddress: completeAddress ?? this.completeAddress,
      about: about ?? this.about,
      userReviews: userReviews ?? this.userReviews,
      emails: emails ?? this.emails,
    );
  }
}

class ExtractedTable extends _i1.Table {
  ExtractedTable({super.tableRelation}) : super(tableName: 'extracted') {
    inputId = _i1.ColumnString(
      'inputId',
      this,
    );
    link = _i1.ColumnString(
      'link',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    openHours = _i1.ColumnString(
      'openHours',
      this,
    );
    popularTimes = _i1.ColumnString(
      'popularTimes',
      this,
    );
    website = _i1.ColumnString(
      'website',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    plusCode = _i1.ColumnString(
      'plusCode',
      this,
    );
    reviewCount = _i1.ColumnString(
      'reviewCount',
      this,
    );
    reviewRating = _i1.ColumnString(
      'reviewRating',
      this,
    );
    reviewPerRating = _i1.ColumnString(
      'reviewPerRating',
      this,
    );
    latitude = _i1.ColumnString(
      'latitude',
      this,
    );
    longitude = _i1.ColumnString(
      'longitude',
      this,
    );
    cid = _i1.ColumnString(
      'cid',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    reviewsLink = _i1.ColumnString(
      'reviewsLink',
      this,
    );
    thumbnail = _i1.ColumnString(
      'thumbnail',
      this,
    );
    timezone = _i1.ColumnString(
      'timezone',
      this,
    );
    priceRange = _i1.ColumnString(
      'priceRange',
      this,
    );
    dataId = _i1.ColumnString(
      'dataId',
      this,
    );
    images = _i1.ColumnString(
      'images',
      this,
    );
    reservations = _i1.ColumnString(
      'reservations',
      this,
    );
    orderOnline = _i1.ColumnString(
      'orderOnline',
      this,
    );
    menu = _i1.ColumnString(
      'menu',
      this,
    );
    owner = _i1.ColumnString(
      'owner',
      this,
    );
    completeAddress = _i1.ColumnString(
      'completeAddress',
      this,
    );
    about = _i1.ColumnString(
      'about',
      this,
    );
    userReviews = _i1.ColumnString(
      'userReviews',
      this,
    );
    emails = _i1.ColumnString(
      'emails',
      this,
    );
  }

  late final _i1.ColumnString inputId;

  late final _i1.ColumnString link;

  late final _i1.ColumnString title;

  late final _i1.ColumnString category;

  late final _i1.ColumnString address;

  late final _i1.ColumnString openHours;

  late final _i1.ColumnString popularTimes;

  late final _i1.ColumnString website;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString plusCode;

  late final _i1.ColumnString reviewCount;

  late final _i1.ColumnString reviewRating;

  late final _i1.ColumnString reviewPerRating;

  late final _i1.ColumnString latitude;

  late final _i1.ColumnString longitude;

  late final _i1.ColumnString cid;

  late final _i1.ColumnString status;

  late final _i1.ColumnString description;

  late final _i1.ColumnString reviewsLink;

  late final _i1.ColumnString thumbnail;

  late final _i1.ColumnString timezone;

  late final _i1.ColumnString priceRange;

  late final _i1.ColumnString dataId;

  late final _i1.ColumnString images;

  late final _i1.ColumnString reservations;

  late final _i1.ColumnString orderOnline;

  late final _i1.ColumnString menu;

  late final _i1.ColumnString owner;

  late final _i1.ColumnString completeAddress;

  late final _i1.ColumnString about;

  late final _i1.ColumnString userReviews;

  late final _i1.ColumnString emails;

  @override
  List<_i1.Column> get columns => [
        id,
        inputId,
        link,
        title,
        category,
        address,
        openHours,
        popularTimes,
        website,
        phone,
        plusCode,
        reviewCount,
        reviewRating,
        reviewPerRating,
        latitude,
        longitude,
        cid,
        status,
        description,
        reviewsLink,
        thumbnail,
        timezone,
        priceRange,
        dataId,
        images,
        reservations,
        orderOnline,
        menu,
        owner,
        completeAddress,
        about,
        userReviews,
        emails,
      ];
}

class ExtractedInclude extends _i1.IncludeObject {
  ExtractedInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Extracted.t;
}

class ExtractedIncludeList extends _i1.IncludeList {
  ExtractedIncludeList._({
    _i1.WhereExpressionBuilder<ExtractedTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Extracted.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Extracted.t;
}

class ExtractedRepository {
  const ExtractedRepository._();

  Future<List<Extracted>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExtractedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExtractedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExtractedTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Extracted>(
      where: where?.call(Extracted.t),
      orderBy: orderBy?.call(Extracted.t),
      orderByList: orderByList?.call(Extracted.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Extracted?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExtractedTable>? where,
    int? offset,
    _i1.OrderByBuilder<ExtractedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExtractedTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Extracted>(
      where: where?.call(Extracted.t),
      orderBy: orderBy?.call(Extracted.t),
      orderByList: orderByList?.call(Extracted.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Extracted?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Extracted>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Extracted>> insert(
    _i1.Session session,
    List<Extracted> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Extracted>(
      rows,
      transaction: transaction,
    );
  }

  Future<Extracted> insertRow(
    _i1.Session session,
    Extracted row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Extracted>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Extracted>> update(
    _i1.Session session,
    List<Extracted> rows, {
    _i1.ColumnSelections<ExtractedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Extracted>(
      rows,
      columns: columns?.call(Extracted.t),
      transaction: transaction,
    );
  }

  Future<Extracted> updateRow(
    _i1.Session session,
    Extracted row, {
    _i1.ColumnSelections<ExtractedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Extracted>(
      row,
      columns: columns?.call(Extracted.t),
      transaction: transaction,
    );
  }

  Future<List<Extracted>> delete(
    _i1.Session session,
    List<Extracted> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Extracted>(
      rows,
      transaction: transaction,
    );
  }

  Future<Extracted> deleteRow(
    _i1.Session session,
    Extracted row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Extracted>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Extracted>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExtractedTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Extracted>(
      where: where(Extracted.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExtractedTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Extracted>(
      where: where?.call(Extracted.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
