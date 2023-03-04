// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../domain/auth/datasource/auth_datasource.dart' as _i14;
import '../../domain/auth/repository/auth_repo.dart' as _i15;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i16;
import '../../flows/auth/data/repositories/auth_repository_impl.dart' as _i18;
import '../../flows/auth/domain/repositories/auth_repository.dart' as _i17;
import '../../flows/auth/domain/usecases/sign_in.dart' as _i19;
import '../../flows/auth/domain/usecases/sign_out.dart' as _i20;
import '../../flows/auth/domain/usecases/sign_up.dart' as _i21;
import '../../flows/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i23;
import '../../flows/auth/presentation/pages/sign_up/cubit/sign_up_cubit.dart'
    as _i24;
import '../../flows/menu/presentation/pages/map/cubit/map_cubit.dart' as _i9;
import '../../flows/splash/presentation/pages/splash/cubit/splash_cubit.dart'
    as _i12;
import '../../navigation/app_state_cubit/app_state_cubit.dart' as _i22;
import '../../themes/theme_data_values.dart' as _i13;
import '../app_intenal_notification_system/bloc/app_intenal_notifications_bloc.dart'
    as _i3;
import '../firestore/firestore_users.dart' as _i7;
import 'injectible_init.dart' as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AppInternalNotificationsBloc>(
      () => _i3.AppInternalNotificationsBloc());
  gh.lazySingleton<_i4.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i6.FirebaseFirestore>(() => registerModule.firestore);
  gh.factory<_i7.FirestoreUsers>(
      () => _i7.FirestoreUsers(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i8.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i9.MapCubit>(() => _i9.MapCubit());
  await gh.factoryAsync<_i10.PackageInfo>(
    () => registerModule.packageInfo,
    preResolve: true,
  );
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i12.SplashCubit>(() => _i12.SplashCubit());
  gh.lazySingleton<_i13.ThemeDataValues>(() => _i13.ThemeDataValues());
  gh.factory<_i14.AuthDataSourceI>(() => _i14.AuthDataSourceImpl(
        firebaseAuth: get<_i5.FirebaseAuth>(),
        firestoreUsers: get<_i7.FirestoreUsers>(),
      ));
  gh.factory<_i15.AuthRepositoryI>(
      () => _i16.AuthRepositoryImplementation(get<_i14.AuthDataSourceI>()));
  gh.factory<_i17.AuthRepositoryI>(
      () => _i18.AuthRepositoryImpl(get<_i14.AuthDataSourceI>()));
  gh.factory<_i19.SignInUseCase>(
      () => _i19.SignInUseCase(get<_i17.AuthRepositoryI>()));
  gh.factory<_i20.SignOutUseCase>(
      () => _i20.SignOutUseCase(get<_i17.AuthRepositoryI>()));
  gh.factory<_i21.SignUpUseCase>(
      () => _i21.SignUpUseCase(get<_i17.AuthRepositoryI>()));
  gh.factory<_i22.AppStateCubit>(() => _i22.AppStateCubit(
        authRepository: get<_i15.AuthRepositoryI>(),
        firebaseAuth: get<_i5.FirebaseAuth>(),
      ));
  gh.factory<_i23.SignInCubit>(
      () => _i23.SignInCubit(get<_i19.SignInUseCase>()));
  gh.factory<_i24.SignUpCubit>(
      () => _i24.SignUpCubit(get<_i21.SignUpUseCase>()));
  return get;
}

class _$RegisterModule extends _i25.RegisterModule {}
