

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:translateapp/constants/data.dart';
import 'package:translateapp/repository/translate_repository.dart';

class DBController extends GetxController {

  int ?converId;
  final Translate translateRepositoy = Translate();
  List<Map<String, dynamic>> convers = [] ;
  final DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> convertationMasseges = [];

  navigateToOldConvertation(int id) async{
    await getAchatMessages(id);
    converId = id;
    update();
  }

  getAllData() async {
    convers = await db.getConversations();
  }

  Future<bool> getAchatMessages(int idConvertation) async {
    convertationMasseges = await db.getMessages(idConvertation);
    update();
    return true;
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
    await getAchatMessages(converId!);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }
}