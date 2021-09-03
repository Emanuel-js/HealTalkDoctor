import 'index.dart';

class adminmessage {
  String message;
  String datesent;
  String messagetype;
  adminmessage(
      {@required this.message,
      @required this.datesent,
      @required this.messagetype});
}

List<adminmessage> msglist = [
  adminmessage(
      message:
          "hello we have seen your docs and you are required to complete..hello we have seen your docs and you are required to complete..",
      datesent: "10:26",
      messagetype: "Warning"),
  adminmessage(
      message: "your documents are being reviewed..",
      datesent: "5:26",
      messagetype: "Normal"),
  adminmessage(
      message: "you are the", datesent: "11:26", messagetype: "Normal"),
  adminmessage(
      message: "your name is not correct",
      datesent: "1:26",
      messagetype: "Normal"),
  adminmessage(
      message:
          "hello we have seen your docs and you are required to complete..",
      datesent: "2:26",
      messagetype: "Warning"),
  adminmessage(
      message: "you are the", datesent: "11:26", messagetype: "Warning"),
  adminmessage(
      message: "your name is not correct",
      datesent: "1:26",
      messagetype: "Warning"),
  adminmessage(
      message: "you are the", datesent: "11:26", messagetype: "Warning"),
  adminmessage(
      message: "your name is not correct",
      datesent: "1:26",
      messagetype: "Warning"),
  adminmessage(
      message: "you are the", datesent: "11:26", messagetype: "Warning"),
  adminmessage(
      message: "your name is not correct",
      datesent: "1:26",
      messagetype: "Warning"),
];

//////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
class DrList {
  String Name;
  String Description;
  int ID;
  String img;
  String Email;
  int Phone;
  String Address;
  DrList(
      {this.Name,
      this.Description,
      this.ID,
      this.img,
      this.Address,
      this.Email,
      this.Phone});
}

List<DrList> Drlist = [
  DrList(
      Name: "Dr. Natnael",
      Description: "Psychiologist and Internist",
      ID: 1,
      img: "assets/images/Human.jpeg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Amanuel",
      Description: "Mental disorder",
      ID: 2,
      img: "assets/images/Human2.jpg",
      Email: "Amanuel@gmail.com",
      Phone: 09491211,
      Address: "CMC,AddisAbaba"),
  DrList(
      Name: "Dr. Yoseph",
      Description: "Psychiologist",
      ID: 3,
      img: "assets/images/Human3.jpg",
      Email: "Yoseph@gmail.com",
      Phone: 09881211,
      Address: "Sumit,AddisAbaba"),
  DrList(
      Name: "Dr. Samuel",
      Description: "Psychiatrist",
      ID: 69349,
      img: "assets/images/Human4.jpg",
      Email: "Samuel@gmail.com",
      Phone: 09256662,
      Address: "Tulu-Dimtu,AddisAbaba"),
  DrList(
      Name: "Dr. Natnael",
      Description: "Psychiologist and Internist",
      ID: 4,
      img: "assets/images/Human5.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Amanuel",
      Description: "Mental disorder",
      ID: 5,
      img: "assets/images/Human6.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Yoseph",
      Description: "Psychiologist",
      ID: 6,
      img: "assets/images/Human2.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Samuel",
      Description: "Psychiatrist",
      ID: 7,
      img: "assets/images/Human3.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Natnael",
      Description: "Psychiologist and Internist",
      ID: 8,
      img: "assets/images/Human4.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Amanuel",
      Description: "Mental disorder",
      ID: 9,
      img: "assets/images/Human6.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Yoseph",
      Description: "Psychiologist",
      ID: 10,
      img: "assets/images/Human3.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Samuel",
      Description: "Psychiatrist",
      ID: 11,
      img: "assets/images/Human2.jpg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Natnael",
      Description: "Psychiologist and Internist",
      ID: 12,
      img: "assets/images/Human.jpeg",
      Email: "Natnael@gmail.com",
      Phone: 09351211,
      Address: "GurdShola,AddisAbaba"),
  DrList(
      Name: "Dr. Amanuel",
      Description: "Mental disorder",
      ID: 13,
      img: "assets/images/Human2.jpg",
      Email: "Amanuel@gmail.com",
      Phone: 09491211,
      Address: "CMC,AddisAbaba"),
  DrList(
      Name: "Dr. Yoseph",
      Description: "Psychiologist",
      ID: 14,
      img: "assets/images/Human3.jpg",
      Email: "Yoseph@gmail.com",
      Phone: 09881211,
      Address: "Sumit,AddisAbaba"),
];

////////////////////////////////////////////////////////
//////////////////////////////////////////////////////

class ChatMessage {
  int patientid;
  String messageContent;
  String messageType;
  ChatMessage(
      {@required this.messageContent,
      @required this.messageType,
      this.patientid});
}

List<ChatMessage> messages = [
  ChatMessage(patientid: 1, messageContent: "Nati", messageType: "receiver"),
  ChatMessage(patientid: 1, messageContent: "Hi,Nati", messageType: "sender"),
  ChatMessage(patientid: 2, messageContent: "Aman", messageType: "receiver"),
  ChatMessage(patientid: 2, messageContent: "Hi,Aman", messageType: "sender"),
  ChatMessage(patientid: 3, messageContent: "Jossy", messageType: "receiver"),
  ChatMessage(patientid: 3, messageContent: "Hi,Jossy", messageType: "sender"),
  ChatMessage(patientid: 4, messageContent: "Sami", messageType: "receiver"),
  ChatMessage(patientid: 4, messageContent: "Hi,Sami", messageType: "sender"),
];

//////////////////List of new doctors for admin///////////////////////

class newdoctors {
  String dr_Name;
  String dr_email;
  newdoctors({this.dr_Name, this.dr_email});
}

List<newdoctors> newdoctorslist = [
  newdoctors(dr_Name: "Dr.Amanuel Awol", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Natnael Tassew", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Samuel Seid", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Yoseph Ephrem", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Yeheyes Melaku", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Amanuel Awol", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Natnael Tassew", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Samuel Seid", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Yoseph Ephrem", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Yeheyes Melaku", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Amanuel Awol", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Natnael Tassew", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Samuel Seid", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Yoseph Ephrem", dr_email: "aman@gmail.com"),
  newdoctors(dr_Name: "Dr.Yeheyes Melaku", dr_email: "aman@gmail.com"),
];

class patientList {
  int Patient_id;
  String Name;
  String Description;
  String Onlinestatus;
  String img;

  patientList(
      {this.Patient_id,
      @required this.Name,
      @required this.Description,
      this.Onlinestatus,
      this.img});
}

List<patientList> patientlist = [
  patientList(
      Patient_id: 1,
      Name: "Nati",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human.jpeg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Offline",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Offline",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Offline",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Offline",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Offline",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 2,
      Name: "Aman",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human2.jpg"),
  patientList(
      Patient_id: 1,
      Name: "Nati",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human.jpeg"),
  patientList(
      Patient_id: 1,
      Name: "Nati",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human.jpeg"),
  patientList(
      Patient_id: 1,
      Name: "Nati",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human.jpeg"),
  patientList(
      Patient_id: 1,
      Name: "Nati",
      Description: "Hi i tried to call you but you....",
      Onlinestatus: "Online",
      img: "assets/images/Human.jpeg"),
];

//////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

////Report List/////////////////////
///

class ReportList {
  int doctor_id;
  String report_description;
  String sent_date;

  ReportList({this.report_description, this.sent_date, this.doctor_id});
}

List<ReportList> reportlist = [
  ReportList(
      doctor_id: 1,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 2,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 4,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 4,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 5,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 6,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 7,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 8,
      report_description:
          "Doctor someone harrased me when i ask him about the Doctor someone harrased me when i ask him about theDoctor someone harrased me when i ask him about the Doctor someone harrased me when i ask him about theDoctor someone harrased me when i ask him about the",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 1,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
  ReportList(
      doctor_id: 2,
      report_description:
          "Doctor someone harrased me when i ask him about the.........",
      sent_date: "12:08"),
];

//////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

////FeedBack List/////////////////////
///

class Feedbacklist {
  String feedbackdescription, sentDate;
  Feedbacklist({this.feedbackdescription, this.sentDate});
}

List<Feedbacklist> feedbacklist = [
  Feedbacklist(feedbackdescription: "I love this app", sentDate: "10.22"),
  Feedbacklist(feedbackdescription: "Cool app! ", sentDate: "10.12"),
  Feedbacklist(
      feedbackdescription:
          "I started to use this app but there is no bla bla bla in the bla I started to use this app but there is no bla bla bla in the bla I started to use this app but there is no bla bla bla in the bla I started to use this app but there is no bla bla bla in the bla I started to use this app but there is no bla bla bla in the bla I started to use this app but there is no bla bla bla in the bla",
      sentDate: "10.12"),
  Feedbacklist(feedbackdescription: "I love this app", sentDate: "10.12"),
  Feedbacklist(feedbackdescription: "I love this app", sentDate: "10.32"),
];

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

class ScheduleList {
  DateTime date;
  String status;
  ScheduleList({this.date, this.status});
}

List<ScheduleList> scheduleList = [
  ScheduleList(date: DateTime.now(), status: "(missed)"),
  ScheduleList(date: DateTime.now(), status: ""),
  ScheduleList(date: DateTime.now(), status: "(missed)"),
];
