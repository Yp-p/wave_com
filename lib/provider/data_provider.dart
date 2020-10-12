
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';



class DataProvider with ChangeNotifier{
  int accountMoney=0;
  int cashMoney=0;
  int sendCom=0;
  int receiveCom=0;
  int sendMoney=0;
  int receiveMoney=0;
  int sendFee=0;

  getAccountMoney()=>accountMoney;
  getCashMoney()=>cashMoney;
  getSendCom()=>sendCom;
  getReceiveCom()=>receiveCom;
  getSendMoney()=>sendMoney;
  getReceiveMoney()=>receiveMoney;
  getSendFee()=>sendFee;

  void changeAccountMoney(int amount){
    accountMoney=amount;
    notifyListeners();
  }
  void changeCashMoney(int amount){
    cashMoney=amount;
    notifyListeners();
  }
  void changeSendCom(int amount){
    sendCom=amount;
    notifyListeners();
  }
  void changeReceiveCom(int amount){
    receiveCom=amount;
    notifyListeners();
  }

  void changeSendMoney(int amount){
    sendMoney=amount;
    notifyListeners();
  }
  void changeReceiveMoney(int amount){
    receiveMoney=amount;
    notifyListeners();
  }
  void changeSendFee(int amount){
    sendFee=amount;
    notifyListeners();
  }

}