import '../../../core/app_export.dart';

/// This class is used in the [stackedcardgrid_item_widget] screen.
class StackedcardgridItemModel {
  StackedcardgridItemModel({
    this.titleText,
    this.subheadText,
    this.id,
  }) {
    titleText = titleText ?? Rx("Sarees");
    subheadText = subheadText ?? Rx("225 Products");
    id = id ?? Rx("");
  }

  Rx<String>? titleText;

  Rx<String>? subheadText;

  Rx<String>? id;
}
