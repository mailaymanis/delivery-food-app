import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({super.key , required this.hint , required this.controller , required this.validator});
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      clipBehavior: Clip.none,
      width: double.infinity,
      child: TextFormField(
        validator: validator,
        controller: controller,
        clipBehavior: Clip.none,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person , color: Colors.black26,),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Color.fromRGBO(143, 148, 251, 0.6),
                width: 2.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Color.fromRGBO(143, 148, 251, 0.6),
                width: 2.5),
          ),
        ),
      ),
    );
  }
}
