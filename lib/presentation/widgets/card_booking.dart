import 'package:booking_app/constant/color.dart';
import 'package:booking_app/util/datetime_manipulation.dart';
import 'package:flutter/material.dart';

class CardBooking extends StatelessWidget {
  final String? id;
  final String image;
  final String name;
  final String price;
  final DateTime startDate;
  final DateTime endDate;
  final void Function()? onTap;

  const CardBooking(
      {super.key,
        required this.id,
        required this.image,
        required this.startDate,
        required this.endDate,
        required this.name,
        required this.price,
        this.onTap
      });



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(10),
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
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Text(name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                Text(
                    "${convertDatetimeFormat(startDate)} - ${convertDatetimeFormat(endDate)}"
                ,style: const TextStyle(fontSize: 12,color: lighter),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      "Rp $price",
                      style: const TextStyle(
                          color: blueNormal,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      " /night",
                      style: TextStyle(color: lighter),
                    )
                  ],
                ),

              ],
            ),

      ]


      )),
    );
  }
}
