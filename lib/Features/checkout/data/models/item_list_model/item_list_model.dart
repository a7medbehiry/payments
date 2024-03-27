import 'oreder_item_model.dart';

class ItemListModel {
  List<OrderItemModel>? orderItemModel;

  ItemListModel({this.orderItemModel});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        orderItemModel: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orderItemModel?.map((e) => e.toJson()).toList(),
      };
}
