import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../conmmon/refrence.dart';
import '../data/model/doctor_contect_model.dart';

class HomeRepository {
  Future<List<DoctorInfoModel>?> getDoctorsInfo() async {
    List<DoctorInfoModel> doctorInfoModelList = [];

    try {
      /* Box? doctorBox = await localDataHandler.getDoctorBox();
      int index = 0;*/
      await apiHandler.getAPICall(endPointURL: contacts).then((value) {
        value.forEach((element) {
          DoctorInfoModel _doctorInfoModel = DoctorInfoModel(
            id: element['id'],
            firstName: element['first_name'],
            lastName: element['last_name'],
            profilePic: element['profile_pic'],
            favorite: element['favorite'],
            primaryContactNo: element['primary_contact_no'],
            rating: element['rating'],
            emailAddress: element['email_address'],
            qualification: element['qualification'],
            description: element['description'],
            specialization: element['specialization'],
            languagesKnown: element['languagesKnown'],
          );
          doctorInfoModelList.add(_doctorInfoModel);
          /*if (doctorBox != null) {
            doctorBox.put(index, _doctorInfoModel);
          }
          index += 1;*/
        });
      });

      doctorInfoModelList
          .sort((a, b) => b.rating.toString().compareTo(a.rating.toString()));

      return doctorInfoModelList;
    } catch (e) {
      debugPrint(e.toString());
      return doctorInfoModelList;
    }
  }
}
