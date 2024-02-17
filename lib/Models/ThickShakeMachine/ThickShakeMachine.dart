import 'package:cloud_firestore/cloud_firestore.dart';

class ThickShakeMachine {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  int? tankCapacity;
  int? hourlyConeOutput;
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
    this.hourlyConeOutput,
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
      hourlyConeOutput: json['hourlyConeOutput'],
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
      'hourlyConeOutput': hourlyConeOutput,
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
}

Future<void> uploadMachine(ThickShakeMachine machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
