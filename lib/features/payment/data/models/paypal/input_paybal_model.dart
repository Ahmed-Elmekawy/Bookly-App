class InputPaypalModel {
  final String total;
  final String currency;
  final String description;
  final List<ItemModelInput> items;

  InputPaypalModel({
    required this.total,
    required this.currency,
    this.description="",
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': {
        'total': total,
        'currency': currency,
        'details': {
          'subtotal': total,
          'shipping': "0",
          'shipping_discount': 0,
        },
      },
      'description': description,
      'item_list': {
        'items': items.map((item) => item.toJson()).toList(),
      },
    };
  }
}

class ItemModelInput{
  final String name;
  final int quantity;
  final String price;
  final String currency;

  ItemModelInput({
    this.name="",
    this.quantity=1,
    required this.price,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}
