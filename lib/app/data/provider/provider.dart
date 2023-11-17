import 'package:get/get.dart';

class EdenProvider {
  final GetHttpClient client;

  EdenProvider({required this.client});

  Future<String> ablyKey() async {
    final response = await client.get("https://mocki.io/v1/67802b5a-b50b-459a-b812-18c487d6b5ff");
    return response.body['key'];
  }
}
