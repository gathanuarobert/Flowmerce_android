import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        "label": "Total Orders",
        "value": "1,248",
        "change": "+5.2%",
        "up": true,
      },
      {
        "label": "Total Revenue",
        "value": "KSh 2,430,000",
        "change": "+6.3%",
        "up": true,
      },
      {
        "label": "Avg Order Value",
        "value": "KSh 1,948",
        "change": "+2.1%",
        "up": true,
      },
      {
        "label": "Total Products",
        "value": "312",
        "change": "-1.4%",
        "up": false,
      },
    ];

    return SizedBox(
      height: 140,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: stats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final stat = stats[index];

          return Container(
            width: 220,
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
                Text(
                  stat["value"] as String,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  stat["label"] as String,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      stat["up"] as bool
                          ? LucideIcons.arrowUpRight
                          : LucideIcons.arrowDownRight,
                      size: 16,
                      color: stat["up"] as bool
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      stat["change"] as String,
                      style: TextStyle(
                        color: stat["up"] as bool
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "from last week",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
