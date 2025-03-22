import 'package:scraper_server/src/generated/db_email.dart';
import 'package:serverpod/serverpod.dart';

class EmailEndpoint extends Endpoint {
  // Function to retrieve all existing Email Verification Process
  Future<List<DBEmail>> retrieveAll(Session session,
      {int limit = 30, int offset = 0}) async {
    List<DBEmail> verifData =
        await DBEmail.db.find(session, limit: limit, offset: offset);
    return verifData;
  }

  Future<List<DBEmail>> retrieveSelected(
      Session session, List<int> emailIds) async {
    Set<int> ids = {...emailIds};
    List<DBEmail> emails =
        await DBEmail.db.find(session, where: (t) => t.id.inSet(ids));
    return emails;
  }
}
