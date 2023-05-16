import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetXClass extends GetxController{

  final List<Map<String,dynamic>> allplayers=[
    {"name":"sdfsdaf","country":"India"},
    {"name":"asds","country":"Angland"},
    {"name":"fgw","country":"China"},
    {"name":"afsaew","country":"Austrya"},
    {"name":"erfbf","country":"AQSH"},
    {"name":"asd","country":"India"},
    {"name":"rgeg","country":"Angland"},
    {"name":"yluiu","country":"China"},
    {"name":"iotyu","country":"Austrya"},
    {"name":"xcb","country":"AQSH"},
  ];

  Rx<List<Map<String,dynamic>>> foundPlayer=Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    foundPlayer.value=allplayers;
  }

  @override
  void onReady() {
    super.onReady();

  }


  @override
  void onClose() {
    super.onClose();
    void filterPlayer(String playerName){
      List<Map<String,dynamic>> result =[];
      if(playerName.isEmpty){
        result=allplayers;
      }else{
        result = allplayers.where((element) => element["name"].toString().toLowerCase().contains(playerName.toLowerCase())).toList();
      }
      foundPlayer.value = result;
    }
  }
}