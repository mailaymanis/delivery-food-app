import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key , required this.text , required this.onPressed});
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  TextButton(
        onPressed:onPressed,
        child:  Text(
          text,
          style: const TextStyle(
            color: Color.fromRGBO(143, 148, 251, 0.6),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ));
  }
}
