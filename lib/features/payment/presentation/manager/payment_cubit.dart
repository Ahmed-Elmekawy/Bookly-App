import 'package:bookly/core/utils/stripe_service.dart';
import 'package:bookly/features/payment/data/models/payment_intent_input_model.dart';
import 'package:bookly/features/payment/presentation/manager/payment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit():super(PaymentInitial());

  static PaymentCubit get(context){
    return BlocProvider.of(context);
  }
  makePayment(PaymentIntentInputModel paymentIntentInputModel)async{
    emit(PaymentLoading());
    try{
      await StripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      emit(PaymentSuccess());
    }
    on StripeException catch(e){
      emit(PaymentFailure());
      print(e.toString());
    }
    catch(e){
      emit(PaymentFailure());
      print(e.toString());
    }
  }
}