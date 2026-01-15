import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    final months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
    final revenue = [120, 150, 180, 170, 210, 260];
    final orders = [45, 52, 61, 58, 70, 82];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "KSh 260,000",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Revenue this month",
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 220,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),
                titlesData: FlTitlesData(
                  rightTitles:  AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles:  AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) =>
                          Text("KSh ${value.toInt()}"),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= months.length) return const SizedBox();
                        return Text(months[index]);
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      revenue.length,
                      (i) => FlSpot(i.toDouble(), revenue[i].toDouble()),
                    ),
                    isCurved: true,
                    color: const Color(0xFFFF5C00),
                    barWidth: 3,
                    dotData:  FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF5C00).withOpacity(0.4),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  LineChartBarData(
                    spots: List.generate(
                      orders.length,
                      (i) => FlSpot(i.toDouble(), orders[i].toDouble()),
                    ),
                    isCurved: true,
                    color: const Color(0xFFF49CAC),
                    barWidth: 3,
                    dotData:  FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
