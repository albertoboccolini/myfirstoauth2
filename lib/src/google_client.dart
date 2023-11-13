import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';

const String _bigQueryBaseUrl = "https://www.googleapis.com/bigquery/v2";

class GoogleClient {
  final AutoRefreshingAuthClient client;

  GoogleClient(this.client);

  Future<Response> getDataset(String project, String dataset) {
    return client.get(
        Uri.parse("$_bigQueryBaseUrl/projects/$project/datasets/$dataset"));
  }
}
