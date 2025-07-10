class BillItem {
  final String trolleyId;
  final List<dynamic> billItems;
  final double price;
  final String time;

  BillItem({
    required this.time,
    required this.trolleyId,
    required this.billItems,
    required this.price,
  });

  static BillItem fromJson(Map<String, dynamic> map) {
    print(map);
    return BillItem(
      trolleyId: map['trolley_id'] ?? "t id",
      billItems: map['items'],
      price: map['price'] ?? 0,
      time: map['time'] ?? "time",
    );
  }

  @override
  String toString() {
    return "bill_id : $trolleyId,  billItems: ${billItems.toString()}, price: $price, time: $time";
  }
}
