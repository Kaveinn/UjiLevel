import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final void Function()? onTap;

  const MyButton({super.key, 
  required this.onTap, required child,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: 
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          ),
        padding: const EdgeInsets.all(25),
        child: Text(
          'GET STARTED',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}