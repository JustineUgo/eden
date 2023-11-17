import 'package:get/get.dart';

class EdenProvider {
  final GetHttpClient client;

  EdenProvider({required this.client});

  Future<dynamic> getSecrets() async {
    final response = await client.get("https://mocki.io/v1/2714f856-cb13-49f4-aa4f-3d40b986c626");
    return response.body;
  }
}
