import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobX/model/post_model.dart';
import 'package:pattern_mobX/pages/home_page.dart';
import 'package:pattern_mobX/services/http_service.dart';




class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  @observable bool isLoading = false;
  @observable TextEditingController titleTextEditingController = TextEditingController();
  @observable TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostCreate(BuildContext context)  async {
    isLoading = true;

    Post post = Post(title: titleTextEditingController.text, body: bodyTextEditingController.text, userId: Random().nextInt(pow(2, 30) - 1));

    var response = await Network.GET(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }

    isLoading = false;
  }
}