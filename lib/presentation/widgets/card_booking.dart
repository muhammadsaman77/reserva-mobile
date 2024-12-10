import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';

class CardBooking extends StatelessWidget {
  final String? id;
  final String image;
  final String name;
  final String price;
  final String date;

  CardBooking(
      {
        required this.id,
        required this.image,
        required this.date,
        required this.name,
        required this.price,
      });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
  padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  Colors.white,
      ),
      width: MediaQuery.of(context).size.width ,
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(image),
              width: MediaQuery.of(context).size.width * 2.5/ 12,
              height: MediaQuery.of(context).size.width *2.5/ 12,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text(name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
              Text(date,style: TextStyle(fontSize: 12,color: lighter),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Rp " + price.toString(),
                    style: TextStyle(
                        color: blueNormal,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    " /night",
                    style: TextStyle(color: lighter),
                  )
                ],
              ),

            ],
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.download,color: blueNormal,),)
    ]


    ));
  }
}
