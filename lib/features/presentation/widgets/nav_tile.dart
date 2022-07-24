import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/util/button_constants.dart';

class NavTile extends StatelessWidget {
  final String? tileIcon;
  final String? tileTitle;
  final Function() onPressed;

  const NavTile(
      {Key? key, this.tileIcon, this.tileTitle, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('$tileIcon, $tileTitle');
    return ListTile(
      leading: SvgPicture.asset(
        tileIcon!,
        height: 40.0,
        width: 40.0,
      ),
      title: Text(
        tileTitle!,
        style: kNavTitleTextStyle,
      ),
      onTap: onPressed,
    );
  }
}
