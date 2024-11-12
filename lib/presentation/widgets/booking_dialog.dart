import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';

class BookingDialog extends StatelessWidget {
  final String roomType;
  final String description;
  final String price;
  final String image;

  const BookingDialog({
    Key? key,
    required this.roomType,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Book your desired room",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            "Choose the best room for you",
            style: TextStyle(
                color: lighter, fontSize: 12, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(image),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomType,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
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
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("Room: "),
                          SizedBox(
                            width: 10,
                            child: TextField(
                              controller: TextEditingController(text: "1"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width:10,
                      ),
                      Row(
                        children: [
                          Text("Date: "),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: TextEditingController(text: "12-12-2024"),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/success');
            },
            child: Center(
              child: Text('Booking'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: blueNormal,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
