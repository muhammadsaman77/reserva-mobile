import 'package:booking_app/bloc/detail/detail_bloc.dart';
import 'package:booking_app/bloc/scroll/scroll_cubit.dart';
import 'package:booking_app/constant/color.dart';
import 'package:booking_app/presentation/widgets/booking_dialog.dart';
import 'package:booking_app/util/string_manipulation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    context.read<DetailBloc>().add(FetchDetailHotel(id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(
              color: blackNormal, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
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
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: BlocBuilder<DetailBloc, DetailState>(
                      builder: (context, state) {
                        if (state is DetailLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is DetailLoaded) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: NetworkImage(state.heroImage),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text(
                                      toTitleCase(state.hotel.name),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "Rp " + state.hotel.price.toString(),
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
                                SizedBox(height: 5),
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
                                      state.hotel.address,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: lighter),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  state.hotel.description,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: lighter),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Preview',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 12),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.hotel.images.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          GestureDetector(
                                            onTap: ()
                                      {
                                        context.read<DetailBloc>().add(
                                            ChangeHeroImage(
                                                state.hotel.images[index]));
                                      },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        state.hotel.images[index]),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          index != state.hotel.images.length - 1
                                              ? const SizedBox(width: 10)
                                              : const SizedBox.shrink()
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
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
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {

                                return  BookingDialog(
                                );
                        },
                      );
                    },
                    child: Text(
                      'Booking Now',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
