import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? label;
  final bool enabled;
  final TextEditingController? controller;
  const TextFieldWidget(
      {Key? key,
      this.hintText,
      this.label,
      this.controller,
      required this.enabled})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(
          top: 15,
          left: 10,
          right: 10,
        ),
        height: size.height * .11,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w500,
                package: 'common_library_package',
              ),
            ),
            TextField(
              enabled: widget.enabled,
              scrollPadding: const EdgeInsets.all(0.0),
              controller: widget.controller,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
