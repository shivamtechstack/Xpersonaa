import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ),
        ),
      ),
    );
  }

}