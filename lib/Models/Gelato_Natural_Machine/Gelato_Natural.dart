import 'package:dtpl_app/Models/Gelato_Natural_Machine/BlasterFrezzer.dart';
import 'package:dtpl_app/Models/Gelato_Natural_Machine/HardeeMachine.dart';
import 'package:dtpl_app/Models/Gelato_Natural_Machine/PastoMagicMachine.dart';

class Gelato_Natural {
  List<BlasterFrezzer>? blasterFrezzers;
  List<HardeeMachine>? hardeeMachines;
  List<PastoMagicMachine>? pastoMagicMachines;

  Gelato_Natural(
      {required this.blasterFrezzers,
      required this.hardeeMachines,
      required this.pastoMagicMachines});
}
