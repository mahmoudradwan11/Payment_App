import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/controller/cubit.dart';
import 'package:payment_app/core/controller/states.dart';
import 'package:payment_app/core/network/constant.dart';
import 'package:payment_app/modules/screens/ref_code.dart';
import 'package:payment_app/modules/screens/visa.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if(state is GetRefCodeSuccess){
            Navigator.push(
                context, MaterialPageRoute(builder:(context)
            =>const RefCode(),
            )
            );
          }
        },
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Toggle Screen'),
              centerTitle: true,
            ),
            body: Padding(
              padding:const EdgeInsets.all(18.0),
              child: Column(
                children: [
                      Expanded(child:
                      InkWell(
                        onTap:(){
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.black12,
                            border: Border.all(color: Colors.black,width: 2.0)
                          ),
                          child: const Image(image:NetworkImage(AppImages.refCodeImage),),
                        ),
                      )),
                      const SizedBox(
                    height: 10,
                  ),
                      Expanded(child:
                  InkWell(
                    onTap:(){
                      Navigator.push(
                          context, MaterialPageRoute(builder:(context)
                      =>const VisaScreen(),
                      ));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black12,
                          border: Border.all(color: Colors.black,width: 2.0)
                      ),
                      child: const Image(image:NetworkImage(AppImages.visaImage),),
                    ),
                  ))
                  
                ],
              ),
            ),
          );
        });
  }
}
