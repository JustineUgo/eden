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

  test('Provider should return Ably key ', () async {
    //Arrange
    String key = "my_api_key";
    dynamic data = {"key": key};
    when(
      () => client.get("https://mocki.io/v1/67802b5a-b50b-459a-b812-18c487d6b5ff"),
    ).thenAnswer((_) async => Response(body: data));

    //Act
    final result = await provider.ablyKey();

    //Assert
    verify(() => client.get("https://mocki.io/v1/67802b5a-b50b-459a-b812-18c487d6b5ff"));
    verifyNoMoreInteractions(client);
    expect(result, key);
  });
}
