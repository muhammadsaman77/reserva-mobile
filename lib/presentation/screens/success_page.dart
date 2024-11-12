import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Thanks For Booking",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "You room’s ready for vacation",
                      style:
                          TextStyle(color: lighter, fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SvgPicture.asset('assets/icons/check.svg'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueNormal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Text("Back To Home",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
