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

abstract class Extracted implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
