import 'package:flutter/material.dart';

import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/products/products_screen.dart';
import '../../screens/orders/order_screen.dart';
import '../../screens/analytics/analytics_screen.dart';
import '../../screens/assistant/assistant_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    ProductsScreen(),
    OrdersScreen(),
    AnalyticsScreen(),
    AssistantScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// Animated icon builder for bottom navigation
  Widget _buildNavIcon({
    required IconData icon,
    required int index,
  }) {
    final bool isActive = _currentIndex == index;

    return AnimatedScale(
      scale: isActive ? 1.2 : 1.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showLabels =
        MediaQuery.of(context).size.width >= 360;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,

              selectedItemColor: const Color(0xFFFF5C00),
              unselectedItemColor: Colors.grey.shade400,

              showSelectedLabels: showLabels,
              showUnselectedLabels: showLabels,

              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),

              items: [
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    icon: Icons.home_outlined,
                    index: 0,
                  ),
                  activeIcon: _buildNavIcon(
                    icon: Icons.home,
                    index: 0,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    icon: Icons.inventory_2_outlined,
                    index: 1,
                  ),
                  activeIcon: _buildNavIcon(
                    icon: Icons.inventory_2,
                    index: 1,
                  ),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    icon: Icons.receipt_long_outlined,
                    index: 2,
                  ),
                  activeIcon: _buildNavIcon(
                    icon: Icons.receipt_long,
                    index: 2,
                  ),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    icon: Icons.show_chart_outlined,
                    index: 3,
                  ),
                  activeIcon: _buildNavIcon(
                    icon: Icons.show_chart,
                    index: 3,
                  ),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(
                    icon: Icons.smart_toy_outlined,
                    index: 4,
                  ),
                  activeIcon: _buildNavIcon(
                    icon: Icons.smart_toy,
                    index: 4,
                  ),
                  label: 'AI Assistant',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
