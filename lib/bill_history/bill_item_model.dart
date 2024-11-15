class BillItemModel {
  final String item;
  final String time;
  final double price;

  BillItemModel({required this.item, required this.time, required this.price});

  static BillItemModel fromJson(Map<String, dynamic> map) {
    return BillItemModel(
      item: map['item'] ?? 'item',
      time: map['time'] ?? 'time',
      price: map['price'] ?? 10.0,
    );
  }

  @override
  String toString() {
    return "item: $item, time: $time, price: $price";
  }
}
