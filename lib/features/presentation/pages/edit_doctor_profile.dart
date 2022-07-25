import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dpm_application/core/util/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../conmmon/refrence.dart';
import '../../../data/model/doctor_contect_model.dart';
import '../widgets/doctor_info_container.dart';
import '../widgets/text_field_widget.dart';
import 'docto_profile_screen.dart';

class EditDoctorProfile extends StatefulWidget {
  final DoctorProfileScreenState profileScreenState;
  final DoctorInfoModel doctorInfoModel;
  const EditDoctorProfile(
      {Key? key,
      required this.profileScreenState,
      required this.doctorInfoModel})
      : super(key: key);

  @override
  State<EditDoctorProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? profileImagePath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColour,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    color: kPrimaryColour,
                    height: size.height * .14,
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: kAccentColor,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    height: size.height * .12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${fNameController.text} ${lNameController.text}",
                          style: const TextStyle(
                            color: kPrimaryColorTint80,
                            fontSize: 16.0,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.bold,
                            package: 'common_library_package',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('SAVE PROFILE'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  profileImagePath == null
                      ? CircleAvatar(
                          radius: 30.0,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              height: 50.0,
                              width: 50.0,
                              imageUrl:
                                  widget.doctorInfoModel.profilePic.toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.red, BlendMode.colorBurn)),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        )
                      : ClipOval(
                          child: Image.file(
                          height: 60,
                          width: 60,
                          File(profileImagePath!),
                        )),

                  /* CircleAvatar(
                          radius: 30.0,
                          backgroundColor: kGreyColorTint35,
                          backgroundImage: AssetImage(
                            profileImagePath!,
                          )),*/
                  Positioned(
                    height: 20,
                    width: 60,
                    bottom: 0,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.camera_alt_outlined),
                      onPressed: () async {
                        try {
                          image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (image!.path.isNotEmpty) {
                            setState(() {
                              profileImagePath = image!.path;
                            });
                            widget.profileScreenState.setState(() {
                              widget.profileScreenState.profileImagePath =
                                  image!.path;
                            });
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            color: Colors.grey.shade100,
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "PERSONAL DETAILS",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.w700,
                      package: 'common_library_package',
                    ),
                  ),
                ),
                TextFieldWidget(
                  enabled: true,
                  controller: fNameController,
                  hintText: "First Name",
                  label: "FIRST NAME",
                ),
                TextFieldWidget(
                  enabled: true,
                  controller: lNameController,
                  label: "LAST NAME",
                  hintText: "Last Name",
                ),
                TextFieldWidget(
                  enabled: true,
                  controller: genderController,
                  label: "GENDER",
                  hintText: "Gender",
                ),
                TextFieldWidget(
                  enabled: false,
                  controller: contNumController,
                  label: "CONTACT NUMBER",
                  hintText: "Number",
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "DATE OF BIRTH",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.w700,
                      package: 'common_library_package',
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    DoctorInfoContainer(
                      title: "DAY",
                      icon: Icons.calendar_month,
                      enabled: true,
                      controller: dayController,
                    ),
                    DoctorInfoContainer(
                      controller: monthNumController,
                      title: "MONTH",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                    DoctorInfoContainer(
                      controller: yearNumController,
                      title: "YEAR",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                    DoctorInfoContainer(
                      title: "BLOOD GROUP",
                      icon: Icons.monitor_weight,
                      enabled: true,
                      controller: bloodGController,
                    ),
                    DoctorInfoContainer(
                      controller: heightController,
                      title: "HEIGHT",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                    DoctorInfoContainer(
                      controller: weightController,
                      title: "WEIGHT",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
