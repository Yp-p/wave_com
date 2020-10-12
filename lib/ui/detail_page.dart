import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_com/database_helper/database_helper.dart';
import 'package:wave_com/main.dart';
import 'package:wave_com/provider/data_provider.dart';
import 'package:wave_com/ui/comission.dart';

class AmountDetail extends StatefulWidget {
  final provider;

  const AmountDetail({Key key, this.provider}) : super(key: key);
  @override
  _AmountDetailState createState() => _AmountDetailState();
}

class _AmountDetailState extends State<AmountDetail> {
  int accountMoney=0;
  int cashMoney=0;
  List<HistoryDatabase> allResult;
  Future futureLoad;
  getHistory() async{
    List<HistoryDatabase> history=await DatabaseHelper().getHistoryDatabase();
    setState(() {
      allResult=history;
    });
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    futureLoad=getHistory();
  }

  @override
  Widget build(BuildContext context) {

    if(allResult!=null&& allResult.length>0){
      accountMoney=allResult.last.accountMoney;
      cashMoney=allResult.last.cashMoney;
    }

    // double accountMoney=widget.provider.getAccountMoney();
    // double cashMoney=widget.provider.getCashMoney();

    int receiveComSum=widget.provider.getReceiveCom();
    int sendComSum=widget.provider.getSendCom();

    int sendMoneySum=widget.provider. getSendMoney();
    int receiveMoneySum=widget.provider.getReceiveMoney();
    int sendFee=widget.provider.getSendFee();

    int lastAccountMoney=accountMoney+receiveMoneySum+sendComSum+receiveComSum-sendMoneySum-sendFee;
    int lastCashMoney=cashMoney+sendMoneySum+sendFee-receiveMoneySum;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        // appBar: AppBar(
        //   backgroundColor: Colors.white
        // ),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              'အကောင့်လက်ကျန်ငွေ',
                            ),
                            Text(
                              '$lastAccountMoney',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              'ငွေသား လက်ကျန်ငွေ',
                            ),
                            Text(
                              '$lastCashMoney',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              'ငွေလွှဲကော်မရှင်',
                            ),
                            Text(
                              '$sendComSum',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              'ငွေထုတ်ကော်မရှင်',
                            ),
                            Text(
                              '$receiveComSum',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        'ကော်မရှင်စုစုပေါင်း',
                      ),
                      Text(
                        '${sendComSum+receiveComSum}',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Column(
                    children: [
                      Text(
                        'အကောင့်ငွေနှင့်ငွေသားစုစုပေါင်း',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                      Text(
                        '${lastCashMoney+lastAccountMoney}',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),

                SizedBox(height: 50,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text('ပြန်တွက်မည်', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                          DatabaseHelper().insertHistoryDatabase(
                            HistoryDatabase(
                            accountMoney: lastAccountMoney,
                              cashMoney: lastCashMoney,
                              sendCom: sendComSum,
                              receiveCom: receiveComSum,
                              sendMoney: sendMoneySum,
                              receiveMoney: receiveMoneySum,
                              sendFee: sendFee
                            ).toMap()
                          );
                          Navigator.popUntil(context, (route) => true);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context)=>MainPage()
                          ), (route) => false);
                          // Navigator.pushReplacement(context, MaterialPageRoute(
                          //   builder: (context)=>ComputeCom()
                          // )
                          // );
                          Provider.of<DataProvider>(context).changeAccountMoney(lastAccountMoney);
                          Provider.of<DataProvider>(context).changeCashMoney(lastCashMoney);

                        },
                        child: Text('သိမ်းမည်', style: TextStyle(color: Colors.white),),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}