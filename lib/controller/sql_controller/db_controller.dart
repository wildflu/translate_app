

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:translateapp/constants/data.dart';
import 'package:translateapp/repository/translate_repository.dart';

class DBController extends GetxController {

  int ?converId;
  final Translate translateRepositoy = Translate();
  List<Map<String, dynamic>> convers = [] ;
  final DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> convertationMasseges = [];

  navigateToOldConvertation(int id) {
    getAchatMessages(id);
    converId = id;
  }

  getAllData() async {
    convers = await db.getConversations();
  }

  void getAchatMessages(int idConvertation) async {
    convertationMasseges = await db.getMessages(idConvertation);
    update();
  }

  createConvertation(String ms)async {
    int convertationId = await db.insertConversation(ms, DateTime.now().millisecondsSinceEpoch);
    converId = convertationId;
    update();
  }

  translateMassage(String message,isQuestion)async {
    if(converId == null){
      await createConvertation(message);
    }
    await db.insertMessage(converId!, isQuestion, message);
    getAchatMessages(converId!);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }
}