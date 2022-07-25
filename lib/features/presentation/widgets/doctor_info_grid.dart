import 'package:cached_network_image/cached_network_image.dart';
import 'package:dpm_application/data/model/doctor_contect_model.dart';
import 'package:flutter/material.dart';

import '../../../core/util/button_constants.dart';
import '../../../core/util/color_constants.dart';

class DoctorInfoGrid extends StatelessWidget {
  final DoctorInfoModel doctorInfoModel;
  const DoctorInfoGrid({Key? key, required this.doctorInfoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: SizedBox(
        height: size.height * .26,
        width: size.width * .44,
        child: Column(
          children: [
            CachedNetworkImage(
              height: size.height * .17,
              width: size.width * .44,
              imageUrl: doctorInfoModel.profilePic.toString(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.red, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              "${doctorInfoModel.firstName} ${doctorInfoModel.lastName}",
              style: const TextStyle(
                color: kPrimaryColorTint100,
                fontSize: 16.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                package: 'common_library_package',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${doctorInfoModel.specialization}",
                  style: const TextStyle(
                    color: kPrimaryColorTint110,
                    fontSize: 14.0,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "${doctorInfoModel.specialization}",
                  style: kSubtitleCondensedText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
