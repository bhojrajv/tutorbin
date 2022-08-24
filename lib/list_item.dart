import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutobin/Approvider/amountprv.dart';
import 'package:tutobin/model/productlist.dart';

import 'model/orderpr.dart';

class ListItem extends StatefulWidget{

  String listItems;
  Products produstsvl;
 int index;
  ListItem(this.listItems,this.produstsvl,this.index);

  @override
  State<StatefulWidget>createState()
  {
    return ListItemState();
  }
}
class ListItemState extends State<ListItem>
{
  bool isExpand=false;
  List<Cat2>itme2=[];
  List<Cat3>itme3=[];
  List<Cat4>itme4=[];
  Products? productlist;
  Cat5? itme5;
  List<int> sltindx=[];
  List<int> sltindx2=[];
  List<int> sltindx3=[];
  List<int> sltindx4=[];
  int? count;
  int? count2;
  int? count3;
  int? count4;
  int amt=0;
  int amt2=0;
  int amt3=0;
  int amt4=0;
  bool isSelected=false;
  List<OrderProduct>listorder=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpand=false;
    getcart();
  }
  getcart(){
    setState((){
      productlist=this.widget.produstsvl;
      for(int i=0;i<3;i++){
        sltindx.add(1);
      }
      for(int i=0;i<productlist!.cat2!.length;i++){
        sltindx2.add(1);
      }
      for(int i=0;i<productlist!.cat3!.length;i++){
        sltindx3.add(1);
      }
      for(int i=0;i<productlist!.cat4!.length;i++){
        sltindx4.add(1);
      }
     // sltindx.clear();
    });

  }
  @override
  Widget build(BuildContext context) {

    return productlist!=null? Padding(
      padding: (isExpand==true)?const EdgeInsets.all(8.0):const EdgeInsets.all(12.0),
      child: Container(
          decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: (isExpand!=true)?BorderRadius.all(Radius.circular(8)):BorderRadius.all(Radius.circular(22)),
              border: Border.all(color: Colors.pink)
          ),
        child: ExpansionTile(

          key: PageStorageKey<String>(this.widget.listItems),
          title: Container(
              width: double.infinity,

              child: Text(this.widget.listItems,style: TextStyle(fontSize: (isExpand!=true)?18:22),)),
          trailing: (isExpand==true)?Icon(Icons.arrow_drop_down,size: 32,color: Colors.pink,):Icon(Icons.arrow_drop_up,size: 32,color: Colors.pink),
          onExpansionChanged: (value){
            setState(() {
              isExpand=value;
            });
          },
          children:expanditems()

        ),
      ),
    ):SizedBox();
  }
  List<Widget> expanditems(){
    if(widget.index==0){
      //for(final item in productlist!.cat1!)
     return List.generate(3, (index){
    //  sltindx.add(index);
     // Provider.of<AmountProvider>(context,listen: false).getamount((productlist!.cat1![index].price!));
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: InkWell(
           onTap: (){
             Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.pink,duration:Duration(microseconds: 500)
                 ,content: Text("Selected Item  "+widget.listItems )));
            getindex(index);
           },
           child: Container(
               width: double.infinity,
               decoration:BoxDecoration(
                   color: count==index?Colors.white.withOpacity(.5):Colors.black26,
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
                         Text(productlist!.cat1![index].name!,style: TextStyle(color: Colors.black),),
                        index==1? Container(
                          width: MediaQuery.of(context).size.width/3,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                             borderRadius: BorderRadius.circular(20.0)
                          ),
                            child: Text("BestSeller",style: TextStyle(color: Colors.white
                            ,fontWeight: FontWeight.bold),)):
                         Expanded(flex: 2,
                             child: SizedBox()),
                         count==index?Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                           InkWell(
                             onTap: (){
                              setState((){
                                 if(count==index){
                                   sltindx[index]= sltindx[index]+1;

                                   if(sltindx[index]==1){
                                     amt=(amt+(productlist!.cat1![index].price!));
                                     Provider.of<AmountProvider>(context,listen: false).getamount(amt);
                                   }else{
                                     amt=(amt+(sltindx[index]*productlist!.cat1![index].price!));
                                     Provider.of<AmountProvider>(context,listen: false).getamount(amt);
                                   }
                                   listorder.add(OrderProduct(name:productlist!.cat1![index].name ,
                                       price: productlist!.cat1![index].price,
                                       total: amt,quty: sltindx[index]));
                                   Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                 }
                              });
                             },
                             child: Container(
                               padding: EdgeInsets.all(4.0),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20.0),
                                  border:Border.all(width: 1,color: Colors.yellow.shade800)
                               ),
                               child: Icon(Icons.add,size: 15,),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                             child: Container(child: Text('${sltindx[index]}',style: TextStyle(fontSize: 14),),),
                           ),
                           InkWell(
                             onTap: (){
                              setState((){
                                if(count==index){
                                  if(sltindx[index]>1){
                                    sltindx[index]=sltindx[index]-1;
                                    amt=(amt-(sltindx[index]*productlist!.cat1![index].price!));
                                    Provider.of<AmountProvider>(context,listen: false).getamount(amt);
                                  }else{
                                    sltindx[index]=sltindx[index];
                                   if(sltindx[index]<=1){
                                     amt=((productlist!.cat1![index].price!));
                                   }else{
                                     amt=(amt-(productlist!.cat1![index].price!));
                                   }
                                    Provider.of<AmountProvider>(context,listen: false).getamount(amt);
                                  }
                                  listorder.add(OrderProduct(name:productlist!.cat1![index].name ,
                                      price: productlist!.cat1![index].price,
                                      total: amt,quty: sltindx[index]));
                                  Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                }
                              });
                             },
                             child: Container(
                               height: 25,
                               width: 25,
                               alignment: Alignment.topCenter,
                               padding: EdgeInsets.all( 2.0),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20.0),
                                   border:Border.all(width: 1,color: Colors.yellow.shade800)
                               ),
                               child: Icon(Icons.minimize, size: 12),
                             ),
                           )
                         ],): TextButton(onPressed: (){
                           setState((){
                             amt=(amt+(productlist!.cat1![index].price!));
                             Provider.of<AmountProvider>(context,listen: false).getamount(amt);
                             listorder.add(OrderProduct(name:productlist!.cat1![index].name ,
                                 price: productlist!.cat1![index].price,
                                 total: amt,quty: sltindx[index]));
                             Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                           });
                       }, child: Text("Add"),
                       style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15.0)
                       )),side: MaterialStateProperty.all(BorderSide(width: 2,color:Colors.yellow.shade600)),
                       backgroundColor:MaterialStateProperty.all(Colors.white)),)],
                     ),
                     Text(productlist!.cat1![index].price!.toString(),style: TextStyle(color: Colors.blueGrey),),
                   ],
                 )
               )),
         ),
       );
     });
    }
    else if(widget.index==1){
     // for(final item in productlist!.cat2!)
      return  List.generate(productlist!.cat2!.length, (index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.pink,duration:Duration(microseconds: 500)
                  ,content: Text("Selected Item  "+widget.listItems )));
              getindex2(index);
            },
            child: Container(
                width: double.infinity,
                decoration:BoxDecoration(
                    color: count2==index?Colors.white.withOpacity(.5):Colors.black26,
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
                            Text(productlist!.cat2![index].name!,style: TextStyle(color: Colors.black),),
                            index==1? Container(
                                width: MediaQuery.of(context).size.width/3,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Text("BestSeller",style: TextStyle(color: Colors.white
                                    ,fontWeight: FontWeight.bold),)):
                            Expanded(flex: 2,
                                child: SizedBox()),
                            count2==index?Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState((){
                                      if(count2==index){
                                        sltindx2[index]= sltindx2[index]+1;
                                        if(sltindx2[index]==1){
                                          amt2=(amt2+(productlist!.cat2![index].price!));
                                          Provider.of<AmountProvider>(context,listen: false).getamount(amt2);
                                        }else{
                                          amt2=(amt2+(sltindx2[index]*productlist!.cat2![index].price!));
                                          Provider.of<AmountProvider>(context,listen: false).getamount(amt2);
                                        }
                                        listorder.add(OrderProduct(name:productlist!.cat2![index].name ,
                                            price: productlist!.cat2![index].price,
                                            total: amt2,quty: sltindx2[index]));
                                        Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        border:Border.all(width: 1,color: Colors.yellow.shade800)
                                    ),
                                    child: Icon(Icons.add,size: 15,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                                  child: Container(child: Text('${sltindx2[index]}',style: TextStyle(fontSize: 14),),),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState((){
                                      if(count2==index){
                                        if(sltindx2[index]>1){
                                          sltindx2[index]=sltindx2[index]-1;
                                          amt2=(amt2-(sltindx[index]*productlist!.cat1![index].price!));
                                          Provider.of<AmountProvider>(context,listen: false).getamount(amt2);
                                        }else{
                                          sltindx[index]=sltindx[index];
                                          if(sltindx2[index]<=1){
                                            amt2=((productlist!.cat2![index].price!));
                                          }else{
                                            amt2=(amt2-(productlist!.cat2![index].price!));
                                          }
                                          Provider.of<AmountProvider>(context,listen: false).getamount(amt2);
                                        }
                                        listorder.add(OrderProduct(name:productlist!.cat2![index].name ,
                                            price: productlist!.cat2![index].price,
                                            total: amt2,quty: sltindx2[index]));
                                        Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.all( 2.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        border:Border.all(width: 1,color: Colors.yellow.shade800)
                                    ),
                                    child: Icon(Icons.minimize, size: 12),
                                  ),
                                )
                              ],): TextButton(onPressed: (){
                              setState((){
                                amt2=(amt2+(productlist!.cat2![index].price!));
                                Provider.of<AmountProvider>(context,listen: false).getamount(amt2);
                                listorder.add(OrderProduct(name:productlist!.cat3![index].name ,
                                    price: productlist!.cat2![index].price,
                                    total: amt2,quty: sltindx2[index]));
                                Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                              });

                            }, child: Text("Add"),
                              style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              )),side: MaterialStateProperty.all(BorderSide(width: 2,color:Colors.yellow.shade600)),
                                  backgroundColor:MaterialStateProperty.all(Colors.white)),)],
                        ),
                        Text(productlist!.cat2![index].price!.toString(),style: TextStyle(color: Colors.blueGrey),),
                      ],
                    )
                )),
          ),
        );
      });
    }
    else if(widget.index==2){
      //for(final item in productlist!.cat3!)
        return  List.generate(productlist!.cat3!.length, (index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.pink,duration:Duration(microseconds: 500)
                    ,content: Text("Selected Item  "+widget.listItems )));
                getindex3(index);
              },
              child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                      color: count3==index?Colors.white.withOpacity(.5):Colors.black26,
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
                              Text(productlist!.cat3![index].name!,style: TextStyle(color: Colors.black),),
                              index==1? Container(
                                  width: MediaQuery.of(context).size.width/3,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Text("BestSeller",style: TextStyle(color: Colors.white
                                      ,fontWeight: FontWeight.bold),)):
                              Expanded(flex: 2,
                                  child: SizedBox()),
                              count3==index?Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        if(count3==index){
                                          sltindx3[index]= sltindx3[index]+1;
                                          if(sltindx3[index]==1){
                                            amt3=(amt3+(productlist!.cat3![index].price!));
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt3);
                                          }else{
                                            amt3=(amt3+(sltindx3[index]*productlist!.cat3![index].price!));
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt3);
                                          }
                                          listorder.add(OrderProduct(name:productlist!.cat3![index].name ,
                                              price: productlist!.cat3![index].price,
                                              total: amt3,quty:sltindx3[index]));
                                          Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          border:Border.all(width: 1,color: Colors.yellow.shade800)
                                      ),
                                      child: Icon(Icons.add,size: 15,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                                    child: Container(child: Text('${sltindx3[index]}',style: TextStyle(fontSize: 14),),),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        if(count3==index){
                                          if(sltindx3[index]>1){
                                            sltindx3[index]=sltindx[index]-1;
                                            amt3=(amt3-(sltindx3[index]*productlist!.cat3![index].price!));
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt3);
                                          }else{
                                            sltindx3[index]=sltindx3[index];
                                            if(sltindx3[index]<=1){
                                              amt3=((productlist!.cat3![index].price!));
                                            }else{
                                              amt3=(amt3-(productlist!.cat3![index].price!));
                                            }
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt);
                                          }
                                          listorder.add(OrderProduct(name:productlist!.cat3![index].name ,
                                              price: productlist!.cat3![index].price,
                                              total: amt3,quty: sltindx3[index]));
                                          Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      alignment: Alignment.topCenter,
                                      padding: EdgeInsets.all( 2.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          border:Border.all(width: 1,color: Colors.yellow.shade800)
                                      ),
                                      child: Icon(Icons.minimize, size: 12),
                                    ),
                                  )
                                ],): TextButton(onPressed: (){
                                  setState((){
                                    amt3=(amt3+(productlist!.cat3![index].price!));
                                    Provider.of<AmountProvider>(context,listen: false).getamount(amt3);
                                    listorder.add(OrderProduct(name:productlist!.cat3![index].name ,
                                        price: productlist!.cat3![index].price,
                                        total: amt3,quty: sltindx3[index]));
                                    Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                  });

                              }, child: Text("Add"),
                                style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                )),side: MaterialStateProperty.all(BorderSide(width: 2,color:Colors.yellow.shade600)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white)),)],
                          ),
                          Text(productlist!.cat3![index].price!.toString(),style: TextStyle(color: Colors.blueGrey),),
                        ],
                      )
                  )),
            ),
          );
        });
    }
    else if(widget.index==3){
      //for(final item in productlist!.cat4!)
        return  List.generate(productlist!.cat4!.length, (index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.pink,duration:Duration(microseconds: 500)
                    ,content: Text("Selected Item  "+widget.listItems )));
                getindex4(index);
              },
              child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                      color: count4==index?Colors.white.withOpacity(.5):Colors.black26,
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
                              Text(productlist!.cat4![index].name!,style: TextStyle(color: Colors.black),),
                              index==1? Container(
                                  width: MediaQuery.of(context).size.width/3,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Text("BestSeller",style: TextStyle(color: Colors.white
                                      ,fontWeight: FontWeight.bold),)):
                              Expanded(flex: 2,
                                  child: SizedBox()),
                              count4==index?Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        if(count4==index){
                                          sltindx4[index]= sltindx4[index]+1;
                                          if(sltindx4[index]==1){
                                            amt4=(amt4+(productlist!.cat4![index].price!));
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt4);
                                          }else{
                                            amt4=(amt4+(sltindx[index]*productlist!.cat4![index].price!));
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt4);
                                          }
                                          listorder.add(OrderProduct(name:productlist!.cat4![index].name ,
                                              price: productlist!.cat4![index].price,
                                              total: amt4,quty: sltindx4[index]));
                                          Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          border:Border.all(width: 1,color: Colors.yellow.shade800)
                                      ),
                                      child: Icon(Icons.add,size: 15,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                                    child: Container(child: Text('${sltindx4[index]}',style: TextStyle(fontSize: 14),),),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState((){
                                        if(count4==index){
                                          if(sltindx4[index]>1){
                                            sltindx4[index]=sltindx4[index]-1;
                                            amt4=(amt4-(sltindx4[index]*productlist!.cat4![index].price!));
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt4);
                                          }else{
                                            sltindx4[index]=sltindx4[index];
                                            if(sltindx4[index]<=1){
                                              amt=((productlist!.cat4![index].price!));
                                            }else{
                                              amt4=(amt4-(productlist!.cat4![index].price!));
                                            }
                                            Provider.of<AmountProvider>(context,listen: false).getamount(amt4);
                                          }
                                          listorder.add(OrderProduct(name:productlist!.cat4![index].name ,
                                              price: productlist!.cat4![index].price,
                                              total: amt4,quty: sltindx4[index]));
                                          Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      alignment: Alignment.topCenter,
                                      padding: EdgeInsets.all( 2.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          border:Border.all(width: 1,color: Colors.yellow.shade800)
                                      ),
                                      child: Icon(Icons.minimize, size: 12),
                                    ),
                                  )
                                ],): TextButton(onPressed: (){
                                       setState((){
                                         amt4=(amt4+(productlist!.cat4![index].price!));
                                         Provider.of<AmountProvider>(context,listen: false).getamount(amt4);
                                         listorder.add(OrderProduct(name:productlist!.cat4![index].name ,
                                             price: productlist!.cat4![index].price,
                                             total: amt4,quty: sltindx4[index]));
                                         Provider.of<AmountProvider>(context,listen: false).getorderlist(listorder);
                                       });
                              }, child: Text("Add"),
                                style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                )),side: MaterialStateProperty.all(BorderSide(width: 2,color:Colors.yellow.shade600)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white)),)],
                          ),
                          Text(productlist!.cat4![index].price!.toString(),style: TextStyle(color: Colors.blueGrey),),
                        ],
                      )
                  )),
            ),
          );
        });
    }
    return  List.generate(productlist!.cat5!.length, (index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.pink,duration:Duration(microseconds: 500)
                ,content: Text("Selected Item  "+widget.listItems )));
          },
          child: Container(
              width: double.infinity,
              decoration:BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Colors.pinkAccent)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(productlist!.cat5![index].name!,style: TextStyle(color: Colors.white),),
              )),
        ),
      );
    });

}

  void getindex(int indx) {
    print("indx:${indx}");
    print("indx2:${sltindx[indx]}");
    setState((){
      count=indx;
      if(sltindx.contains(indx)){
        //sltindx.removeAt(indx);
       // sltindx.clear();
        //  isSelected=!isSelected;
      }else{
        sltindx.add(indx);
      //  count=indx;
        //isSelected=true;
      }
    });
  }
  void getindex2(int indx) {
    print("indx:${indx}");
    print("indx2:${sltindx[indx]}");
    setState((){
      count2=indx;
      if(sltindx.contains(indx)){
        //sltindx.removeAt(indx);
        // sltindx.clear();
        //  isSelected=!isSelected;
      }else{
        sltindx.add(indx);
        //  count=indx;
        //isSelected=true;
      }
    });
  }
  void getindex3(int indx) {
    print("indx:${indx}");
    print("indx2:${sltindx[indx]}");
    setState((){
      count3=indx;
      if(sltindx.contains(indx)){
        //sltindx.removeAt(indx);
        // sltindx.clear();
        //  isSelected=!isSelected;
      }else{
        sltindx.add(indx);
        //  count=indx;
        //isSelected=true;
      }
    });
  }
  void getindex4(int indx) {
    print("indx:${indx}");
    print("indx2:${sltindx[indx]}");
    setState((){
      count4=indx;
      if(sltindx.contains(indx)){
        //sltindx.removeAt(indx);
        // sltindx.clear();
        //  isSelected=!isSelected;
      }else{
        sltindx.add(indx);
        //  count=indx;
        //isSelected=true;
      }
    });
  }

}