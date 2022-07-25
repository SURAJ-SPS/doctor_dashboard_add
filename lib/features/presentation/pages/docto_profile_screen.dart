import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dpm_application/conmmon/refrence.dart';
import 'package:flutter/material.dart';
import '../../../core/util/color_constants.dart';
import '../../../data/model/doctor_contect_model.dart';
import '../widgets/doctor_info_container.dart';
import '../widgets/text_field_widget.dart';
import 'edit_doctor_profile.dart';

class DoctorProfileScreen extends StatefulWidget {
  final DoctorInfoModel doctorInfoModel;
  const DoctorProfileScreen({Key? key, required this.doctorInfoModel})
      : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => DoctorProfileScreenState();
}

class DoctorProfileScreenState extends State<DoctorProfileScreen> {
  String? profileImagePath;
  late DoctorProfileScreenState profileScreenState;
  @override
  void initState() {
    fNameController.text = widget.doctorInfoModel.firstName!;
    lNameController.text = widget.doctorInfoModel.lastName!;
    genderController.text = "Mail";
    contNumController.text = widget.doctorInfoModel.primaryContactNo!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    profileScreenState = this;
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
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => EditDoctorProfile(
                                  doctorInfoModel: widget.doctorInfoModel,
                                  profileScreenState: profileScreenState,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('EDIT PROFILE'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              profileImagePath == null
                  ? CircleAvatar(
                      radius: 30.0,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          height: 50.0,
                          width: 50.0,
                          imageUrl:
                              widget.doctorInfoModel.profilePic.toString(),
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
                      ),
                    ),

              /*CircleAvatar(
                      radius: 30.0,
                      backgroundColor: kGreyColorTint35,
                      backgroundImage: ClipOval(child: Image.file(File(imageFilePath))),

                      */ /*backgroundImage: AssetImage(
                        profileImagePath!,
                      ),*/ /*
                    ),*/
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
                  enabled: false,
                  controller: fNameController,
                  hintText: "First Name",
                  label: "FIRST NAME",
                ),
                TextFieldWidget(
                  enabled: false,
                  controller: lNameController,
                  label: "LAST NAME",
                  hintText: "Last Name",
                ),
                TextFieldWidget(
                  enabled: false,
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
                      enabled: false,
                      controller: dayController,
                    ),
                    DoctorInfoContainer(
                      controller: monthNumController,
                      title: "MONTH",
                      icon: Icons.calendar_month,
                      enabled: false,
                    ),
                    DoctorInfoContainer(
                      controller: yearNumController,
                      title: "YEAR",
                      icon: Icons.calendar_month,
                      enabled: false,
                    ),
                    DoctorInfoContainer(
                      title: "BLOOD GROUP",
                      icon: Icons.monitor_weight,
                      enabled: false,
                      controller: bloodGController,
                    ),
                    DoctorInfoContainer(
                      controller: heightController,
                      title: "HEIGHT",
                      icon: Icons.calendar_month,
                      enabled: false,
                    ),
                    DoctorInfoContainer(
                      controller: weightController,
                      title: "WEIGHT",
                      icon: Icons.calendar_month,
                      enabled: false,
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
