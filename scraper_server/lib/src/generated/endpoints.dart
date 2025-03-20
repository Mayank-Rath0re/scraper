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
import '../endpoints/email_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/extract_endpoint.dart' as _i4;
import '../endpoints/scrape_endpoint.dart' as _i5;
import 'package:scraper_server/src/generated/db_process.dart' as _i6;
import 'package:scraper_server/src/generated/db_scrapers.dart' as _i7;
import 'package:scraper_server/src/generated/db_email.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'email': _i2.EmailEndpoint()
        ..initialize(
          server,
          'email',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'extract': _i4.ExtractEndpoint()
        ..initialize(
          server,
          'extract',
          null,
        ),
      'scrape': _i5.ScrapeEndpoint()
        ..initialize(
          server,
          'scrape',
          null,
        ),
    };
    connectors['email'] = _i1.EndpointConnector(
      name: 'email',
      endpoint: endpoints['email']!,
      methodConnectors: {
        'retrieveAll': _i1.MethodConnector(
          name: 'retrieveAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['email'] as _i2.EmailEndpoint).retrieveAll(session),
        )
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['extract'] = _i1.EndpointConnector(
      name: 'extract',
      endpoint: endpoints['extract']!,
      methodConnectors: {
        'retrieveAllProcess': _i1.MethodConnector(
          name: 'retrieveAllProcess',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['extract'] as _i4.ExtractEndpoint)
                  .retrieveAllProcess(session),
        ),
        'retrieveSearchQuery': _i1.MethodConnector(
          name: 'retrieveSearchQuery',
          params: {
            'nichePattern': _i1.ParameterDescription(
              name: 'nichePattern',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'locationPattern': _i1.ParameterDescription(
              name: 'locationPattern',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['extract'] as _i4.ExtractEndpoint).retrieveSearchQuery(
            session,
            params['nichePattern'],
            params['locationPattern'],
          ),
        ),
        'retrieveByStatus': _i1.MethodConnector(
          name: 'retrieveByStatus',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['extract'] as _i4.ExtractEndpoint).retrieveByStatus(
            session,
            params['status'],
          ),
        ),
        'prepareExtractData': _i1.MethodConnector(
          name: 'prepareExtractData',
          params: {
            'process': _i1.ParameterDescription(
              name: 'process',
              type: _i1.getType<_i6.DBProcess>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['extract'] as _i4.ExtractEndpoint).prepareExtractData(
            session,
            params['process'],
          ),
        ),
      },
    );
    connectors['scrape'] = _i1.EndpointConnector(
      name: 'scrape',
      endpoint: endpoints['scrape']!,
      methodConnectors: {
        'retrieveQueueCount': _i1.MethodConnector(
          name: 'retrieveQueueCount',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint)
                  .retrieveQueueCount(session),
        ),
        'startNewScrape': _i1.MethodConnector(
          name: 'startNewScrape',
          params: {
            'niche': _i1.ParameterDescription(
              name: 'niche',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'locations': _i1.ParameterDescription(
              name: 'locations',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'mode': _i1.ParameterDescription(
              name: 'mode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).startNewScrape(
            session,
            params['niche'],
            params['locations'],
            mode: params['mode'],
          ),
        ),
        'queueScraper': _i1.MethodConnector(
          name: 'queueScraper',
          params: {
            'scraper': _i1.ParameterDescription(
              name: 'scraper',
              type: _i1.getType<_i7.DBScrapers>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).queueScraper(
            session,
            params['scraper'],
          ),
        ),
        'dashboardData': _i1.MethodConnector(
          name: 'dashboardData',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint)
                  .dashboardData(session),
        ),
        'searchRetrieval': _i1.MethodConnector(
          name: 'searchRetrieval',
          params: {
            'searchId': _i1.ParameterDescription(
              name: 'searchId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).searchRetrieval(
            session,
            params['searchId'],
          ),
        ),
        'retrieveAll': _i1.MethodConnector(
          name: 'retrieveAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).retrieveAll(session),
        ),
        'statusCount': _i1.MethodConnector(
          name: 'statusCount',
          params: {
            'scraperId': _i1.ParameterDescription(
              name: 'scraperId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).statusCount(
            session,
            params['scraperId'],
          ),
        ),
        'interruptScraping': _i1.MethodConnector(
          name: 'interruptScraping',
          params: {
            'scraper': _i1.ParameterDescription(
              name: 'scraper',
              type: _i1.getType<_i7.DBScrapers>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).interruptScraping(
            session,
            params['scraper'],
          ),
        ),
        'fetchExtractedData': _i1.MethodConnector(
          name: 'fetchExtractedData',
          params: {
            'niche': _i1.ParameterDescription(
              name: 'niche',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'location': _i1.ParameterDescription(
              name: 'location',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).fetchExtractedData(
            session,
            params['niche'],
            params['location'],
          ),
        ),
        'startScraping': _i1.MethodConnector(
          name: 'startScraping',
          params: {
            'scraper': _i1.ParameterDescription(
              name: 'scraper',
              type: _i1.getType<_i7.DBScrapers>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).startScraping(
            session,
            params['scraper'],
          ),
        ),
        'prepareCsv': _i1.MethodConnector(
          name: 'prepareCsv',
          params: {
            'niche': _i1.ParameterDescription(
              name: 'niche',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'location': _i1.ParameterDescription(
              name: 'location',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).prepareCsv(
            session,
            params['niche'],
            params['location'],
          ),
        ),
        'retrieveSingleData': _i1.MethodConnector(
          name: 'retrieveSingleData',
          params: {
            'processId': _i1.ParameterDescription(
              name: 'processId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).retrieveSingleData(
            session,
            params['processId'],
          ),
        ),
        'retrieveRar': _i1.MethodConnector(
          name: 'retrieveRar',
          params: {
            'scraperId': _i1.ParameterDescription(
              name: 'scraperId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).retrieveRar(
            session,
            params['scraperId'],
          ),
        ),
        'startVerification': _i1.MethodConnector(
          name: 'startVerification',
          params: {
            'emailObject': _i1.ParameterDescription(
              name: 'emailObject',
              type: _i1.getType<_i8.DBEmail>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).startVerification(
            session,
            params['emailObject'],
          ),
        ),
        'retrieveByStatus': _i1.MethodConnector(
          name: 'retrieveByStatus',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).retrieveByStatus(
            session,
            params['status'],
          ),
        ),
        'retrieveQueue': _i1.MethodConnector(
          name: 'retrieveQueue',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint)
                  .retrieveQueue(session),
        ),
        'pauseProcess': _i1.MethodConnector(
          name: 'pauseProcess',
          params: {
            'scraper': _i1.ParameterDescription(
              name: 'scraper',
              type: _i1.getType<_i7.DBScrapers>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).pauseProcess(
            session,
            params['scraper'],
          ),
        ),
        'retrieveSelected': _i1.MethodConnector(
          name: 'retrieveSelected',
          params: {
            'scraperIds': _i1.ParameterDescription(
              name: 'scraperIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).retrieveSelected(
            session,
            params['scraperIds'],
          ),
        ),
        'stopProcess': _i1.MethodConnector(
          name: 'stopProcess',
          params: {
            'scraper': _i1.ParameterDescription(
              name: 'scraper',
              type: _i1.getType<_i7.DBScrapers>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrape'] as _i5.ScrapeEndpoint).stopProcess(
            session,
            params['scraper'],
          ),
        ),
      },
    );
  }
}
