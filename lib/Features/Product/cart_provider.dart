import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartNotifier extends StateNotifier<List<CartModel>> {
  CartNotifier(super._state) {
    loadCart();
  }
  void addItemToCart(CartModel cartItem, BuildContext context) {
    state = state.map((item) {
      if (item.product.productId == cartItem.product.productId) {
        ProviderWidgets.showFlutterToast(context, "Already present product");
        return CartModel(
          product: item.product,
          quantity: item.quantity + cartItem.quantity,
        );
      }
      return item;
    }).toList();

    if (!state
        .any((item) => item.product.productId == cartItem.product.productId)) {
      state = [...state, cartItem];
    }
    saveDataToSharedPreferences();
  }

  void removeItemFromCart(CartModel item) {
    state.removeWhere((element) => element == item);
  }

  void saveDataToSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();

    pref.setString(
        'cart', jsonEncode(state.map((item) => item.toJson()).toList()));
  }

  void updateCartItemQuantity(CartModel item, int quantity) {
    int index = state.indexWhere((element) => element == item);
    state[index].copywith(quantity: quantity);
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('cart')) {
      state = (json.decode(prefs.getString('cart')!) as List)
          .map((item) => CartModel.fromJson(item))
          .toList();
    }
    else{

    }
  }
}
