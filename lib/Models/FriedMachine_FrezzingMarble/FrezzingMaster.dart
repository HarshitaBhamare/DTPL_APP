import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

class FrezzingMaster {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  List<int>? marbleSize;
  String? marbleTemp;
  String? corianThickness;
  String? normalContainer;
  String? coldContainer;
  String? bottle;
  String? coolingStorage;
  int? compressor;
  String? powerSupply;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  FrezzingMaster({
    this.machineImage,
    this.machineType,
    this.machineName,
    this.machineId,
    this.machinePrice,
    this.marbleSize,
    this.marbleTemp,
    this.corianThickness,
    this.normalContainer,
    this.coldContainer,
    this.bottle,
    this.coolingStorage,
    this.compressor,
    this.powerSupply,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory FrezzingMaster.fromJson(Map<String, dynamic> json) {
    return FrezzingMaster(
      machineImage: List<String>.from(json['machineImage']),
      machineType: json['machineType'],
      machineName: json['machineName'],
      machineId: json['machineId'],
      machinePrice: json['machinePrice']?.toDouble(),
      marbleSize: List<int>.from(json['marbleSize']),
      marbleTemp: json['marbleTemp'],
      corianThickness: json['corianThickness'],
      normalContainer: json['normalContainer'],
      coldContainer: json['coldContainer'],
      bottle: json['bottle'],
      coolingStorage: json['coolingStorage'],
      compressor: json['compressor'],
      powerSupply: json['powerSupply'],
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
      'marbleSize': marbleSize,
      'marbleTemp': marbleTemp,
      'corianThickness': corianThickness,
      'normalContainer': normalContainer,
      'coldContainer': coldContainer,
      'bottle': bottle,
      'coolingStorage': coolingStorage,
      'compressor': compressor,
      'powerSupply': powerSupply,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }

  Future<List<FrezzingMaster>> loadThickShakeMachineData() async {
    String data = await rootBundle.loadString('assets/frezzingmaster.json');
    final jsonResult = json.decode(data) as List;
    return jsonResult.map((json) => FrezzingMaster.fromJson(json)).toList();
  }
}

Future<void> uploadMachine(FrezzingMaster machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
