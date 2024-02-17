import 'package:cloud_firestore/cloud_firestore.dart';

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
  String? powerSupply;
  List<int>? innerDimension;
  List<int>? outerDimension;
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
    this.powerSupply,
    this.innerDimension,
    this.outerDimension,
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
      'machineTankCapacity': machineTankCapacity,
      'heatingRange': heatingRange,
      'coolingRange': coolingRange,
      'machineHeater': machineHeater,
      'starrierRPM': starrierRPM,
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

Future<void> uploadMachine(PastoMagicMachine machine) async {
  await FirebaseFirestore.instance
      .collection('Machines') // Main collection
      .doc(machine.machineType) // Document for each Machine Type
      .collection('Models') // Subcollection under each Machine Type for models
      .doc(machine.machineId.toString()) // Specific machine model document
      .set(machine.toJson()); // Upload machine data
}
