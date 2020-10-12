

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wave_com/detail_condition.dart';
import 'package:wave_com/provider/data_provider.dart';

import 'detail_page.dart';

class ComputeCom extends StatefulWidget {
  @override
  _ComputeComState createState() => _ComputeComState();
}

class _ComputeComState extends State<ComputeCom> {

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    double totalBalance=0;
    return SecondMainPage();
    //   MultiProvider(
    //   providers: [
    // ChangeNotifierProvider<DataProvider>(
    // create: (_)=>DataProvider(),)
    //   ],
    //   child: SecondMainPage(),
    // ) ;


  }
}

class SecondMainPage extends StatefulWidget {
  @override
  _SecondMainPageState createState() => _SecondMainPageState();
}

class _SecondMainPageState extends State<SecondMainPage> {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<DataProvider>(context);


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [


            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap:(){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('စုစုပေါင်းငွေ -'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Provider.of<DataProvider>(context).getAccountMoney().toString(),
                          style:
                          TextStyle(fontSize: 18, color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                  // AmountDetail()


                ],
              ),
            ),
            AppBar(backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.blue),
              shadowColor: Colors.transparent,
            ),
            Container(
                margin: EdgeInsets.only(top: 80),

                child: DataADD(provider: provider,)),

          ],

        ),
      ),
    );
  }
  }



// class AmountDetail extends StatefulWidget {
//   final provider;
//
//   const AmountDetail({Key key, this.provider}) : super(key: key);
//   @override
//   _AmountDetailState createState() => _AmountDetailState();
// }
//
// class _AmountDetailState extends State<AmountDetail> {
//   @override
//   Widget build(BuildContext context) {
//
//     double receiveComSum=widget.provider.getReceiveCom();
//     double sendComSum=widget.provider.getSendCom();
//     double accountMoney=widget.provider.getAccountMoney();
//     double cashMoney=widget.provider.getCashMoney();
//     double sendMoneySum=widget.provider. getSendMoney();
//     double receiveMoneySum=widget.provider.getReceiveMoney();
//     double sendFee=widget.provider.getSendFee();
//
//     double lastAccountMoney=accountMoney+receiveMoneySum+sendComSum+receiveComSum-sendMoneySum-sendFee;
//     double lastCashMoney=cashMoney+sendMoneySum+sendFee-receiveMoneySum;
//
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: Colors.white
//         // ),
//         body: Center(
//           child: Container(
//             padding: EdgeInsets.all(10),
//             color: Colors.yellowAccent,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Text(
//                               'အကောင့်လက်ကျန်ငွေ',
//                             ),
//                             Text(
//                               '$lastAccountMoney',
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                     SizedBox(width: 10,),
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Text(
//                               'ငွေသား လက်ကျန်ငွေ',
//                             ),
//                             Text(
//                               '$lastCashMoney',
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10,),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Text(
//                               'ငွေလွှဲကော်မရှင်',
//                             ),
//                             Text(
//                               '$sendComSum',
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                     SizedBox(width: 10,),
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         child: Column(
//                           children: [
//                             Text(
//                               'ငွေထုတ်ကော်မရှင်',
//                             ),
//                             Text(
//                               '$receiveComSum',
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10,),
//                 Container(
//                   width: MediaQuery.of(context).size.width*0.8,
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   child: Column(
//                     children: [
//                       Text(
//                         'ကော်မရှင်စုစုပေါင်း',
//                       ),
//                       Text(
//                         '${sendComSum+receiveComSum}',
//                         style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//                 SizedBox(height: 10,),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   width: MediaQuery.of(context).size.width*0.8,
//                   child: Column(
//                     children: [
//                       Text(
//                         'အကောင့်ငွေနှင့်ငွေသားစုစုပေါင်း',
//                         style: TextStyle(
//                           fontSize: 18
//                         ),
//                       ),
//                       Text(
//                         '${lastCashMoney+lastAccountMoney}',
//                         style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class DataADD extends StatefulWidget {
  final provider;

  const DataADD({Key key, this.provider}) : super(key: key);

  @override
  _DataADDState createState() => _DataADDState();
}

class _DataADDState extends State<DataADD> {

  List<InputData> totalList=[];
  var dropDownValue;




  @override
  Widget build(BuildContext context) {

    var provider=Provider.of<DataProvider>(context);
    double sendFeed=0;

    int sendComSum=0;
    int  receiveComSum=0;
    int amountSum=0;
    int sendFeeSum=0;
    int sendMoneySum=0;
    int receiveMoneySum=0;


    for(var data in totalList){

      if(data.type=='ငွေလွှဲ'){
        data.sendFee=Condition().sendFee(data.amount);
        data.sendCom=Condition().sendCom(data.amount);
        sendComSum=sendComSum+data.sendCom;
        sendFeeSum=sendFeeSum+data.sendFee;
        sendMoneySum=sendMoneySum+data.amount;

      }if(data.type=='ငွေထုတ်'){
        data.receiveCom=Condition().receiveCom(data.amount);
        receiveComSum=receiveComSum+data.receiveCom;
        receiveMoneySum=receiveMoneySum+data.amount;
      }if(data.type=='ဖုန်းဘေ'){
        data.sendCom=Condition().phoneBailCom(data.amount);
        sendComSum=sendComSum+data.sendCom;
        sendMoneySum=sendMoneySum+data.amount;
      }

      amountSum=amountSum+data.amount;


    }




    print(amountSum);
    print(sendComSum);
    print(receiveComSum);



      // Provider.of<DataProvider>(context,listen: false).changeAccountMoney(total);




    // widget.provider.changeAccountMoney(total)

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: IconButton(
          onPressed: (){

            setState(() {
              totalList.add(InputData(amount: 0,sendCom: 0,receiveCom: 0));
            });
            },
          icon: Icon(Icons.add),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: totalList.length,
                  itemBuilder: (context, index){


                    return Card(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          )
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black, width: 2),

                              ),
                              width: 200,
                              height: 40,
                              child: TextFormField(


                                initialValue: totalList[index].amount.toString()=='0.0'
                                    ?'':totalList[index].amount.toString(),


                                // autofocus: true,
                                keyboardType: TextInputType.number,
                                onChanged: (values){
                                  setState(() {
                                    totalList[index].amount= values==null||values==''?0.0:int.parse(values);
                                    // Provider.of<DataProvider>(context).changeAccountMoney(double.parse(values));

                                  });
                                },

                                textAlign: TextAlign.center,
                                decoration: InputDecoration(

                                  hintText: 'Type Amount',
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                        Container(
                          padding: EdgeInsets.only(left: 7,right: 3),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all()
                          ),
                          child: DropdownButton(
                            dropdownColor: Colors.yellowAccent.shade50,
                            underline: Container(),
                            onChanged: (value){setState(() {
                              totalList[index].type=value;
                            });},
                            // isExpanded: true,
                            value: totalList[index].type==null?'not':totalList[index].type,
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 30,
                            items: [
                              DropdownMenuItem(
                                child: Text('အမျိုးအစားရွေးပါ', style: TextStyle(fontSize: 14),),
                                value: 'not',
                              ),

                              DropdownMenuItem(
                                value: 'ငွေလွှဲ',
                                child: Text('ငွေလွှဲ'),
                              ),
                              DropdownMenuItem(
                                value: 'ငွေထုတ်',
                                child: Text('ငွေထုတ်'),
                              ),
                              DropdownMenuItem(
                                value: 'ဖုန်းဘေ',
                                child: Text('ဖုန်းဘေ'),
                              ),
                              DropdownMenuItem(
                                value: 'out',
                                child: Text('E-Money ထုတ်'),
                              ),
                              DropdownMenuItem(
                                value: 'in',
                                child: Text('E-Money သွင်း'),
                              ),
                              DropdownMenuItem(
                                value: 'remove',
                                child: Text('ယူသုံးငွေ'),
                              ),
                              DropdownMenuItem(
                                value: 'add',
                                child: Text('ပေါင်းထည့်ငွေ'),
                              ),
                            ],
                          ),
                        )
                          ],
                        ),
                      ),
                    );
                  }),
            ),

          ),
          RaisedButton(
            onPressed: (){
              Provider.of<DataProvider>(context,listen: false).changeSendCom(sendComSum);
              Provider.of<DataProvider>(context,listen: false).changeReceiveCom(receiveComSum);
              Provider.of<DataProvider>(context,listen: false).changeSendMoney(sendMoneySum);
              Provider.of<DataProvider>(context,listen: false).changeReceiveMoney(receiveMoneySum);
              Provider.of<DataProvider>(context,listen: false).changeSendFee(sendFeeSum);

              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>AmountDetail(provider: provider,)
              ));

            },
            color: Colors.yellow,
            child: Text('စာရင်းတွက်မည်'),
          )
        ],
      )
    );
  }


}


class InputData{
  int amount;
  int sendFee;
  int sendCom;
  int receiveCom;
  String type;


  InputData({this.amount,this.sendFee, this.sendCom, this.receiveCom, this.type});

}



