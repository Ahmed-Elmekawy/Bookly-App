abstract class PaymentStates {}

final class PaymentInitial extends PaymentStates {}

final class PaymentLoading extends PaymentStates {}

final class PaymentSuccess extends PaymentStates {}

final class PaymentFailure extends PaymentStates {}
