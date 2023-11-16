import 'package:eden/app/theme/theme.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  RxInt index = RxInt(0);
  RxBool isSwipping = RxBool(false);
  List<String> images = [Images.onboard1, Images.onboard2, Images.onboard3];
  RxString onboardImage = RxString(Images.onboard1);
  Map<int, String> onboardContent = {0: "Order Fast, \nRecieve Quick!", 1: "See It, \nTrack It!", 2: "We are\nHumaans!"};

  void onSwipe({required bool isLeft}) {
    if (isSwipping.value) {
      if (isLeft && index.value != 2) ++index.value;
      if (!isLeft && index.value != 0) --index.value;
      onboardImage(images[index.value]);
    }
    isSwipping(false);
  }
}
