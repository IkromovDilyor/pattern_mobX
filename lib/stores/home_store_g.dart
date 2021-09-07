import 'package:mobx/mobx.dart';
import 'package:pattern_mobX/model/post_model.dart';

mixin _$HomeStore on _HomeStore, Store {
  final _$itemsAtom = Atom(name: '_HomeStore.items');

  @override
  List<Post> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Post> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeStore.isLoading');

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

  @override
  String toString() {
    return '''
items: ${items},
isLoading: ${isLoading}
    ''';
  }
}