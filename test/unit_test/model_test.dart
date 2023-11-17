import 'package:eden/app/data/model/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EdenOrder order;

  setUp(() {
    order = EdenOrder.fixture();
  });

  group('EdenOrder Model', () {
   String json =  EdenOrder.fixture().toJson();
    test('should be a subclass of EdenOrder', () {
      expect(order, isA<EdenOrder>());
    });

    test('should return EdenOrder when comment json is passed.', () {
      

      //Act
      final result = EdenOrder.fromJson(json);
      //Assert
      expect(result, order);
    });

    test('should return order json object from EdenOrder', () {
      
      //Act
      final result = order.toJson();

      //Assert
      expect(result, json);
    });
  });
}