import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/cart_model.dart';
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
      ProviderWidgets.showFlutterToast(
          context, "Product added to cart Successfully");
    }

    saveDataToSharedPreferences(context);
  }

  void removeItemFromCart(CartModel item, BuildContext context) {
    state.removeWhere((element) => element == item);
    saveDataToSharedPreferences(context);
    loadCart();
    totalAmount();
  }

  Future<void> saveDataToSharedPreferences(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> cartedItemList =
        state.map((item) => jsonEncode(item.toJson())).toList();
    await pref.setStringList('cart', cartedItemList);
  }

  void updateCartItemQuantity(
      CartModel item, int quantity, BuildContext context) {
    int index = state.indexWhere((element) => element == item);
    if (index != -1) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) state[i].copywith(quantity: quantity) else state[i]
      ];
    }
  }

  double totalAmount() {
    double totalAmount = 0;
    if (state.isNotEmpty) {
      for (int i = 0; i < state.length; i++) {
        totalAmount += state[i].quantity * state[i].product.price;
      }
    } else {
      totalAmount = 0;
    }
    return totalAmount.ceilToDouble();
  }

  Future<void> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      state =
          cartJson.map((item) => CartModel.fromJson(jsonDecode(item))).toList();
    } else {
      state = [];
    }
  }
}
