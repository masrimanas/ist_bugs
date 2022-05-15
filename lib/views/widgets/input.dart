import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final String labelText;
  final bool isPassword;

  const CustomInput({
    Key? key,
    required this.inputController,
    required this.isPassword,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextFormField(
        controller: inputController,
        onChanged: (value) {},
        keyboardType: TextInputType.emailAddress,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.headline6,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(.75), fontStyle: FontStyle.italic),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black.withOpacity(.1), width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary, width: 1),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.7),
                width: 1),
          ),
        ),
      ),
    );
  }
}
