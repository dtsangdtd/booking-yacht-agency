abstract class PaymentRepo {
  Future<String> getPayment(String orderId, String ip);
}
