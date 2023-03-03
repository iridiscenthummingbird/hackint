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
import 'package:package_info_plus/package_info_plus.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../domain/auth/datasource/auth_datasource.dart' as _i13;
import '../../domain/auth/repository/auth_repo.dart' as _i14;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i15;
import '../../flows/auth/data/repositories/auth_repository_impl.dart' as _i17;
import '../../flows/auth/domain/repositories/auth_repository.dart' as _i16;
import '../../flows/auth/domain/usecases/sign_in.dart' as _i18;
import '../../flows/auth/domain/usecases/sign_out.dart' as _i19;
import '../../flows/auth/domain/usecases/sign_up.dart' as _i20;
import '../../flows/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i22;
import '../../flows/auth/presentation/pages/sign_up/cubit/sign_up_cubit.dart'
    as _i23;
import '../../flows/splash/presentation/pages/splash/cubit/splash_cubit.dart'
    as _i11;
import '../../navigation/app_state_cubit/app_state_cubit.dart' as _i21;
import '../../themes/theme_data_values.dart' as _i12;
import '../app_intenal_notification_system/bloc/app_intenal_notifications_bloc.dart'
    as _i3;
import '../firestore/firestore_users.dart' as _i7;
import 'injectible_init.dart' as _i24; // ignore_for_file: unnecessary_lambdas

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
  await gh.factoryAsync<_i9.PackageInfo>(
    () => registerModule.packageInfo,
    preResolve: true,
  );
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i11.SplashCubit>(() => _i11.SplashCubit());
  gh.lazySingleton<_i12.ThemeDataValues>(() => _i12.ThemeDataValues());
  gh.factory<_i13.AuthDataSourceI>(() => _i13.AuthDataSourceImpl(
        firebaseAuth: get<_i5.FirebaseAuth>(),
        firestoreUsers: get<_i7.FirestoreUsers>(),
      ));
  gh.factory<_i14.AuthRepositoryI>(
      () => _i15.AuthRepositoryImplementation(get<_i13.AuthDataSourceI>()));
  gh.factory<_i16.AuthRepositoryI>(
      () => _i17.AuthRepositoryImpl(get<_i13.AuthDataSourceI>()));
  gh.factory<_i18.SignInUseCase>(
      () => _i18.SignInUseCase(get<_i16.AuthRepositoryI>()));
  gh.factory<_i19.SignOutUseCase>(
      () => _i19.SignOutUseCase(get<_i16.AuthRepositoryI>()));
  gh.factory<_i20.SignUpUseCase>(
      () => _i20.SignUpUseCase(get<_i16.AuthRepositoryI>()));
  gh.factory<_i21.AppStateCubit>(() => _i21.AppStateCubit(
        authRepository: get<_i14.AuthRepositoryI>(),
        firebaseAuth: get<_i5.FirebaseAuth>(),
      ));
  gh.factory<_i22.SignInCubit>(
      () => _i22.SignInCubit(get<_i18.SignInUseCase>()));
  gh.factory<_i23.SignUpCubit>(
      () => _i23.SignUpCubit(get<_i20.SignUpUseCase>()));
  return get;
}

class _$RegisterModule extends _i24.RegisterModule {}
