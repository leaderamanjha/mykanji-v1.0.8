import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/home_screen/models/home_model.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current homeModelObj
class HomeController extends GetxController {
  var token = Get.arguments[NavigationArgs.token];

  Rx<HomeModel> homeModelObj = HomeModel().obs;

  Rx<int> sliderIndex = 0.obs;
}
