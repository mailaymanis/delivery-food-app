import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key , required this.hint , required this.controller , required this.validator});
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      clipBehavior: Clip.none,
      width: double.infinity,
      child: TextFormField(
        validator: widget.validator,
        controller:widget.controller ,
        obscureText: hidePassword,
        clipBehavior: Clip.none,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.password , color: Colors.black26,),
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility , color: Colors.black26,),
          ),
          hintText: widget.hint,
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
