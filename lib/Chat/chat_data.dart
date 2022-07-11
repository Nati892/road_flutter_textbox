class ChatData {
  // DateTime? start_date;
  String ChatId="";
  String user1_Id = "";
  String user2_id = "";
  //need to add reference to chat messages data???
  ChatData(String user1_Id, String user2_Id) {
    this.user1_Id = user1_Id;
    this.user2_id = user2_Id;
  }
}
