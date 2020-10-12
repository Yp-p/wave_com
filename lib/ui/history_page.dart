import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wave_com/database_helper/database_helper.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List allResult;
  List resultList;
  Future futureLoad;
  int _radioValue=0;

  void _handleRadioValueChange(int value){
    setState(() {
      _radioValue=value;

      switch(_radioValue){
        case 0: break;
        case 1:break;
        case 2: break;
      }
    });
  }

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

  result(){
    if(allResult.length!=0&&allResult.length>0){
      if(_radioValue==0){
        resultList=allResult;
      }if(_radioValue==1){
        resultList=allResult.getRange(allResult.length<3?0:allResult.length-3, allResult.length).toList();
        // resultList=allResult.getRange(allResult.length-3, allResult.length).toList();
      }
    }

  }



  @override
  Widget build(BuildContext context) {
    result();
    // print(resultList.getRange(1, 2));
    print(_radioValue);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text('စာရင်းမှတ်တမ်းများ', style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange),
                Text('အားလုံး'),
                Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange),
                Text('နောက်ဆုံး(၃)ကြိမ်'),
                Radio(
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange),
                Text('ပြီးခဲ့တဲ့(၇)ရက်'),
              ],
            ),
            HistoryItem(list: resultList,)
          ],
        ),
      ),
    );
  }
}

class HistoryItem extends StatefulWidget {
  final List<HistoryDatabase> list;

  const HistoryItem({Key key, this.list}) : super(key: key);
  @override
  _HistoryItemState createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {

    List<HistoryDatabase> dataList=widget.list;
    if(dataList!=null&&dataList.length>0){
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index){
                var dateTime=DateTime.parse(dataList[dataList.length-index-1].dateTime);
                String date=formatDate(dateTime, [dd, '-', mm, '-', yyyy, ' ', hh, ':', nn, ':', ss, ' ', am]);

               print(date);

                return Container(

                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Text('$date'),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),


                          // color: Colors.grey,
                          elevation: 2,
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.red),
                            //   borderRadius: BorderRadius.circular(100),
                            // ),

                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('ငွေလွှဲကော်မရှင်'),
                                    Text('${dataList[dataList.length-index-1].sendCom??0}')
                                  ],
                                ),
                                Divider(thickness: 1,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('ငွေထုတ်ကော်မရှင်'),
                                    Text('${dataList[dataList.length-index-1].receiveCom??0}')
                                  ],
                                ),
                                Divider(thickness: 1,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('အကောင့်ရှိငွေ နှင့် ငွေသားစုစုပေါင်း'),
                                    Text('${dataList[dataList.length-index-1].cashMoney+
                                        dataList[dataList.length-index-1].accountMoney}')
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                );
              }),
        ),
      );
    }
   return Center(child: Text('အချက်အလက်များမရှိသေးပါ'));

  }
}

