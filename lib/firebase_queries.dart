import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase_queries {
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
      FirebaseFirestore firestore, String L1_collection) async {
    var Q = firestore.collection(L1_collection);
    return Q.get();
  }

//TODO change user_id to a UserData object and then get the id from the object
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      get_all_user_chats_collection(
          FirebaseFirestore firestore, String user_id) async {
    var Q1 = await firestore
        .collection("Chats")
        .where("User1", isEqualTo: user_id)
        .get();
    var Q2 = await firestore
        .collection("Chats")
        .where("User2", isEqualTo: user_id)
        .get();
    var a = Q1.size;
    a += Q2.size;

    var ChatsList = Q2.docs;
    ChatsList.addAll(Q1.docs);
    ChatsList = ChatsList.toSet().toList();

    return ChatsList;
  }

  Future<void> del_chat(FirebaseFirestore firestore, String chatId) async {
    firestore.collection("Chats").doc(chatId).delete();
  }

  Future<void> create_chat(FirebaseFirestore firestore, String chatId) async {
    //firestore.collection("Chats").add(data); // TODO
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllChats(
      FirebaseFirestore firestore, String L1_collection) async {
    var Q = firestore.collection(L1_collection);
    return Q.get();
  }
}




//queries I need, I receive a reference to a post or document and try to get/set/del the data and also filter
//so...
//user_chats:
//add private chat for each user
//get all chats by user in them, del chat, create chat

//messages: chat reference -> R, RealTime chat chat -> RTR
//R->get all messeges starting from dateTime x,get all messeges
//RTR-> listen to changes, del message, send message. 
//Uers: block user (each user as a blackList)
