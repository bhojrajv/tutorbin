import 'package:flutter/material.dart';

import 'model/orderpr.dart';

class Orderpage extends StatefulWidget {
   List<OrderProduct>orderlistpr=[];
   Orderpage({required this.orderlistpr,Key? key}) : super(key: key);

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  @override
  initState(){
    print("::${widget.orderlistpr[widget.orderlistpr.length-1].total}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("your orders"),
      ),
      body: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          ListView.builder(itemBuilder: (context,index){
            return widget.orderlistpr!.length>0?Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){

                },
                child: Container(
                    width: double.infinity,
                    decoration:BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.pinkAccent)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.orderlistpr[index].name!,style: TextStyle(color: Colors.black),),
                                 Container(
                                    width: MediaQuery.of(context).size.width/3,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: Text("qnty: ${widget.orderlistpr[index].quty}",style: TextStyle(color: Colors.grey
                                        ,fontWeight: FontWeight.bold),))
                                 ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.orderlistpr[index].price.toString(),style: TextStyle(color: Colors.black),),
                                Container(
                                    width: MediaQuery.of(context).size.width/3,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: Text("total: ${widget.orderlistpr[index].total}",style: TextStyle(color: Colors.grey
                                        ,fontWeight: FontWeight.bold),))
                              ],
                            ),
                          ],
                        )
                    )),
              ),
            ):SizedBox();
          },itemCount: widget.orderlistpr!.length,shrinkWrap: true,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("Total Paid Amount :${widget.orderlistpr[widget.orderlistpr.length-1].total}",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
    );
  }
}
