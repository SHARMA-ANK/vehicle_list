import 'package:flutter/material.dart';
class TextInfo extends StatelessWidget {
  const TextInfo({super.key,required this.role, required this
  .value});
  final String role;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Text(role,style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          ),
          const SizedBox(width: 20,),
          Text(value),
        ],
      ),
    );
  }
}
