import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/controller/states.dart';
import 'package:payment_app/core/network/constant.dart';
import 'package:payment_app/core/network/dio_helper.dart';
import 'package:payment_app/modules/widgets/tost.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    DioHelper.postData(
        url: ApiConstant.getAuthToken,
        data: {"api_key": ApiConstant.apiKey}).then((value) {
      ApiConstant.paymentFirstToken = value.data['token'];
      print('The token is = ${ApiConstant.paymentFirstToken}');
      emit(PaymentAuthSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PaymentAuthErrorState());
    });
  }

  Future<void> getOrderId({
    required String firstName,
    required String lastName,
    required String email,
    required String price,
    required String phone,
  }) async {
    emit(GetOrderIdLoading());
    DioHelper.postData(
      url: ApiConstant.getOrderId,
      data: {
        "auth_token": ApiConstant.paymentFirstToken,
        "delivery_needed": "false",
        "amount_cents": price,
        "currency": "EGP",
        "items": [],
      },
    ).then((value){
      ApiConstant.paymentOrderId = value.data['id'].toString();
      print('OrderId = ${ApiConstant.paymentOrderId}');
      getPaymentRequest(
          firstName: firstName,
          lastName: lastName,
          email: email,
          price: price,
          phone: phone
      );
      emit(GetOrderIdSuccess());
    }).catchError((error){
      print('error occur ${error.toString()}');
      emit(GetOrderIdError());
    });
  }
  Future<void>getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String price,
    required String phone,
  })async{
    emit(GetPaymentRequestLoading());
    DioHelper.postData(url:ApiConstant.getPaymentKey,data: {
      "auth_token": ApiConstant.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id":ApiConstant.paymentOrderId,
      "billing_data": {
        "apartment": "NA",
        "email":email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": ApiConstant.idCard,
    }).then((value){
      ApiConstant.finalToken =value.data['token'];
      print('Final Token = ${ApiConstant.finalToken}');
      showToast(ApiConstant.paymentOrderId,ToastStates.SUCCESS);
      emit(GetPaymentRequestSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetPaymentRequestError());
    });
  }
  Future<void>getRefCode()async{
    emit(GetRefCodeLoading());
    DioHelper.postData(url:ApiConstant.getRefCode,data:
    {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR"
      },
      "payment_token": ApiConstant.finalToken
    }).then((value){
      print('Get Final Ref Code');
      ApiConstant.refCode = value.data['id'].toString();
      print('Ref code is = ${ApiConstant.refCode}');
      emit(GetRefCodeSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetRefCodeError());
    });
  }
}
