import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget icon;
  final String text;

  const CustomTextField({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
          prefixIcon: Padding(padding: const EdgeInsets.all(15), child: icon),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8)),
          hintText: text,
          hintStyle: TextStyle(
              color: Colors.grey.shade400, fontWeight: FontWeight.normal)),
    );
  }
}

class TextFieldDonate extends StatelessWidget {
  final String text;

  const TextFieldDonate({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15),
        child: TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          scrollPadding: EdgeInsets.only(bottom: 90),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8)),
              hintText: text,
              hintStyle: TextStyle(
                  color: Colors.grey.shade400, fontWeight: FontWeight.normal)),
        ));
  }
}
