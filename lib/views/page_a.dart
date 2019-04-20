import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {

  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlDate = TextEditingController();
  //สร้าง Radio
  int carType;
  @override
  void initState() {
    // TODO: implement initState
    carType = 100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forma App Na Ja'),
        centerTitle: true, // title stay center
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Image.asset(
                'assets/images/wow.png',
                height: 150.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  controller: ctrlName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                    ),
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: TextField(
                  controller: ctrlDate,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.landscape,
                    ),
                    labelText: 'Date rent',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 80.0,
                  top: 10.0
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      groupValue: carType,
                      value: 100,
                      onChanged: (data){
                        setState(() {
                          carType = data;
                        });
                      },
                    ),
                    Text(
                      'Altis 100 Bath/Day'
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 80.0,
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      groupValue: carType,
                      value: 80,
                      onChanged: (data){
                        //ค่ามีผลกับหน้าจอ อยู่ภายใต้ setState
                        setState(() {
                          carType = data;
                        });
                      },
                    ),
                    Text(
                        'Viso 80 Bath/Day'
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 80.0,
                ),
                child: Row(
                  children: <Widget>[
                    Radio(
                      groupValue: carType,
                      value: 150,
                      onChanged: (data){
                        setState(() {
                          carType = data;
                        });
                      },
                    ),
                    Text(
                        'Camry 150 Bath/Day'
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: (){
                          //TODO
                          if(ctrlName.text == ''){
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Warning !!!!'),
                                  content:Text('Plese Check Name') ,
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK ?'),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }else if(ctrlDate.text == ''){
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Warning !!!!'),
                                  content:Text('Plese Check Date') ,
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK ?'),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }else{
                            double date = double.parse(ctrlDate.text);
                            double payrent = date * carType;
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  content: Column(
                                    children: <Widget>[
                                      Text('Pay Rent'),
                                      Text('${payrent}'),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                            );
                          }
//                          print(ctrlName.text);
////                          print(ctrlDate.text);
////                          print(carType);
                        },
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                        color: Colors.teal[300],
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: (){
                          //TODO
                          setState(() {
                            ctrlName.text = '';
                            ctrlDate.text = '';
                            carType = 100;
                          });
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                        color: Colors.red[900],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ), //Scroll
    );
  }
}
