class ApiConstant{
  // https://accept.paymob.com/api/auth/tokens
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static const apiKey = 'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPalkzTkRnek1Td2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuYzg3dG1oTi1IMi1RNWlEZ1BBdEFZUUZnbUJWTFRrLWRlYTF1OG1TMVlmNU1hTVotOUJGMUNmRTJYZElaQzFzYkhSVl8xTWZLa3dCdmRpNlNPbWdfS0E=';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentKey ='/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';
  static  String idKiosk = '3293606';
  static String idCard = '3293535';
  static String finalToken = '';
  static String refCode = '';
}
class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}