import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

class ThickShakeMachine {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  int? tankCapacity;
  String? hourlyOutput;
  String? freezingCylinderCapacity;
  String? machineOverrun;
  String? flavour;
  String? machineRefrigent;
  int? compressor;
  int? motor;
  String? powerSupply;
  List<int>? dimension;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  ThickShakeMachine({
    this.machineImage,
    this.machineType,
    this.machineName,
    this.machineId,
    this.machinePrice,
    this.tankCapacity,
    this.hourlyOutput,
    this.freezingCylinderCapacity,
    this.machineOverrun,
    this.flavour,
    this.machineRefrigent,
    this.compressor,
    this.motor,
    this.powerSupply,
    this.dimension,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory ThickShakeMachine.fromJson(Map<String, dynamic> json) {
    return ThickShakeMachine(
      machineImage: List<String>.from(json['machineImage']),
      machineName: json['machineName'],
      machineType: json['machineType'],
      machineId: json['machineId'],
      machinePrice: json['machinePrice']?.toDouble(),
      tankCapacity: json['tankCapacity'],
      freezingCylinderCapacity: json['freezingCylinderCapacity'],
      hourlyOutput: json['hourlyOutput'],
      machineOverrun: json['machineOverrun'],
      flavour: json['flavour'],
      machineRefrigent: json['machineRefrigent'],
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
      'hourlyOutput': hourlyOutput,
      'machineOverrun': machineOverrun,
      'flavour': flavour,
      'machineRefrigent': machineRefrigent,
      'compressor': compressor,
      'motor': motor,
      'powerSupply': powerSupply,
      'dimension': dimension,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }

  Future<List<ThickShakeMachine>> loadThickShakeMachineData() async {
    String data = await rootBundle.loadString('assets/thickshake.json');
    final jsonResult = json.decode(data) as List;
    return jsonResult.map((json) => ThickShakeMachine.fromJson(json)).toList();
  }
}
