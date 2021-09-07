
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

mixin _$UpdateStore on _UpdateStore, Store {
  final _$isLoadingAtom = Atom(name: '_UpdateStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$titleTextEditingControllerAtom =
  Atom(name: '_UpdateStore.titleTextEditingController');

  @override
  TextEditingController get titleTextEditingController {
    _$titleTextEditingControllerAtom.reportRead();
    return super.titleTextEditingController;
  }

  @override
  set titleTextEditingController(TextEditingController value) {
    _$titleTextEditingControllerAtom
        .reportWrite(value, super.titleTextEditingController, () {
      super.titleTextEditingController = value;
    });
  }

  final _$bodyTextEditingControllerAtom =
  Atom(name: '_UpdateStore.bodyTextEditingController');

  @override
  TextEditingController get bodyTextEditingController {
    _$bodyTextEditingControllerAtom.reportRead();
    return super.bodyTextEditingController;
  }

  @override
  set bodyTextEditingController(TextEditingController value) {
    _$bodyTextEditingControllerAtom
        .reportWrite(value, super.bodyTextEditingController, () {
      super.bodyTextEditingController = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
titleTextEditingController: ${titleTextEditingController},
bodyTextEditingController: ${bodyTextEditingController}
    ''';
  }
}