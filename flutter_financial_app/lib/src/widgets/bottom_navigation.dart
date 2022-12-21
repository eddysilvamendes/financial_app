import 'package:flutter/material.dart';
import 'package:flutter_financial_app/src/screen/add/add_screen.dart';
import 'package:flutter_financial_app/src/screen/home/homeScreen.dart';
import 'package:flutter_financial_app/src/screen/statics/static_screen.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List Screen = [
    const HomeScreen(),
    const Statistics(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Add_Screen(),
            ),
          );
        },
        backgroundColor: const Color(0xff368983),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationIcon(
                icon: Icons.home,
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                color: index_color == 0 ? const Color(0xff368983) : Colors.grey,
              ),
              NavigationIcon(
                icon: Icons.bar_chart_outlined,
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                color: index_color == 1 ? const Color(0xff368983) : Colors.grey,
              ),
              const SizedBox(width: 20),
              NavigationIcon(
                icon: Icons.account_balance_wallet_outlined,
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                color: index_color == 2 ? const Color(0xff368983) : Colors.grey,
              ),
              NavigationIcon(
                icon: Icons.person_outline,
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                color: index_color == 3 ? const Color(0xff368983) : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const NavigationIcon(
      {Key? key, required this.icon, required this.onTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
    );
  }
}
