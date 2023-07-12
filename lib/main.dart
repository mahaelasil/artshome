import 'package:arts_home/business_logic/app_cubit.dart';

import 'package:arts_home/presentaion/router/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/my_block_observer.dart';
import 'data/data_providers/my_dio.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  MyDio.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Arts Home',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}