import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:eden/app/data/model/model.dart';
import 'package:eden/app/data/provider/provider.dart';
import 'package:eden/app/services/storage_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final EdenProvider provider;
  final StorageService storage;
  HomeController({
    required this.provider,
    required this.storage,
  });

  StreamSubscription<ably.Message>? subscription;
  ably.RealtimeChannel? channel;
  RxList<EdenOrder> orders = RxList<EdenOrder>([]);

  List<EdenOrder> products = [
    EdenOrder(
      id: "100232",
      date: "",
      name: "Men's Soccer Shoes",
      image:
          "https://i5.walmartimages.com/seo/Men-s-Soccer-Shoes-Outdoor-Athletics-Training-Football-Boots-Teenagers-Cleats-Spikes-Shoes-AG-FG_5da6a687-c96f-412d-9f45-24fe291870e9.7eab2c907833594e70813a493554166b.jpeg",
      quantity: 0,
      price: 3399,
    ),
    EdenOrder(
      id: "222453",
      date: "",
      name: "Macbook Pro M2",
      image: "https://www.apple.com/newsroom/images/product/mac/standard/Apple_new-macbookair-wallpaper-screen_11102020_big.jpg.large.jpg",
      quantity: 0,
      price: 95099,
    ),
  ];

  Future<void> connectToAbly() async {
    dynamic response = await provider.getSecrets();
    String key = response["ablyKey"];

    final clientOptions = ably.ClientOptions(key: key);

    ably.Realtime realtime = ably.Realtime(options: clientOptions);
    realtime.connection.on(ably.ConnectionEvent.connected).listen((ably.ConnectionStateChange stateChange) async {
      stateChange;
      channel = realtime.channels.get('eden');
      channel!.on(ably.ChannelEvent.attached).listen((ably.ChannelStateChange stateChange) async {
        stateChange;
        subscription = channel!.subscribe(name: 'order').listen((ably.Message message) async {
          if (message.data != null) {
            EdenOrder order = EdenOrder.fromJson(message.data as String);
            orders.insert(0, order);
          }
        });
      });
      await channel!.attach();
    });
  }

  Future<void> publistOrder({required String id, required String image, required String name, required int price}) async {
    DateTime datetime = DateTime.now();
    String date = "${datetime.day}/${datetime.month}/${datetime.year}   ${datetime.hour}:${datetime.minute}:${datetime.second}";
    await channel?.publish(
      message: ably.Message(
        name: "order",
        data: EdenOrder(id: id, date: date, name: name, image: image, quantity: 1, price: price).toJson(),
      ),
    );
  }

  @override
  void onClose() {
    channel?.detach();
    subscription?.cancel();
    super.onClose();
  }
}
