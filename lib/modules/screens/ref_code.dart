import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/controller/cubit.dart';
import 'package:payment_app/core/controller/states.dart';
import 'package:payment_app/core/network/constant.dart';
import 'package:payment_app/modules/screens/register_screen.dart';

class RefCode extends StatelessWidget {
  const RefCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Reference Code'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    paymentExitApp(context);
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'You should go to any market to pay',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'This is reference code',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.purple.shade300,
                      ),
                      child: Center(
                        child: Text(
                          ApiConstant.refCode.isEmpty ? '🚫' : ApiConstant
                              .refCode,
                          style: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Are you sure not completed the pay',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                navigateAndFinish(
                  context,
                  RegisterScreen(),
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false,
  );
}