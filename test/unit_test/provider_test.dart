import 'package:eden/app/data/provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

class GetHttpClientMock extends Mock implements GetHttpClient {}

void main() {
  late GetHttpClientMock client;
  late EdenProvider provider;

  setUp(() {
    client = GetHttpClientMock();
    provider = EdenProvider(client: client);
  });

  test('Provider should return secrets', () async {
    //Arrange
    String ablyKey = "ably_key";
    String githubSecret = "github_secret";
    String githubClient = "github_client";

    dynamic data = {
      "ablyKey": ablyKey,
      "githubKey": githubSecret,
      "githubClient": githubClient,
    };
    when(
      () => client.get("https://mocki.io/v1/2714f856-cb13-49f4-aa4f-3d40b986c626"),
    ).thenAnswer((_) async => Response(body: data));

    //Act
    final result = await provider.getSecrets();

    //Assert
    verify(() => client.get("https://mocki.io/v1/2714f856-cb13-49f4-aa4f-3d40b986c626"));
    verifyNoMoreInteractions(client);
    expect(result, data);
    expect(result["ablyKey"], ablyKey);
    expect(result["githubKey"], githubSecret);
    expect(result["githubClient"], githubClient);
  });
}
