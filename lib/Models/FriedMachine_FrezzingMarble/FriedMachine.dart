import 'package:cloud_firestore/cloud_firestore.dart';

class FriedMachine {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  String? panSize;
  String? panTemp;
  bool? defrostPedal;
  String? machineContains;
  String? coolingStorage;
  int? compressor;
  String? powerSupply;
  List<int>? dimension;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  FriedMachine({
    this.machineImage,
    this.machineType,
    this.machineName,
    this.machineId,
    this.machinePrice,
    this.panSize,
    this.panTemp,
    this.defrostPedal,
    this.machineContains,
    this.coolingStorage,
    this.compressor,
    this.powerSupply,
    this.dimension,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory FriedMachine.fromJson(Map<String, dynamic> json) {
    return FriedMachine(
      machineImage: List<String>.from(json['machineImage']),
      machineName: json['machineName'],
      machineType: json['machineType'],
      machineId: json['machineId'],
      machinePrice: json['machinePrice']?.toDouble(),
      panSize: json['panSize'],
      panTemp: json['panTemp'],
      defrostPedal: json['defrostPedal'],
      machineContains: json['machineContains'],
      coolingStorage: json['coolingStorage'],
      compressor: json['compressor'],
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
      'panSize': panSize,
      'panTemp': panTemp,
      'defrostPedal': defrostPedal,
      'machineContains': machineContains,
      'coolingStorage': coolingStorage,
      'compressor': compressor,
      'powerSupply': powerSupply,
      'dimension': dimension,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }
}

Future<void> uploadFriedMachine(FriedMachine machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
