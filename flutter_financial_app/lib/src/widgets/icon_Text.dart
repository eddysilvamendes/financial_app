import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconText({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        CircleAvatar(
          radius: 13,
          backgroundColor:const Color.fromARGB(255, 85, 145, 141),
          child: Icon(
            icon,
            color: Colors.white,
            size: 19,
          ),
        ),
       const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color.fromARGB(255, 216, 216, 216),
          ),
        ),
      ],
    );
  }
}
