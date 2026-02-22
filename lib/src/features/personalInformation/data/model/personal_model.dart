import 'package:equatable/equatable.dart';
import 'package:merova/src/features/personalInformation/domain/entity/personal_entities.dart';

class PersonalModel extends PersonalEntities with EquatableMixin {
   PersonalModel({
    required super.fullName,
    required super.email,
    required super.phone,
    required super.dob,
    required super.gender,
    required super.address,
    required super.citizenshipNumber,
    required super.occupation,
    required super.salutation,
    required super.nationality,
    required super.maritalStatus,
    required super.branch,
    required super.fatherName,
    required super.motherName,
    required super.accountOpenDate,
    required super.actualBalance,
    required super.balance,
    required super.accountType,
    required super.accountStatus,
    required super.accountNumber,
    required super.freezeReason,
    required super.freezeStatus,
  });

  /// FROM JSON (API → APP)
  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    return PersonalModel(
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      citizenshipNumber: json['citizenship_number'] ?? '',
      occupation: json['occupation'] ?? '',
      salutation: json['salutation'] ?? '',
      nationality: json['nationality'] ?? '',
      maritalStatus: json['marital_status'] ?? '',
      branch: json['branch'] ?? '',
      fatherName: json['father_name'] ?? '',
      motherName: json['mother_name'] ?? '',
      accountOpenDate: json['account_open_date'] ?? '',
      actualBalance: json['actual_balance'],
      balance: json['balance'],
      accountType: json['account_type'] ?? '',
      accountStatus: json['account_status'] ?? '',
      accountNumber: json['account_number'] ?? '',
      freezeReason: json['freeze_reason'] ?? '',
      freezeStatus: json['freeze_status'] ?? '',
    );
  }

  /// TO JSON (APP → API)
  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "email": email,
      "phone": phone,
      "dob": dob,
      "gender": gender,
      "address": address,
      "citizenship_number": citizenshipNumber,
      "occupation": occupation,
      "salutation": salutation,
      "nationality": nationality,
      "marital_status": maritalStatus,
      "branch": branch,
      "father_name": fatherName,
      "mother_name": motherName,
      "account_open_date": accountOpenDate,
      "actual_balance": actualBalance,
      "balance": balance,
      "account_type": accountType,
      "account_status": accountStatus,
      "account_number": accountNumber,
      "freeze_reason": freezeReason,
      "freeze_status": freezeStatus,
    };
  }


  /// COPY WITH (BLoC Support)
  PersonalModel copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? dob,
    String? gender,
    String? address,
    String? citizenshipNumber,
    String? occupation,
    String? salutation,
    String? nationality,
    String? maritalStatus,
    String? branch,
    String? fatherName,
    String? motherName,
    String? accountOpenDate,
    double? actualBalance,
    double? balance,
    String? accountType,
    String? accountStatus,
    String? accountNumber,
    String? freezeReason,
    String? freezeStatus,
  }) {
    return PersonalModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      citizenshipNumber: citizenshipNumber ?? this.citizenshipNumber,
      occupation: occupation ?? this.occupation,
      salutation: salutation ?? this.salutation,
      nationality: nationality ?? this.nationality,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      branch: branch ?? this.branch,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      accountOpenDate: accountOpenDate ?? this.accountOpenDate,
      actualBalance: actualBalance ?? this.actualBalance,
      balance: balance ?? this.balance,
      accountType: accountType ?? this.accountType,
      accountStatus: accountStatus ?? this.accountStatus,
      accountNumber: accountNumber ?? this.accountNumber,
      freezeReason: freezeReason ?? this.freezeReason,
      freezeStatus: freezeStatus ?? this.freezeStatus,
    );
  }


  /// SAFE DOUBLE PARSER
  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  /// EQUATABLE PROPS
  @override
  List<Object?> get props => [
    fullName,
    email,
    phone,
    dob,
    gender,
    address,
    citizenshipNumber,
    occupation,
    salutation,
    nationality,
    maritalStatus,
    branch,
    fatherName,
    motherName,
    accountOpenDate,
    actualBalance,
    balance,
    accountType,
    accountStatus,
    accountNumber,
    freezeReason,
    freezeStatus,
  ];
}