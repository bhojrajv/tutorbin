import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tutobin/Approvider/amountprv.dart';
import 'package:tutobin/list_item.dart';
import 'package:tutobin/model/productlist.dart';
import 'package:tutobin/orderpage.dart';
import 'package:tutobin/webservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AmountProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Cat1>lstcat1=[];
  Products? _productsvalue2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprodlst();
  }

  void getprodlst(){
    print("products2");
    getproducts().then((value){
      print("products");
      if(value!=null){
        setState((){
          _productsvalue2=value;
          lstcat1=value.cat1!;
          print("cat!::${lstcat1.first.name}");
          print("cat2!::${value.cat2!.first.name}");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:  Stack(
         fit: StackFit.loose,
        children: [
          Center(

              child: ListView.builder(itemBuilder: (context,index){
                 return ListItem(getItems()[index],_productsvalue2!,index );
              },itemCount: getItems().length,shrinkWrap: true,)
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:   InkWell(
              onTap: (){
                print("order::");
                if(Provider.of<AmountProvider>(context,listen: false).amount<=0){
                  print("order2::");
                  Fluttertoast.showToast(msg: "Please Select your favourite items to make order");

                }else{
                  Fluttertoast.showToast(msg: "your order placed successfully");
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Orderpage(orderlistpr: Provider.of<AmountProvider>(context,listen: false).orderlist,)));
                  print("orderlist::${Provider.of<AmountProvider>(context,listen: false).orderlist.first.price}");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                   color: Colors.yellow.shade900),
                  width: MediaQuery.of(context).size.width/1.1,
                  height: MediaQuery.of(context).size.height/13 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Text("Place Order",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                    color: Colors.white),),
                      SizedBox(width: 15.0,),
                     Text("\$ ${Provider.of<AmountProvider>(context).amount}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],),),
              ),
            ),
          )
        ],
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  List<String> getItems()
  {

    return ["Popular Items","Salads","Checken","Soups"].toList();
  }
}
