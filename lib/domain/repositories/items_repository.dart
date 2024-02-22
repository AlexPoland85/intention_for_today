import 'package:intention_for_today/data/remote_data_sources_firebase/items_remote_data_source.dart';
import 'package:intention_for_today/domain/models/items_model.dart';

class ItemsRepository {
  ItemsRepository(this._itemsRemoteDataSource);

  final ItemsRemoteDataSource _itemsRemoteDataSource;

  Stream<List<ItemsModel>> getItems(String id) {
    return _itemsRemoteDataSource.getItems();
  }

  Stream<List<ItemsModel>> getUsersItems(String id) {
    return _itemsRemoteDataSource.getUsersItems();
  }

  Future<void> addUsersItem(String content) async {
    await _itemsRemoteDataSource.addUsersItem(content);
  }

  Future<void> deleteUsersItem(String id) async {
    await _itemsRemoteDataSource.deleteUsersItem(id);
  }
}
