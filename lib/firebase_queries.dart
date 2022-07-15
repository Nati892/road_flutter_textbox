import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Message/message_model.dart';

import 'Chat/chat_model.dart';
import 'User/user_model.dart';

class Firebase_queries {
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
      FirebaseFirestore firestore, String L1_collection) async {
    var Q = firestore.collection(L1_collection);
    return Q.get();
  }

//In work
//gets all chats with user in them
  Future<QuerySnapshot<Map<String, dynamic>>> get_all_user_chats_collection(
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

    var Chats = Q2;
    Chats.docs.addAll(Q2.docs);

    return Chats;
  }


  List<ChatData> ConvertChatQToList(QuerySnapshot<Map<String, dynamic>> Q) {
    List<ChatData> ChatsList = Q.docs
        .map((e) {
          //filte function that returns a list of the data
          var temp = ChatData(e["user1_Id"], e["user2_Id"]);
          temp.ChatId = e.id;
          return temp;
        })
        .toList()
        .map((e) => e)
        .toList();

    return ChatsList;
  }


//TODO finish!
  // List<ChatData> ConvertChatSToList(Stream<QuerySnapshot<Map<String, dynamic>>> Q) {
  //   List<ChatData> ChatsList = Q.docs
  //       .map((e) {
  //         //filte function that returns a list of the data
  //         var temp = ChatData(e["user1_Id"], e["user2_Id"]);
  //         temp.ChatId = e.id;
  //         return temp;
  //       })
  //       .toList()
  //       .map((e) => e)
  //       .toList();

  //   return ChatsList;
  // }

// **** how to have it as a listenable state??????
  void getAllChatsSnapshot(FirebaseFirestore firestore, String userId) {
    var collectionStream1 = FirebaseFirestore.instance
        .collection('Chats')
        .where("user1_Id", isEqualTo: userId)
        .snapshots();

    var collectionStream2 = FirebaseFirestore.instance
        .collection('Chats')
        .where("user2_Id", isEqualTo: userId)
        .snapshots();

    List<ChatData> a = [];


//TODO make a streamf of combined data that changes by listening to these streams
    // collectionStream1.listen((event) {a.addAll(ConvertChatSToList()))});
    // collectionStream2.listen((event) {});
  }

//works
  Future<void> del_chat(FirebaseFirestore firestore, String chatId) async {
    firestore.collection("Chats").doc(chatId).delete();
  }

//works
  Future<void> create_chat(
      FirebaseFirestore firestore, ChatData chat_data) async {
    firestore.collection("Chats").add({
      "user1": chat_data.user1_Id,
      "user2": chat_data.user2_id,
    });
  }

//works
//used for debug
  Future<void> create_user(
      FirebaseFirestore firestore, UserData userData) async {
    await firestore.collection("users").add({
      "age": userData.age,
      "name": userData.name,
      "email": userData.email,
      "phone_number": userData.phoneNumber,
      "user_type": userData.userType.toString()
    });
  }

//will not work when security rules will apply
  Future<QuerySnapshot<Map<String, dynamic>>> getAllChats(
      FirebaseFirestore firestore, String chatsCollection) async {
    var Q = firestore.collection(chatsCollection);
    return Q.get();
  }

//works
  Future<void> sendMessage(
      FirebaseFirestore firestore, String ChatName, MessageData msg) async {
    msg.TimeSent = DateTime.now();
    await firestore
        .collection("Chats")
        .doc(ChatName)
        .collection("ChatMessages")
        .add({
      "SenderId": msg.SenderId,
      "ReceiverId": msg.ReceiverId,
      "TimeSent": Timestamp.fromDate(msg.TimeSent),
      "TimeReceived": null,
      "TimeRead": null,
      "Forworded": msg.Forworded,
      "MessageText": msg.MessageText
    });
  }

//to test
  Future<QuerySnapshot<Map<String, dynamic>>> GetUpdatedMessages(
      FirebaseFirestore firestore,
      String ChatName,
      DateTime lastMessageTime) async {
    var chat = await firestore
        .collection("Chats")
        .doc(ChatName)
        .collection("ChatMessages")
        .where("TimeSent",
            isGreaterThanOrEqualTo: Timestamp.fromDate(lastMessageTime))
        .get();
    return chat;
  }

//to test
  Future<QuerySnapshot<Map<String, dynamic>>> GetAllMessagesInChat(
    FirebaseFirestore firestore,
    String ChatName,
  ) async {
    var chat = await firestore
        .collection("Chats")
        .doc(ChatName)
        .collection("ChatMessages")
        .get();

    return chat;
  }
}
//queries I need, I receive a reference to a post or document and try to get/set/del the data and also filter
//so...
//user_chats:
//add private chat for each user                        **done**
//get all chats by user in them, del chat, create chat   **done**

//messages: chat reference -> R, RealTime chat chat -> RTR
//R->get all messeges starting from dateTime x,get all messeges
//RTR-> listen to changes, del message, send message.
//Uers: block user (each user as a blackList)
