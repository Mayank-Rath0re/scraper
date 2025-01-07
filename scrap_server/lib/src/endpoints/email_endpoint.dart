import 'package:scrap_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class EmailEndpoint extends Endpoint {
  // Function to retrieve all existing Email Verification Process
  Future<List<DBEmail>> retrieveAll(Session session) async {
    List<DBEmail> verifData = await DBEmail.db.find(session);
    return verifData;
  }
}
