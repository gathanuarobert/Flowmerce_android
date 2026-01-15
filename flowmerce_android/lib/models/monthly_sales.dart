class MonthlySales {
  final List<String> months;
  final List<double> revenue;
  final List<int> orders;

  MonthlySales({
    required this.months,
    required this.revenue,
    required this.orders,
  });

  factory MonthlySales.fromJson(Map<String, dynamic> json) {
    return MonthlySales(
      months: List<String>.from(json['months']),
      revenue: List<double>.from(
        json['total_revenue'].map((e) => e.toDouble()),
      ),
      orders: List<int>.from(json['total_orders']),
    );
  }
}
