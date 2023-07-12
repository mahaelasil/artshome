import 'package:arts_home/business_logic/app_cubit.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:arts_home/core/screens.dart' as screens;

import '../../data/response/tv_shows_response.dart';
import '../styles/colors.dart';
import '../widgets/defult_network_image.dart';
import '../widgets/defult_text.dart';

class TvShowsListItem extends StatelessWidget {
  final StareResults tvShowModel;

  const TvShowsListItem({Key? key, required this.tvShowModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, screens.tvShowsDetailsScreen, arguments: tvShowModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: DefaultText(
                text: tvShowModel.name,
                textSize: 18.sp,
                weight: FontWeight.bold,
                textColor: lightRed,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
                child: DefaultNetworkImage(
                  imageURL: AppCubit.get(context)
                      .imageURL(imagePath: tvShowModel.posterPath),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: DefaultText(
                    text: tvShowModel.overview,
                    textSize: 12.sp,
                    weight: FontWeight.bold,
                    textColor: white,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}