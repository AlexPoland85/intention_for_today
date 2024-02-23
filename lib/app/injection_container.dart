import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intention_for_today/app/injection_container.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => 'My base url';
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}

// void confugureDependencies() {
//   getIt.registerFactory(() => RootPageCubit());
//   getIt.registerFactory(() => HomePageCubit(getIt()));
//   getIt.registerFactory(() => AddPageCubit(getIt()));
//   getIt.registerFactory(() => DetailsPageCubit(getIt()));
//   getIt.registerFactory(() => AuthCubit(getIt()));

//   getIt.registerFactory(() => ItemsRepository(getIt()));
//   getIt.registerFactory(() => LoginAuthRepository(getIt()));

//   getIt.registerFactory(() => ItemsRemoteDataSource());
//   getIt.registerFactory(() => LoginAuthDataSource());
// }
