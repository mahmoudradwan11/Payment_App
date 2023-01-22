import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/controller/cubit.dart';
import 'package:payment_app/core/controller/states.dart';
import 'package:payment_app/modules/screens/toggle_screen.dart';
import 'package:payment_app/modules/widgets/default_botton.dart';
import 'package:payment_app/modules/widgets/default_text_form_Filed.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if(state is GetPaymentRequestSuccess){
            Navigator.push(
                context, MaterialPageRoute(builder:(context)
            =>const ToggleScreen(),
            )
            );
          }
        },
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Payment Integration'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 350,
                        child: const Image(
                            image: AssetImage('images/Delivery.png'))),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DefaultTextFormFiled(
                                    controller: firstNameController,
                                    type: TextInputType.text,
                                    hintText: 'Fisrt Name',
                                    prefix: Icons.person,
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter First Name';
                                      }
                                      return null;
                                    }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: DefaultTextFormFiled(
                                    controller: lastNameController,
                                    type: TextInputType.text,
                                    hintText: 'Last Name',
                                    prefix: Icons.person,
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter LastName Name';
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextFormFiled(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              hintText: 'Email',
                              prefix: Icons.email,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Email';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextFormFiled(
                              controller: priceController,
                              type: TextInputType.text,
                              hintText: 'Price',
                              prefix: Icons.price_change,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter price';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextFormFiled(
                              controller: phoneController,
                              type: TextInputType.phone,
                              hintText: 'Phone',
                              prefix: Icons.phone,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Phone';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultButton(
                            radius: 10,
                            backgroundColor: Colors.purple,
                            buttonWidget: const Text('Register',
                              style: TextStyle(color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 1.7),),
                            function: () {
                              if (formKey.currentState!.validate()) {
                               cubit.getOrderId(
                                   firstName: firstNameController.text,
                                   lastName: lastNameController.text,
                                   email: emailController.text,
                                   price: priceController.text.toString(),
                                   phone: phoneController.text
                               );
                              }
                            },
                          ),
                        ],
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
}
