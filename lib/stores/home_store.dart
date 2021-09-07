import 'package:mobx/mobx.dart';
import 'package:pattern_mobX/model/post_model.dart';
import 'package:pattern_mobX/services/http_service.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable List<Post> items = List();
  @observable bool isLoading = false;

  Future apiPostList() async {
    isLoading = true;

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if (response != null) {
      items = Network.parsePostList(response);
    }

    isLoading = false;
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;

    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading = false;

    return response != null;
  }
}