import 'dart:convert';

import 'package:flutter/rendering.dart';

class Incident {
  String name;
  String address;
  String licenseNumber;
  String issueDate;
  String expiryDate;
  String dob;
  String ddref;
  String height;
  String sex;
  String licenseClass;
  String rest;
  String phoneNo;
  String vehicleType;
  String vehicleMake;
  String vehicleModel;
  String vehiclePlate;
  String vehicleYear;
  String vehicleColour;
  String statement;
  String sentiment;
  var dashcamLink = "";

  Incident({
    this.name = "",
    this.address = "",
    this.licenseNumber = "",
    this.issueDate = "",
    this.expiryDate = "",
    this.dob = "",
    this.ddref = "",
    this.height = "",
    this.sex = "",
    this.licenseClass = "",
    this.rest = "",
    this.phoneNo = "",
    this.vehicleType = "",
    this.vehicleMake = "",
    this.vehicleModel = "",
    this.vehiclePlate = "",
    this.vehicleYear = "",
    this.vehicleColour = "",
    this.statement = "",
    this.sentiment = "",
    this.dashcamLink = "",
  });


  factory Incident.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'address': String address,
        'licensenumber': String licenseNumber,
        'issuedate': String issueDate,
        'expirydate': String expiryDate,
        'dob': String dob,
        'ddref': String ddref,
        'height': String height,
        'sex': String sex,
        'licenseclass': String licenseClass,
        'rest': String rest,
      } =>
        Incident(
          name: name,
          address: address,
          licenseNumber: licenseNumber,
          issueDate: issueDate,
          expiryDate: expiryDate,
          dob: dob,
          ddref: ddref,
          height: height,
          sex: sex,
          licenseClass: licenseClass,
          rest: rest,
        ),
      _ => throw const FormatException('Failed to load incident.'),
    };
  }

  void setValues(Map<String, String> incidentData) {
    name = incidentData["name"].toString();
    address = incidentData["address"].toString();
    licenseNumber = incidentData["licenseNumber"].toString();
    issueDate = incidentData["issueDate"].toString();
    expiryDate = incidentData["expiryDate"].toString();
    dob = incidentData["dob"].toString();
    ddref = incidentData["ddref"].toString();
    height = incidentData["height"].toString();
    sex = incidentData["sex"].toString();
    licenseClass = incidentData["licenseClass"].toString();
    rest = incidentData["rest"].toString();
    phoneNo = incidentData["phoneNo"].toString();
    vehicleType = incidentData["vehicleType"].toString();
    vehicleMake = incidentData["vehicleMake"].toString();
    vehicleModel = incidentData["vehicleModel"].toString();
    vehiclePlate = incidentData["vehiclePlate"].toString();
    vehicleYear = incidentData["vehicleYear"].toString();
    vehicleColour = incidentData["vehicleColour"].toString();
    statement = incidentData["statement"].toString();
    sentiment = incidentData["sentiment"].toString();
  }

  String printInfo() {
    return "Name: $name\nAddress: $address\nLicense Number: $licenseNumber\nIssue Date: $issueDate\nExpiry Date: $expiryDate\nDOB: $dob\nDDREF: $ddref\nHeight: $height\nSex: $sex\nLicense Class: $licenseClass\nRest.: $rest\nPhone No.: $phoneNo\nVehicle Type: $vehicleType\nVehicle Make: $vehicleMake\nVehicle Model: $vehicleModel\nVehicle Plate: $vehiclePlate\nVehicle Year: $vehicleYear\nVehicle Colour: $vehicleColour\nStatement: $statement";
  }

  Map<String, String> getIncidentInfo() {
    return {
      'name': name,
      'address': address,
      'licenseNumber': licenseNumber,
      'issueDate': issueDate,
      'expiryDate': expiryDate,
      'dob': dob,
      'ddref': ddref,
      'height': height,
      'sex': sex,
      'licenseClass': licenseClass,
      'rest': rest,
      'phoneNo': phoneNo,
      'vehicleType': vehicleType,
      'vehicleMake': vehicleMake,
      'vehicleModel': vehicleModel,
      'vehiclePlate': vehiclePlate,
      'vehicleYear': vehicleYear,
      'vehicleColour': vehicleColour,
      'statement': statement,
      'sentiment': sentiment,
      'dashcamLink': dashcamLink.toString().replaceAll('"', ''), //.replaceAll(' ', ''),
    };
  }


}

