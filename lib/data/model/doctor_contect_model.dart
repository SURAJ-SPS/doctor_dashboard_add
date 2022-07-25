import 'package:hive/hive.dart';
part 'doctor_contect_model.g.dart';

@HiveType(typeId: 1)
class DoctorInfoModel {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? profilePic;
  @HiveField(5)
  bool? favorite;
  @HiveField(6)
  String? primaryContactNo;
  @HiveField(7)
  String? rating;
  @HiveField(8)
  String? emailAddress;
  @HiveField(9)
  String? qualification;
  @HiveField(10)
  String? description;
  @HiveField(11)
  String? specialization;
  @HiveField(12)
  String? languagesKnown;

  DoctorInfoModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.profilePic,
      this.favorite,
      this.primaryContactNo,
      this.rating,
      this.emailAddress,
      this.qualification,
      this.description,
      this.specialization,
      this.languagesKnown});

  DoctorInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePic = json['profile_pic'];
    favorite = json['favorite'];
    primaryContactNo = json['primary_contact_no'];
    rating = json['rating'];
    emailAddress = json['email_address'];
    qualification = json['qualification'];
    description = json['description'];
    specialization = json['specialization'];
    languagesKnown = json['languagesKnown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_pic'] = profilePic;
    data['favorite'] = favorite;
    data['primary_contact_no'] = primaryContactNo;
    data['rating'] = rating;
    data['email_address'] = emailAddress;
    data['qualification'] = qualification;
    data['description'] = description;
    data['specialization'] = specialization;
    data['languagesKnown'] = languagesKnown;
    return data;
  }
}
