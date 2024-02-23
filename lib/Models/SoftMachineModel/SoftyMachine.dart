import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

class SoftyMachine {
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
  int? rippleSyrupFlavours;
  String? refrigerant;
  int? compressor;
  int? motor;
  String? powerSupply;
  List<int>? dimension;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  SoftyMachine({
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
    this.rippleSyrupFlavours,
    this.refrigerant,
    this.compressor,
    this.motor,
    this.powerSupply,
    this.dimension,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory SoftyMachine.fromJson(Map<String, dynamic> json) {
    return SoftyMachine(
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
      rippleSyrupFlavours: json['rippleSyrupFlavours'],
      refrigerant: json['refrigerant'],
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
      'rippleSyrupFlavours': rippleSyrupFlavours,
      'refrigerant': refrigerant,
      'compressor': compressor,
      'motor': motor,
      'powerSupply': powerSupply,
      'dimension': dimension,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }

  Future<List<SoftyMachine>> loadThickShakeMachineData() async {
    String data = await rootBundle.loadString('assets/softymachine.json');
    final jsonResult = json.decode(data) as List;
    return jsonResult.map((json) => SoftyMachine.fromJson(json)).toList();
  }
}

Future<void> uploadMachine(SoftyMachine machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
