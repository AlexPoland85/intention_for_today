import 'package:flutter_test/flutter_test.dart';
import 'package:intention_for_today/data/remote_data_sources_firebase/items_remote_data_source.dart';
import 'package:intention_for_today/domain/models/items_model.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:async';

class MockItemsDataSource extends Mock implements ItemsRemoteDataSource {}

void main() {
  late ItemsRepository sut;
  late MockItemsDataSource itemsDataSource;

  setUp(() {
    itemsDataSource = MockItemsDataSource();
    sut = ItemsRepository(itemsDataSource);
  });

  final testItemsModel = ItemsModel(
    id: '1',
    items: 'item1',
    usersItems: '',
  );

  final testUsersItemsModel = ItemsModel(
    id: '1',
    items: '',
    usersItems: 'usersItem1',
  );
  group('getItems', () {
    test('should call _itemsRemoteDataSource.getItems() method', () async {
      //1
      when(() => itemsDataSource.getItems())
          .thenAnswer((_) => Stream.value([]));
      //2
      sut.getItems('item1');
      //3
      verify(() => itemsDataSource.getItems()).called(1);
    });

    test('should get items data from Firebase', () {
      when(() => itemsDataSource.getItems())
          .thenAnswer((_) => Stream.value([testItemsModel]));

      final result = sut.getItems('item1');

      expect(result, emits([testItemsModel]));
    });
  });

  group('getUsersItems', () {
    test('should call _itemsRemoteDataSource.getUsersItems() method', () async {
      //1
      when(() => itemsDataSource.getUsersItems())
          .thenAnswer((_) => Stream.value([]));
      //2
      sut.getUsersItems('item1');
      //3
      verify(() => itemsDataSource.getUsersItems()).called(1);
    });

    test('should get usersItems data from Firebase', () {
      when(() => itemsDataSource.getUsersItems())
          .thenAnswer((_) => Stream.value([testUsersItemsModel]));

      final result = sut.getUsersItems('item1');

      expect(result, emits([testUsersItemsModel]));
    });
  });

  group('deleteUsersItem', () {
    test('should call _itemsRemoteDataSource.deleteUsersItem() method',
        () async {
      when(() => itemsDataSource.deleteUsersItem('id'))
          .thenAnswer((_) async => []);

      sut.deleteUsersItem('id');

      verify(() => itemsDataSource.deleteUsersItem('id')).called(1);
    });
  });

  group('addUsersItem', () {
    test('should add usersItem data to Firebase', () async {
      when(() => itemsDataSource.addUsersItem('content1'))
          .thenAnswer((_) async => []);

      await sut.addUsersItem('content1');

      verify(() => itemsDataSource.addUsersItem('content1')).called(1);
    });
  });
}
