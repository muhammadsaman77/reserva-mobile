import 'package:booking_app/bloc/home/home_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/dummy/home_data.dart';
import '../widgets/card_item.dart';

class HomePage extends StatelessWidget {
  final data = hotels;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Current location",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: lighter),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/location.svg",
                            width: 20,
                            height: 20,
                            colorFilter:
                                ColorFilter.mode(blueNormal, BlendMode.srcIn),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Balikpapan, Indonesia",
                              style: TextStyle(
                                  color: blackNormal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14)),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        minimumSize: Size(40, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: whiteActive, width: 1),
                        )),
                    onPressed: () {},
                    child: SvgPicture.asset(
                      "assets/icons/notification-bing.svg",
                      width: 24,
                      colorFilter:
                          ColorFilter.mode(blackNormal, BlendMode.srcIn),
                      height: 24,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(90, 40),
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.white,
                      elevation: 0.5,
                      backgroundColor: blueNormal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Hotel"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(90, 40),
                      padding: EdgeInsets.zero,
                      foregroundColor: lighter,
                      elevation: 0.5,
                      backgroundColor: light,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Homestay"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(90, 40),
                      padding: EdgeInsets.zero,
                      foregroundColor: lighter,
                      elevation: 0.5,
                      backgroundColor: light,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Apart"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: lighter,
              thickness: 0.3,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 330,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Near Location",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: blackNormal),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: blueNormal),
                            ))
                      ],
                    ),
                    Expanded(
                      child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                        if (state is HomeInitial) {
                          context.read<HomeBloc>().add(FetchHotels());

                        }
                        if (state is HomeLoaded) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                return CardItem(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/detail',
                                        arguments: state.data[index].id);
                                  },
                                  address: state.data[index].address,
                                  imagePath: state.data[index].images[0],
                                  itemName: state.data[index].name,
                                  price: state.data[index].price.toString(),
                                  rating: state.data[index].rating,
                                );
                              });
                        }

                        return const CircularProgressIndicator();
                      }),
                    )
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: lighter,
              thickness: 0.3,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Others",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: blackNormal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeInitial) {
                          context.read<HomeBloc>().add(FetchHotels());
                        }
                        if (state is HomeLoaded) {
                          return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 9 / 12),
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                return CardItem(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/detail',
                                        arguments: state.data[index].id);
                                  },
                                  address: state.data[index].address,
                                  imagePath: state.data[index].images[0],
                                  itemName: state.data[index].name,
                                  price: state.data[index].price.toString(),
                                  rating: state.data[index].rating,
                                );
                              });
                        }

                        return const CircularProgressIndicator();
                      }
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
