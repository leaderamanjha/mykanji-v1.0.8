import '../../../core/app_export.dart';

/// This class is used in the [productcard_item_widget] screen.
class ProductcardItemModel {
  ProductcardItemModel({
    this.productTitle,
    this.productPrice,
    this.id,
  }) {
    productTitle = productTitle ?? Rx("Zari Pure Silk ");
    productPrice = productPrice ?? Rx("₹3,500");
    id = id ?? Rx("");
  }

  Rx<String>? productTitle;

  Rx<String>? productPrice;

  Rx<String>? id;
}
