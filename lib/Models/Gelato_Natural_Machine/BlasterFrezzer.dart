import 'package:cloud_firestore/cloud_firestore.dart';

class BlasterFrezzer {
  List<String>? machineImage;
  String? machineType;
  String? machineName;
  int? machineId;
  double? machinePrice;
  String? machineCapacity;
  String? machineChillingCapacity;
  String? machineFreezingCapacity;
  int? compressor;
  String? powerSupply;
  List<int>? innerDimension;
  List<int>? outerDimension;
  int? GST;
  bool? isPackingIncl;
  bool? isTransportationIncl;

  BlasterFrezzer({
    this.machineImage,
    this.machineType,
    this.machineName,
    this.machineId,
    this.machinePrice,
    this.machineCapacity,
    this.machineChillingCapacity,
    this.machineFreezingCapacity,
    this.compressor,
    this.powerSupply,
    this.innerDimension,
    this.outerDimension,
    this.GST,
    this.isPackingIncl,
    this.isTransportationIncl,
  });

  factory BlasterFrezzer.fromJson(Map<String, dynamic> json) {
    return BlasterFrezzer(
      machineImage: List<String>.from(json['machineImage']),
      machineType: json['machineType'],
      machineName: json['machineName'],
      machineId: json['machineId'],
      machinePrice: json['machinePrice']?.toDouble(),
      machineCapacity: json['machineCapacity'],
      machineChillingCapacity: json['machineChillingCapacity'],
      machineFreezingCapacity: json['machineFreezingCapacity'],
      compressor: json['compressor'],
      powerSupply: json['powerSupply'],
      innerDimension: List<int>.from(json['innerDimension']),
      outerDimension: List<int>.from(json['outerDimension']),
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
      'machineCapacity': machineCapacity,
      'machineChillingCapacity': machineChillingCapacity,
      'machineFreezingCapacity': machineFreezingCapacity,
      'compressor': compressor,
      'powerSupply': powerSupply,
      'innerDimension': innerDimension,
      'outerDimension': outerDimension,
      'GST': GST,
      'isPackingIncl': isPackingIncl,
      'isTransportationIncl': isTransportationIncl,
    };
  }
}

Future<void> uploadMachine(BlasterFrezzer machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
