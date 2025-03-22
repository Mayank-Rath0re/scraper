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
import 'dart:async' as _i2;
import 'package:scraper_client/src/protocol/db_email.dart' as _i3;
import 'package:scraper_client/src/protocol/db_process.dart' as _i4;
import 'package:scraper_client/src/protocol/db_scrapers.dart' as _i5;
import 'dart:typed_data' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointEmail extends _i1.EndpointRef {
  EndpointEmail(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'email';

  _i2.Future<List<_i3.DBEmail>> retrieveAll() =>
      caller.callServerEndpoint<List<_i3.DBEmail>>(
        'email',
        'retrieveAll',
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointExtract extends _i1.EndpointRef {
  EndpointExtract(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'extract';

  _i2.Future<List<_i4.DBProcess>> retrieveAllProcess() =>
      caller.callServerEndpoint<List<_i4.DBProcess>>(
        'extract',
        'retrieveAllProcess',
        {},
      );

  _i2.Future<List<_i4.DBProcess>> retrieveSearchQuery(
    String nichePattern,
    String locationPattern,
  ) =>
      caller.callServerEndpoint<List<_i4.DBProcess>>(
        'extract',
        'retrieveSearchQuery',
        {
          'nichePattern': nichePattern,
          'locationPattern': locationPattern,
        },
      );

  _i2.Future<List<_i4.DBProcess>> retrieveByStatus(String status) =>
      caller.callServerEndpoint<List<_i4.DBProcess>>(
        'extract',
        'retrieveByStatus',
        {'status': status},
      );

  _i2.Future<void> prepareExtractData(_i4.DBProcess process) =>
      caller.callServerEndpoint<void>(
        'extract',
        'prepareExtractData',
        {'process': process},
      );
}

/// {@category Endpoint}
class EndpointScrape extends _i1.EndpointRef {
  EndpointScrape(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'scrape';

  _i2.Future<int> retrieveQueueCount() => caller.callServerEndpoint<int>(
        'scrape',
        'retrieveQueueCount',
        {},
      );

  _i2.Future<void> startNewScrape(
    List<String> niche,
    List<String> locations, {
    required String mode,
  }) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'startNewScrape',
        {
          'niche': niche,
          'locations': locations,
          'mode': mode,
        },
      );

  _i2.Future<void> queueScraper(_i5.DBScrapers scraper) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'queueScraper',
        {'scraper': scraper},
      );

  _i2.Future<List<int>> dashboardData() => caller.callServerEndpoint<List<int>>(
        'scrape',
        'dashboardData',
        {},
      );

  _i2.Future<List<_i5.DBScrapers>> searchRetrieval(int searchId) =>
      caller.callServerEndpoint<List<_i5.DBScrapers>>(
        'scrape',
        'searchRetrieval',
        {'searchId': searchId},
      );

  _i2.Future<List<_i5.DBScrapers>> retrieveAll() =>
      caller.callServerEndpoint<List<_i5.DBScrapers>>(
        'scrape',
        'retrieveAll',
        {},
      );

  _i2.Future<int> statusCount(int scraperId) => caller.callServerEndpoint<int>(
        'scrape',
        'statusCount',
        {'scraperId': scraperId},
      );

  _i2.Future<void> interruptScraping(_i5.DBScrapers scraper) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'interruptScraping',
        {'scraper': scraper},
      );

  _i2.Future<void> fetchExtractedData(
    String niche,
    String location,
  ) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'fetchExtractedData',
        {
          'niche': niche,
          'location': location,
        },
      );

  _i2.Future<void> startScraping(_i5.DBScrapers scraper) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'startScraping',
        {'scraper': scraper},
      );

  _i2.Future<void> prepareCsv(
    String niche,
    String location,
  ) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'prepareCsv',
        {
          'niche': niche,
          'location': location,
        },
      );

  _i2.Future<_i6.ByteData?> retrieveSingleData(int? processId) =>
      caller.callServerEndpoint<_i6.ByteData?>(
        'scrape',
        'retrieveSingleData',
        {'processId': processId},
      );

  _i2.Future<_i6.ByteData?> retrieveRar(int? scraperId) =>
      caller.callServerEndpoint<_i6.ByteData?>(
        'scrape',
        'retrieveRar',
        {'scraperId': scraperId},
      );

  _i2.Future<void> startVerification(_i3.DBEmail emailObject) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'startVerification',
        {'emailObject': emailObject},
      );

  _i2.Future<void> deleteScraper(int scraperId) =>
      caller.callServerEndpoint<void>(
        'scrape',
        'deleteScraper',
        {'scraperId': scraperId},
      );

  _i2.Future<List<_i5.DBScrapers>> retrieveByStatus(String? status) =>
      caller.callServerEndpoint<List<_i5.DBScrapers>>(
        'scrape',
        'retrieveByStatus',
        {'status': status},
      );

  _i2.Future<List<_i5.DBScrapers>> retrieveQueue() =>
      caller.callServerEndpoint<List<_i5.DBScrapers>>(
        'scrape',
        'retrieveQueue',
        {},
      );

  _i2.Future<int> pauseProcess(_i5.DBScrapers scraper) =>
      caller.callServerEndpoint<int>(
        'scrape',
        'pauseProcess',
        {'scraper': scraper},
      );

  _i2.Future<List<_i5.DBScrapers>> retrieveSelected(List<int> scraperIds) =>
      caller.callServerEndpoint<List<_i5.DBScrapers>>(
        'scrape',
        'retrieveSelected',
        {'scraperIds': scraperIds},
      );

  _i2.Future<int> stopProcess(_i5.DBScrapers scraper) =>
      caller.callServerEndpoint<int>(
        'scrape',
        'stopProcess',
        {'scraper': scraper},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    email = EndpointEmail(this);
    example = EndpointExample(this);
    extract = EndpointExtract(this);
    scrape = EndpointScrape(this);
  }

  late final EndpointEmail email;

  late final EndpointExample example;

  late final EndpointExtract extract;

  late final EndpointScrape scrape;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'email': email,
        'example': example,
        'extract': extract,
        'scrape': scrape,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
