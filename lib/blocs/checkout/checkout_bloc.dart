import 'dart:async';

import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;
  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subTotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString,
              )
            : CheckoutLoading()) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

  @override
  Stream<CheckoutState> mapEventToState(
    CheckoutEvent event,
  ) async* {
    if (event is UpdateCheckout) {
      yield* _mapUpdateCheckoutToState(event, state);
    }
    if (event is ConfirmCheckout) {
      yield* _mapConfirmCheckoutToState(event, state);
    }
  }

  Stream<CheckoutState> _mapUpdateCheckoutToState(
    UpdateCheckout event,
    CheckoutState state,
  ) async* {
    if (state is CheckoutLoaded) {
      yield CheckoutLoaded(
        email: event.email ?? state.email,
        fullName: event.fullName ?? state.fullName,
        products: event.cart?.products ?? state.products,
        deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
        subTotal: event.cart?.subtotalString ?? state.subTotal,
        total: event.cart?.subtotalString ?? state.total,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode,
      );
    }
  }

  Stream<CheckoutState> _mapConfirmCheckoutToState(
    ConfirmCheckout event,
    CheckoutState state,
  ) async* {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        yield CheckoutLoading();
      } catch (_) {}
    }
  }
}
