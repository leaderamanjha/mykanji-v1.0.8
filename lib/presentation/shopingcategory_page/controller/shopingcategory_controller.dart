import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/shopingcategory_page/models/shopingcategory_model.dart';
import 'package:mykanji/data/models/authCategoryGetAll/get_auth_category_get_all_resp.dart';
import 'package:mykanji/data/apiClient/api_client.dart';
import '../models/stackedcardgrid_item_model.dart';

/// A controller class for the ShopingcategoryPage.
///
/// This class manages the state of the ShopingcategoryPage, including the
/// current shopingcategoryModelObj
class ShopingcategoryController extends GetxController {
  ShopingcategoryController(this.shopingcategoryModelObj);

  Rx<ShopingcategoryModel> shopingcategoryModelObj;

  GetAuthCategoryGetAllResp getAuthCategoryGetAllResp =
      GetAuthCategoryGetAllResp();

  /// Calls the https://dull-jade-drill-tutu.cyclic.app/auth/category-getall API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callAuthCategoryGetAll() async {
    try {
      getAuthCategoryGetAllResp =
          await Get.find<ApiClient>().authCategoryGetAll(headers: {
        'Content-type': 'application/json',
        'Authorization': Get.find<PrefUtils>().getToken().toString(),
      });
      _handleAuthCategoryGetAllSuccess();
    } on GetAuthCategoryGetAllResp catch (e) {
      getAuthCategoryGetAllResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleAuthCategoryGetAllSuccess() {
    var stackedcardgridItemModelList = <StackedcardgridItemModel>[];
    for (var element in getAuthCategoryGetAllResp.data ?? []) {
      var stackedcardgridItemModel = StackedcardgridItemModel();
      stackedcardgridItemModel.titleText?.value = element.categoryName ?? '';
      stackedcardgridItemModelList.add(stackedcardgridItemModel);
    }
    shopingcategoryModelObj.value.stackedcardgridItemList.value =
        stackedcardgridItemModelList;
  }

  /// calls the [https://dull-jade-drill-tutu.cyclic.app/auth/category-getall] API
  ///
  /// It has [GetAuthCategoryGetAllReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onAuthCategoryGetAllSuccess()` function.
  /// If the call fails, the function calls the `_onAuthCategoryGetAllError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  @override
  Future<void> onReady() async {
    try {
      await callAuthCategoryGetAll();
      _onAuthCategoryGetAllSuccess();
    } on GetAuthCategoryGetAllResp {
      _onAuthCategoryGetAllError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onAuthCategoryGetAllSuccess() {}
  void _onAuthCategoryGetAllError() {}
}
