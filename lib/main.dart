import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wave_com/database_helper/database_helper.dart';
import 'package:wave_com/provider/data_provider.dart';
import 'package:wave_com/ui/comission.dart';
import 'package:wave_com/ui/history_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider<DataProvider>(
            create: (_)=>DataProvider(),)
        ],
        child: MaterialApp(
            home:  MainPage()
        ),
      ) ;

  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    // print(allResult.last.accountMoney);
    print(allResult);
    int accountMoney=Provider.of<DataProvider>(context).getAccountMoney();

    int cashMoney=Provider.of<DataProvider>(context).getCashMoney();
    if(allResult!=null&& allResult.length>0){
      accountMoney=allResult.last.accountMoney;
      cashMoney=allResult.last.cashMoney;
    }

    print(cashMoney);



    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 210),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>ComputeCom()
                            ));
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.monetization_on, color: Colors.red, size: 50, ),
                                Text('ကော်မရှင်တွက်မည်', style: TextStyle(color: Colors.blue,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>HistoryPage()
                            ));
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.history, color: Colors.red, size: 50, ),
                                Text('စာရင်းမှတ်တမ်းများ', style: TextStyle(color: Colors.blue,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('ဤဆော့ဝဲလ်သည် Wave Money ၏ တရား၀င်ထုတ်ထားခြင်း မဟုတ်ပါ။'
                          'Wave Money ဆိုင်များ စာရင်းတွက်ချက်ရာတွင် အဆင်ပြေလွယ်ကူစေရန် အတွက်သာဖြစ်ပါသည်။။',
                      style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('စုစုပေါင်းလက်ကျန်ငွေ -'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(

                        '${accountMoney+cashMoney}',
                        //  '${Provider.of<DataProvider>(context).getAccountMoney()+
                        // Provider.of<DataProvider>(context).getCashMoney()
                        // }',
                        style:
                            TextStyle(fontSize: 18, color: Colors.blueAccent),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          'အကောင့်အတွင်းရှိ လက်ကျန်ငွေ',
                        ),
                        Text(
                          '$accountMoney',
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          'ငွေသား လက်ကျန်ငွေ',
                        ),
                        Text(
                          '$cashMoney',
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
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>EditMoney()
                  ));
                },
                icon: Icon(Icons.settings),
                iconSize: 30,
              )
            )
          ],
        ),
      ),
    );
  }
}

class EditMoney extends StatefulWidget {

  @override
  _EditMoneyState createState() => _EditMoneyState();
}

class _EditMoneyState extends State<EditMoney> {
  double accountMoney;
  double cashMoney;

  TextEditingController accountController=TextEditingController();
  TextEditingController cashController=TextEditingController();

  @override
  Widget build(BuildContext context) {


print(cashController);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('အကောင့်ရှိငွေကိုပြင်ဆင်ရန် ငွေပမာဏရိုက်ထည့်ပါ'),
            Container(
              margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade300,width: 3),
                  borderRadius: BorderRadius.circular(30),

                ),

                child: TextFormField(
                  controller: accountController,
                  // initialValue: Provider.of<DataProvider>(context).getAccountMoney().toString(),

                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'ငွေပမာဏရိုက်ထည့်ပါ',
                    border: InputBorder.none
                  ),
                )),

              Text('အပြင်ရှိငွေသားကိုပြင်ဆင်ရန် ငွေပမာဏရိုက်ထည့်ပါ'),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width*0.7,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade300,width: 3),
                    borderRadius: BorderRadius.circular(30),

                  ),

                  child: TextFormField(
                    // initialValue: '111',
                    controller: cashController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'ငွေပမာဏရိုက်ထည့်ပါ',
                        border: InputBorder.none
                    ),
                  )),
              RaisedButton(

                color: Colors.blue,
                child: Text('အတည်ပြုမည်',style: TextStyle(color: Colors.white),),
                onPressed: (){
                  if(accountController.text!=null&&accountController.text!='') {
                    Provider.of<DataProvider>(context, listen: false)
                        .changeAccountMoney(int.parse(accountController.text));
                    // DatabaseHelper().insertHistoryDatabase(
                    //     HistoryDatabase(
                    //       accountMoney:double.parse(accountController.text),
                    //     ).toMap()
                    // );
                  }
                  if(cashController.text!=null&&cashController.text!='') {
                    Provider.of<DataProvider>(context, listen: false)
                        .changeCashMoney(int.parse(cashController.text));

                    // DatabaseHelper().insertHistoryDatabase(
                    //     HistoryDatabase(
                    //       cashMoney:double.parse(cashController.text),
                    //     ).toMap()
                    // );
                  }


                  print(accountController.text);
                  // print(DatabaseHelper().getHistoryDatabase());
                  setState(() {
                    if(accountController.text!=null && accountController.text!=''
                        && cashController.text!=null&&cashController.text!=''
                    ){
                      DatabaseHelper().insertHistoryDatabase(
                          HistoryDatabase(
                            dateTime: '${DateTime.now()}',
                              cashMoney:double.parse(cashController.text),
                              accountMoney: double.parse(accountController.text)
                          ).toMap()
                      );

                    }
                  });

                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=>MainPage()));
                  // Navigator.pop(context);
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}

