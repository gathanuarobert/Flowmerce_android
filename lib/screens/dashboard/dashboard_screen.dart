import 'package:flutter/material.dart';
import '../../widgets/stats_cards.dart';
import '../../widgets/revenue_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: const [
            SizedBox(height: 16),
            StatsCards(),
            SizedBox(height: 24),
            RevenueChart(),
          ],
        ),
      ),
    );
  }
}
