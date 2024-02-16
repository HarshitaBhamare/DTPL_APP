// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MachineModel {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  int? tankCapacity;
  String? freezingCylinderCapacity;
  int? hourlyConeOutput;
  String? machineOverrun;
  int? regularFlavour;
  int? mixFlavour;
  int? compressor;
  int? motor;
  String? powerSupply;
  List<int>? dimension;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  MachineModel({
    this.machineImage,
    this.machineName,
    this.machineType,
    this.machineId,
    this.machinePrice,
    this.tankCapacity,
    this.freezingCylinderCapacity,
    this.hourlyConeOutput,
    this.machineOverrun,
    this.regularFlavour,
    this.mixFlavour,
    this.compressor,
    this.motor,
    this.powerSupply,
    this.dimension,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory MachineModel.fromJson(Map<String, dynamic> json) {
    return MachineModel(
      machineImage: List<String>.from(json['machineImage']),
      machineName: json['machineName'],
      machineType: json['machineType'],
      machineId: json['machineId'],
      machinePrice: json['machinePrice']?.toDouble(),
      tankCapacity: json['tankCapacity'],
      freezingCylinderCapacity: json['freezingCylinderCapacity'],
      hourlyConeOutput: json['hourlyConeOutput'],
      machineOverrun: json['machineOverrun'],
      regularFlavour: json['regularFlavour'],
      mixFlavour: json['mixFlavour'],
      compressor: json['compressor'],
      motor: json['motor'],
      powerSupply: json['powerSupply'],
      dimension: List<int>.from(json['dimension']),
      GST: json['GST'],
      isPackingIncl: json['isPackingIncl'],
      isTransportationIncl: json['isTransportationIncl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'machineImage': machineImage,
      'machineName': machineName,
      'machineType': machineType,
      'machineId': machineId,
      'machinePrice': machinePrice,
      'tankCapacity': tankCapacity,
      'freezingCylinderCapacity': freezingCylinderCapacity,
      'hourlyConeOutput': hourlyConeOutput,
      'machineOverrun': machineOverrun,
      'regularFlavour': regularFlavour,
      'mixFlavour': mixFlavour,
      'compressor': compressor,
      'motor': motor,
      'powerSupply': powerSupply,
      'dimension': dimension,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }
}

Future<void> uploadMachine(MachineModel machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
