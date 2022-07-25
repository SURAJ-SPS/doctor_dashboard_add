import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/util/button_constants.dart';
import '../../../core/util/color_constants.dart';
import '../../../data/model/doctor_contect_model.dart';
import '../pages/docto_profile_screen.dart';

class DoctorInFoWidget extends StatelessWidget {
  final DoctorInfoModel doctorInfoModel;
  const DoctorInFoWidget({Key? key, required this.doctorInfoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.only(top: 10, left: 10, right: 20, bottom: 10),
        leading: CircleAvatar(
          radius: 30.0,
          child: ClipOval(
            child: CachedNetworkImage(
              height: 50.0,
              width: 50.0,
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
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          "${doctorInfoModel.firstName} ${doctorInfoModel.lastName}",
          style: const TextStyle(
            color: kPrimaryColorTint100,
            fontSize: 16.0,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            package: 'common_library_package',
          ),
        ),
        subtitle: Column(
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
        trailing: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColour,
          ),
        ),
        onTap: () {
          Navigator.push(
            (context),
            MaterialPageRoute(
              builder: (context) =>
                  DoctorProfileScreen(doctorInfoModel: doctorInfoModel),
            ),
          );
        },
      ),
    );
  }
}
