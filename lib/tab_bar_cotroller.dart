import 'package:get/get.dart';

class TabBarController extends GetxController {
  var index = 1.obs;

  setIndex(val) => index.value = val;
  getIndex() => index;
}