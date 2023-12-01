import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/detail_pages.dart/cubit/store_page_info_cubits.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailsState detail = state as DetailsState;
      var list = BlocProvider.of<StorePageInfoCubits>(context).state;
      for (int i = 0; i < list.length; i++) {
        if (list[i].name == detail.places.name) {
          selectedIndex = list[i].index!;
        }
      }
      gottenStar = detail.places.stars;
      return Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/" +
                                    detail.places.img),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 270,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined),
                        color: Colors.white,
                      ),
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                  text: detail.places.name,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                AppLargeText(
                                  text: "\$ ${detail.places.price}",
                                  color: AppColors.mainColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.mainColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                  text: detail.places.location,
                                  color: AppColors.textColor1,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Wrap(
                                    children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: gottenStar > index
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                })),
                                SizedBox(
                                  width: 10,
                                ),
                                AppText(
                                  text: "(${detail.places.stars})",
                                  color: AppColors.textColor2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            AppLargeText(
                              text: "People",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: "Number of people in your group",
                              color: AppColors.mainTextColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              children: List.generate(
                                  detail.places.people,
                                  (index) => InkWell(
                                        onTap: () {
                                          var data = state.places;
                                          var list = BlocProvider.of<
                                                  StorePageInfoCubits>(context)
                                              .state;
                                          for (int i = 0;
                                              i < list.length;
                                              i++) {
                                            if (list[i].name == data.name) {
                                              if (list[i].index == index) {
                                                print("Match found");
                                              }else{
                                                BlocProvider.of<
                                                        StorePageInfoCubits>(
                                                    context)
                                                .updatePageInfo(
                                                    detail.places.name, index);
                                              }
                                            }
                                          }

                                          if (selectedIndex == -1) {
                                            BlocProvider.of<
                                                        StorePageInfoCubits>(
                                                    context)
                                                .addPageInfo(
                                                    detail.places.name, index);
                                          }
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: AppButton(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            bgColor: selectedIndex == index
                                                ? Colors.black
                                                : AppColors.buttonBackground,
                                            size: 60,
                                            borderColor: selectedIndex == index
                                                ? Colors.black
                                                : AppColors.buttonBackground,
                                            text: (index + 1).toString(),
                                          ),
                                        ),
                                      )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppLargeText(
                              text: "Description",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: detail.places.description,
                              color: AppColors.mainTextColor,
                            )
                          ]),
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        color: AppColors.textColor1,
                        bgColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        size: 60,
                        isIcon: true,
                        icon: Icons.favorite,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
