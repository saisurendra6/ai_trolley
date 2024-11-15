class BillModel {
  final String billId;
  final String datetime;
  final double price;
  final Payment paymentType;

  BillModel(
      {required this.billId,
      required this.datetime,
      required this.price,
      required this.paymentType});

  static BillModel fromJson(Map<String, dynamic> map) {
    return BillModel(
      billId: map['bill_id'] ?? "id",
      datetime: map['datetime'] ?? "datetime",
      price: map['price'] ?? 0,
      paymentType: Payment.upi,
    );
  }

  @override
  String toString() {
    return "id: $billId, datetime: $datetime, price: $price, paymentType: $paymentType";
  }
}

enum Payment { upi, card }
