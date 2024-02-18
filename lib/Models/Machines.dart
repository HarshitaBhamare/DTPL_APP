
import 'package:dtpl_app/Models/FriedMachine_FrezzingMarble/Frezzing_FriedMachines.dart';
import 'package:dtpl_app/Models/Gelato_Natural_Machine/Gelato_Natural.dart';
import 'package:dtpl_app/Models/SoftMachineModel/SoftyMachine.dart';
import 'package:dtpl_app/Models/ThickShakeMachine/ThickShakeMachine.dart';

class Machines {
  List<SoftyMachine>? softyMachines;
  Frezzing_FriedMachines? frezzingfriedMachines;
  Gelato_Natural? gelatonaturalMachines;
  List<ThickShakeMachine>? thickShakeMachines;

  Machines(
      {required this.softyMachines,
      required this.frezzingfriedMachines,
      required this.gelatonaturalMachines,
      required this.thickShakeMachines});
}


