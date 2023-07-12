
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../../data/response/tv_shows_response.dart';
import '../../styles/colors.dart';
import '../../widgets/defult_app_bar.dart';
import '../../widgets/defult_network_image.dart';
import '../../widgets/defult_text.dart';


class TvShowsDetailsScreen extends StatelessWidget {

  final StareResults starsModel;

  const TvShowsDetailsScreen({Key? key, required this.starsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: starsModel.name),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [black, darkRed, black],
                )),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
                      child: DefaultNetworkImage(
                        imageURL: AppCubit.get(context)
                            .imageURL(imagePath: starsModel.backdropPath),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: DefaultText(
                          text: starsModel.overview,
                          textSize: 15.sp,
                          weight: FontWeight.bold,
                          textColor: white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}