import 'package:booking_app/constant/color.dart';
import 'package:booking_app/util/string_manipulation.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String price;
  final double rating;
  final String address;
  final void Function()? onTap;

  const CardItem({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.price,
    required this.rating,

    required this.address,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Stack(children: [
          Card(
            elevation: 0.5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15.0)),
                  child: Image(
                    image: NetworkImage(imagePath),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(toTitleCase( itemName),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          // Row(
                          //   children: [
                          //     SvgPicture.asset(
                          //       'assets/icons/star.svg',
                          //       colorFilter: ColorFilter.mode(
                          //           Colors.yellow, BlendMode.srcIn),
                          //     ),
                          //     Text(rating.toString(),
                          //         style: TextStyle(
                          //             fontSize: 12,
                          //             fontWeight: FontWeight.w700)),
                          //   ],
                          // ),
                        ],
                      ),
                      Text(
                        address,
                        style: TextStyle(color: lighter),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Rp " + price,
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        ]),
      ),
    );
  }
}
