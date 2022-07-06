class MessageData {
  String SenderId = "";
  String ReceiverId = "";
  DateTime TimeSent=DateTime.now();
  DateTime? TimeRecieved;
  DateTime? TimeRead;
  bool? Forworded;
  String MessageText="";
}
