import 'package:bookly/core/utils/api_keys.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:bookly/features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  static final  ApiService apiService = ApiService();
  static Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.postData(
      data: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  static Future initPaymentSheet(
      {required InitiPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Ahmed',
      ),
    );
  }

  static Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  static Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var  paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  static Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.postData(
        data: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        contentType: Headers.formUrlEncodedContentType,
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2023-08-16',
        });

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }
}
