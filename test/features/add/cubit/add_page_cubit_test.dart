import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:intention_for_today/features/add/cubit/add_page_cubit.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'package:intention_for_today/app/core/enums.dart';

class MockItemsRepository extends Mock implements ItemsRepository {}

void main() {
  late AddPageCubit sut;
  late MockItemsRepository itemsRepository;

  setUp(() {
    itemsRepository = MockItemsRepository();
    sut = AddPageCubit(itemsRepository);
  });
  group('addUsersItem', () {
    group('success', () {
      setUp(() {
        when(() => itemsRepository.addUsersItem('content'))
            .thenAnswer((_) async => []);
      });
      blocTest<AddPageCubit, AddPageState>(
          'emits status loading and status success when addUsersItem is called',
          build: () => sut,
          act: (cubit) => cubit.addUsersItem(
                content: 'content',
              ),
          expect: () => [
                AddPageState(
                  status: Status.loading,
                ),
                AddPageState(
                  status: Status.success,
                  saved: true,
                ),
              ]);
    });
    group('failure', () {
      setUp(() {
        when(() => itemsRepository.addUsersItem('content'))
            .thenThrow(Exception('test-error'));
      });
      blocTest<AddPageCubit, AddPageState>(
        'emits status loading and status error with error message',
        build: () => sut,
        act: (cubit) => cubit.addUsersItem(
          content: 'content',
        ),
        expect: () => [
          AddPageState(status: Status.loading),
          AddPageState(
            status: Status.error,
            errorMessage: 'Exception: test-error',
          ),
        ],
      );
    });
  });
}
