import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/models/items_model.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'package:intention_for_today/features/home/cubit/home_page_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockItemsRepository extends Mock implements ItemsRepository {}

void main() {
  late HomePageCubit sut;
  late MockItemsRepository itemsRepository;

  setUp(() {
    itemsRepository = MockItemsRepository();
    sut = HomePageCubit(itemsRepository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => itemsRepository.getItems('id'))
            .thenAnswer((_) => Stream.value([
                  ItemsModel(id: '1', items: 'item1', usersItems: ''),
                ]));
        when(() => itemsRepository.getUsersItems('id'))
            .thenAnswer((_) => Stream.value([
                  ItemsModel(id: '2', items: '', usersItems: 'usersItem1'),
                ]));
      });
      blocTest<HomePageCubit, HomePageState>(
        'emits status loading than status success with items',
        build: () => sut,
        act: (cubit) => cubit.start(id: 'id'),
        expect: () => [
          HomePageState(status: Status.loading),
          HomePageState(
            status: Status.success,
            id: 'id',
            items: [
              ItemsModel(id: '1', items: 'item1', usersItems: ''),
              ItemsModel(id: '2', items: '', usersItems: 'usersItem1')
            ],
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => itemsRepository.getItems('id'))
            .thenThrow(Exception('test-error'));
      });
      blocTest<HomePageCubit, HomePageState>(
        'emits status loading and status error with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.start(id: 'id'),
        expect: () => [
          HomePageState(status: Status.loading),
          HomePageState(
            status: Status.error,
            errorMessage: 'Exception: test-error',
          ),
        ],
      );
    });
  });
}
