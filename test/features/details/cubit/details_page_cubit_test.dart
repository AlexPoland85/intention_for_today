// import 'dart:math';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:intention_for_today/domain/models/items_model.dart';
// import 'package:intention_for_today/features/details/cubit/details_page_cubit.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:intention_for_today/domain/repositories/items_repository.dart';
// import 'package:intention_for_today/app/core/enums.dart';

// class MockItemsRepository extends Mock implements ItemsRepository {}

// void main() {
//   late DetailsPageCubit sut;
//   late MockItemsRepository itemsRepository;
//   late List<ItemsModel> allItems;
//   late ItemsModel randomItem;

//   setUp(() async {
//     itemsRepository = MockItemsRepository();
//     sut = DetailsPageCubit(itemsRepository);
//   });

//   group('drawItem', () {
//     group('success', () {
//       setUp(() async {
//         final List<ItemsModel> items = [
//           ItemsModel(id: '1', items: 'item1', usersItems: ''),
//         ];

//         final List<ItemsModel> usersItems = [
//           ItemsModel(id: '2', items: '', usersItems: 'usersItem1'),
//         ];
//         allItems = items + usersItems;

//         Random random = Random();
//         randomItem = allItems[random.nextInt(allItems.length)];
//       });
//       blocTest<DetailsPageCubit, DetailsPageState>(
//           'emits status loading and status success with selected item',
//           build: () => sut,
//           act: (cubit) => cubit.drawItem(id: 'id'),
//           expect: () => [
//                 DetailsPageState(
//                   status: Status.loading,
//                 ),
//                 DetailsPageState(
//                   status: Status.success,
//                   id: 'id',
//                   selectedItem: randomItem,
//                 ),
//               ]);
//     });
//     group('failure', () {
//       setUp(() {
//         when(() => itemsRepository.getItems('id'))
//             .thenThrow(Exception('test-error'));
//         when(() => itemsRepository.getUsersItems('id'))
//             .thenThrow(Exception('test-error'));
//       });
//     });
//     blocTest<DetailsPageCubit, DetailsPageState>(
//       'emits status loading and status error with errorMessage',
//       build: () => sut,
//       act: (cubit) => cubit.drawItem(id: 'id'),
//       expect: () => [
//         DetailsPageState(status: Status.loading),
//         DetailsPageState(
//           status: Status.error,
//           errorMessage: 'Exception: test-error',
//         ),
//       ],
//     );
//   });

//   group('deleteItems', () {
//     group('success', () {
//       setUp(() {
//         when(() => itemsRepository.deleteUsersItem('id'))
//             .thenAnswer((_) async => []);
//       });
//       blocTest<DetailsPageCubit, DetailsPageState>(
//         'emits status loading then status success after deleting usersItem',
//         build: () => sut,
//         act: (cubit) => cubit.deleteItems(id: 'id'),
//         expect: () => [
//           DetailsPageState(status: Status.loading),
//           DetailsPageState(status: Status.success, id: 'id'),
//         ],
//       );
//     });

//     group('failure', () {
//       setUp(() {
//         when(() => itemsRepository.deleteUsersItem('id'))
//             .thenThrow(Exception('test-error'));
//       });

//       blocTest<DetailsPageCubit, DetailsPageState>(
//         'emits status loading and status error with errorMessage',
//         build: () => sut,
//         act: (cubit) => cubit.deleteItems(id: 'id'),
//         expect: () => [
//           DetailsPageState(status: Status.loading),
//           DetailsPageState(
//             status: Status.error,
//             errorMessage: 'Exception: test-error',
//           ),
//         ],
//       );
//     });
//   });
// }
