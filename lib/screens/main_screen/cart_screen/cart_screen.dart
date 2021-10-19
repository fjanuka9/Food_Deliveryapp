import 'package:flutter/material.dart';
import 'package:foodapp/components/custom_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(
          text: 'Cart Screen',
          fontSize: 25,
        ),
      ),
    );
  }
}
