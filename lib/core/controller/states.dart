abstract class PaymentStates {}
class InitialState extends PaymentStates{}
class PaymentAuthLoadingState extends PaymentStates{}
class PaymentAuthSuccessState extends PaymentStates{}
class PaymentAuthErrorState extends PaymentStates{}
class GetOrderIdLoading extends PaymentStates{}
class GetOrderIdSuccess extends PaymentStates{}
class GetOrderIdError extends PaymentStates{}
class GetPaymentRequestLoading extends PaymentStates{}
class GetPaymentRequestSuccess extends PaymentStates{}
class GetPaymentRequestError extends PaymentStates{}

class GetRefCodeLoading extends PaymentStates{}
class GetRefCodeSuccess extends PaymentStates{}
class GetRefCodeError extends PaymentStates{}




