import 'package:booking_app/bloc/scroll/scroll_cubit.dart';
import 'package:booking_app/constant/color.dart';
import 'package:booking_app/data/dummy/home_data.dart';
import 'package:booking_app/presentation/widgets/booking_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    final data = hotels[id - 1];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail',
            style: TextStyle(
                color: blackNormal, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Stack(children: [
          BlocListener<ScrollCubit, bool>(
            listener: (context, state) {
              _scrollController.addListener(() {
                if (_scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  context.read<ScrollCubit>().hideButton();
                } else if (_scrollController.position.userScrollDirection ==
                    ScrollDirection.forward) {
                  context.read<ScrollCubit>().showButton();
                }
              });
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  controller: _scrollController,
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  image: AssetImage(
                                    data.background,
                                  ),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  data.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "Rp " + data.price.toString(),
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
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/location.svg",
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                      blueNormal, BlendMode.srcIn),
                                ),
                                Text(
                                  data.address,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: lighter),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              data.description,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: lighter),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Preview',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.previewImages.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                  image: AssetImage(data
                                                      .previewImages[index]),
                                                  fit: BoxFit.cover)),
                                        ),
                                        index != data.previewImages.length - 1
                                            ? const SizedBox(
                                                width: 10,
                                              )
                                            : const SizedBox.shrink()
                                      ],
                                    );
                                  }),
                            ),
                          ]),
                    ),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<ScrollCubit, bool>(
            builder: (context, state) {
              return Positioned(
                bottom: 16.0,
                height: 60,
                left: 10,
                right: 10,
                child: AnimatedOpacity(
                  opacity: state ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: blueNormal,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BookingDialog(
                              roomType: data.name,
                              price: data.price.toString(),
                              description: data.description,
                              image: data.background,
                            );
                          });
                    },
                    child: Text(
                      'Booking Now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              );
            },
          )
        ]));
  }
}
