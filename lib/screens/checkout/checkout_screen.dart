import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CheckoutScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CheckoutLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        context
                            .read<CheckoutBloc>()
                            .add(ConfirmCheckout(checkout: state.checkout));
                      },
                      child: Text(
                        'ORDER NOW',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    );
                  } else {
                    return const Text('Something went wrong.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(email: value),
                        );
                  }, context, 'Email'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(fullName: value),
                        );
                  }, context, 'Full Name'),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(address: value),
                        );
                  }, context, 'Address'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(city: value),
                        );
                  }, context, 'City'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(country: value),
                        );
                  }, context, 'Country'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(zipCode: value),
                        );
                  }, context, 'Zip Code'),
                  Text(
                    'ORDER SUMMARY',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const OrderSummary(),
                ],
              );
            } else {
              return const Text('Something went wrong.');
            }
          },
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
