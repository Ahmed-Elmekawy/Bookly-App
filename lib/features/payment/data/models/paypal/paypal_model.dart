class PaypalPayment {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPayment.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] != null ? Amount.fromJson(json['amount']) : null;
    description = json['description'];
    itemList =
        json['item_list'] != null ? ItemList.fromJson(json['item_list']) : null;
  }
}

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    currency = json['currency'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }
}

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingDiscount = json['shipping_discount'];
  }
}

class ItemList {
  List<Items>? items;

  ItemList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }
}
