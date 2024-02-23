// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:intention_for_today/app/cubit/root_page_cubit.dart' as _i7;
import 'package:intention_for_today/app/injection_container.dart' as _i13;
import 'package:intention_for_today/data/remote_data_sources_firebase/items_remote_data_source.dart'
    as _i3;
import 'package:intention_for_today/data/remote_data_sources_firebase/login_auth_data_source.dart'
    as _i5;
import 'package:intention_for_today/domain/repositories/items_repository.dart'
    as _i4;
import 'package:intention_for_today/domain/repositories/login_auth_repository.dart'
    as _i6;
import 'package:intention_for_today/features/add/cubit/add_page_cubit.dart'
    as _i8;
import 'package:intention_for_today/features/auth/cubit/auth_cubit.dart' as _i9;
import 'package:intention_for_today/features/details/cubit/details_page_cubit.dart'
    as _i10;
import 'package:intention_for_today/features/home/cubit/home_page_cubit.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.ItemsRemoteDataSource>(() => _i3.ItemsRemoteDataSource());
    gh.factory<_i4.ItemsRepository>(
        () => _i4.ItemsRepository(gh<_i3.ItemsRemoteDataSource>()));
    gh.factory<_i5.LoginAuthDataSource>(() => _i5.LoginAuthDataSource());
    gh.factory<_i6.LoginAuthRepository>(
        () => _i6.LoginAuthRepository(gh<_i5.LoginAuthDataSource>()));
    gh.factory<_i7.RootPageCubit>(() => _i7.RootPageCubit());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i8.AddPageCubit>(
        () => _i8.AddPageCubit(gh<_i4.ItemsRepository>()));
    gh.factory<_i9.AuthCubit>(
        () => _i9.AuthCubit(gh<_i6.LoginAuthRepository>()));
    gh.factory<_i10.DetailsPageCubit>(
        () => _i10.DetailsPageCubit(gh<_i4.ItemsRepository>()));
    gh.lazySingleton<_i11.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i12.HomePageCubit>(
        () => _i12.HomePageCubit(gh<_i4.ItemsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
