import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/controller/cubit.dart';
import 'package:payment_app/core/controller/states.dart';
import 'package:payment_app/modules/screens/register_screen.dart';

import 'core/network/dio_helper.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentCubit()..getAuthToken(),
        child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {},
    builder: (context, state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RegisterScreen(),
    );
  }
        )
    );
  }
}