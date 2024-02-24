import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

class PastoMagicMachine {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  String? machineTankCapacity;
  String? heatingRange;
  String? coolingRange;
  String? machineHeater;
  int? starrierRPM;
  int? compressor;
  int? motor;
  String? powerSupply;
  List<int>? dimension;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  PastoMagicMachine({
    this.machineImage,
    this.machineType,
    this.machineName,
    this.machineId,
    this.machinePrice,
    this.machineTankCapacity,
    this.heatingRange,
    this.coolingRange,
    this.machineHeater,
    this.starrierRPM,
    this.compressor,
    this.motor,
    this.powerSupply,
    this.dimension,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory PastoMagicMachine.fromJson(Map<String, dynamic> json) {
    return PastoMagicMachine(
      machineImage: List<String>.from(json['machineImage']),
      machineType: json['machineType'],
      machineName: json['machineName'],
      machineId: json['machineId'],
      machinePrice: json['machinePrice']?.toDouble(),
      machineTankCapacity: json['machineTankCapacity'],
      heatingRange: json['heatingRange'],
      coolingRange: json['coolingRange'],
      machineHeater: json['machineHeater'],
      starrierRPM: json['starrierRPM'],
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
      'machineTankCapacity': machineTankCapacity,
      'heatingRange': heatingRange,
      'coolingRange': coolingRange,
      'machineHeater': machineHeater,
      'starrierRPM': starrierRPM,
      'compressor': compressor,
      'motor': motor,
      'powerSupply': powerSupply,
      'innerDimension': dimension,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }

  Future<List<PastoMagicMachine>> loadThickShakeMachineData() async {
    String data = await rootBundle.loadString('assets/pastomagicmachine.json');
    final jsonResult = json.decode(data) as List;
    return jsonResult.map((json) => PastoMagicMachine.fromJson(json)).toList();
  }
}

Future<void> uploadMachine(PastoMagicMachine machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
