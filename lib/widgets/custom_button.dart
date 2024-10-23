import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key , required this.onPressed , required this.text});
  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      clipBehavior: Clip.none,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
              const Color.fromRGBO(143, 148, 251, 0.6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed:onPressed,
          child:  Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Colors.white),
          )),
    );
  }
}
