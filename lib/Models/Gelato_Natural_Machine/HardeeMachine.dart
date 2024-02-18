import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

class HardeeMachine {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  int? cyclinderCapacity;
  int? hourlyOutput;
  String? flavour;
  int? batchCapacity;
  String? machineOverrun;
  String? machineRerigerant;
  int? compressor;
  int? motor;
  String? powerSupply;
  List<int>? dimension;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  HardeeMachine({
    this.machineImage,
    this.machineType,
    this.machineName,
    this.machineId,
    this.machinePrice,
    this.cyclinderCapacity,
    this.hourlyOutput,
    this.flavour,
    this.batchCapacity,
    this.machineOverrun,
    this.machineRerigerant,
    this.compressor,
    this.motor,
    this.powerSupply,
    this.dimension,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory HardeeMachine.fromJson(Map<String, dynamic> json) {
    return HardeeMachine(
      machineImage: List<String>.from(json['machineImage']),
      machineType: json['machineType'],
      machineName: json['machineName'],
      machineId: json['machineId'],
      machinePrice: json['machinePrice']?.toDouble(),
      cyclinderCapacity: json['cyclinderCapacity'],
      hourlyOutput: json['hourlyOutput'],
      flavour: json['flavour'],
      batchCapacity: json['batchCapacity'],
      machineOverrun: json['machineOverrun'],
      machineRerigerant: json['machineRerigerant'],
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
      'machineType': machineType,
      'machineName': machineName,
      'machineId': machineId,
      'machinePrice': machinePrice,
      'cyclinderCapacity': cyclinderCapacity,
      'hourlyOutput': hourlyOutput,
      'flavour': flavour,
      'batchCapacity': batchCapacity,
      'machineOverrun': machineOverrun,
      'machineRerigerant': machineRerigerant,
      'compressor': compressor,
      'motor': motor,
      'powerSupply': powerSupply,
      'dimension': dimension,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }

  Future<List<HardeeMachine>> loadThickShakeMachineData() async {
    String data = await rootBundle.loadString('assets/hardeemachine.json');
    final jsonResult = json.decode(data) as List;
    return jsonResult.map((json) => HardeeMachine.fromJson(json)).toList();
  }
}

Future<void> uploadMachine(HardeeMachine machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
