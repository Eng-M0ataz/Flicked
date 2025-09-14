import 'package:flutter/material.dart';

class CustomBackGroundContainer extends StatelessWidget {
  const CustomBackGroundContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });
  final Widget child;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12.withOpacity(0.5),
      ),
      child: child,
    );
  }
}
