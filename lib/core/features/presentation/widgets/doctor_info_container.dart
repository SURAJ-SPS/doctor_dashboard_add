import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorInfoContainer extends StatefulWidget {
  final IconData? icon;
  final String? title;
  final bool enabled;
  final TextEditingController? controller;

  const DoctorInfoContainer({
    Key? key,
    this.title,
    required this.enabled,
    this.controller,
    this.icon,
  }) : super(key: key);

  @override
  State<DoctorInfoContainer> createState() => _DoctorInfoContainerState();
}

class _DoctorInfoContainerState extends State<DoctorInfoContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        color: Colors.white,
        height: size.height * .10,
        width: size.width * .29,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 16,
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      widget.title!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.w400,
                        package: 'common_library_package',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                maxLength: 7,
                textAlign: TextAlign.center,
                enabled: widget.enabled,
                scrollPadding: const EdgeInsets.all(0.0),
                controller: widget.controller,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
