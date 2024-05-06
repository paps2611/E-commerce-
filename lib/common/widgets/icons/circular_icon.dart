import 'package:flutter/material.dart';

class HeartIcon extends StatelessWidget {
  final Color borderColor;
  final Color insideColor;
  final double size;
  final IconData icon;
  final VoidCallback? onPressed;

  const HeartIcon({
    Key? key,
    required this.borderColor,
    required this.insideColor,
    required this.size,
    this.onPressed, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Stack(
        children: [
          // Heart border icon
          Icon(
            icon,
            color: borderColor,
            size: size,
          ),
          // Heart shape icon
          Icon(
            icon,
            color: insideColor,
            size: size,
          ),
        ],
      ),
    );
  }
}
