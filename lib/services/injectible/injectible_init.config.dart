// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../../domain/auth/datasource/auth_datasource.dart' as _i17;
import '../../domain/auth/repository/auth_repo.dart' as _i18;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i19;
import '../../flows/auth/data/repositories/auth_repository_impl.dart' as _i21;
import '../../flows/auth/domain/repositories/auth_repository.dart' as _i20;
import '../../flows/auth/domain/usecases/sign_in.dart' as _i27;
import '../../flows/auth/domain/usecases/sign_out.dart' as _i28;
import '../../flows/auth/domain/usecases/sign_up.dart' as _i29;
import '../../flows/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i32;
import '../../flows/auth/presentation/pages/sign_up/cubit/sign_up_cubit.dart'
    as _i33;
import '../../flows/complete_registration/data/datasources/complete_registration_datasource.dart'
    as _i22;
import '../../flows/complete_registration/data/repositories/complete_registration_repository.dart'
    as _i24;
import '../../flows/complete_registration/domain/repositories/complete_registration_repository.dart'
    as _i23;
import '../../flows/complete_registration/domain/usecases/complete_registration.dart'
    as _i25;
import '../../flows/complete_registration/domain/usecases/get_groups.dart'
    as _i26;
import '../../flows/complete_registration/presentation/pages/cubit/complete_registration_cubit.dart'
    as _i31;
import '../../flows/menu/presentation/pages/create_marker/cubit/create_marker_cubit.dart'
    as _i5;
import '../../flows/menu/presentation/pages/map/cubit/map_cubit.dart' as _i11;
import '../../flows/menu/presentation/pages/pick_marker_location/cubit/pick_marker_location_cubit.dart'
    as _i13;
import '../../flows/splash/presentation/pages/splash/cubit/splash_cubit.dart'
    as _i15;
import '../../navigation/app_state_cubit/app_state_cubit.dart' as _i30;
import '../../themes/theme_data_values.dart' as _i16;
import '../app_intenal_notification_system/bloc/app_intenal_notifications_bloc.dart'
    as _i3;
import '../firestore/firestore_groups.dart' as _i8;
import '../firestore/firestore_users.dart' as _i9;
import 'injectible_init.dart' as _i34; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.CreateMarkerCubit>(() => _i5.CreateMarkerCubit());
  gh.lazySingleton<_i6.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i7.FirebaseFirestore>(() => registerModule.firestore);
  gh.factory<_i8.FirestoreGroups>(
      () => _i8.FirestoreGroups(get<_i7.FirebaseFirestore>()));
  gh.factory<_i9.FirestoreUsers>(
      () => _i9.FirestoreUsers(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i10.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i11.MapCubit>(() => _i11.MapCubit());
  await gh.factoryAsync<_i12.PackageInfo>(
    () => registerModule.packageInfo,
    preResolve: true,
  );
  gh.factory<_i13.PickMarkerLocationCubit>(
      () => _i13.PickMarkerLocationCubit());
  await gh.factoryAsync<_i14.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i15.SplashCubit>(() => _i15.SplashCubit());
  gh.lazySingleton<_i16.ThemeDataValues>(() => _i16.ThemeDataValues());
  gh.factory<_i17.AuthDataSourceI>(() => _i17.AuthDataSourceImpl(
        firebaseAuth: get<_i6.FirebaseAuth>(),
        firestoreUsers: get<_i9.FirestoreUsers>(),
      ));
  gh.factory<_i18.AuthRepositoryI>(
      () => _i19.AuthRepositoryImplementation(get<_i17.AuthDataSourceI>()));
  gh.factory<_i20.AuthRepositoryI>(
      () => _i21.AuthRepositoryImpl(get<_i17.AuthDataSourceI>()));
  gh.factory<_i22.CompleteRegistrationDataSourceI>(
      () => _i22.CompleteRegistrationDataSource(
            get<_i8.FirestoreGroups>(),
            get<_i9.FirestoreUsers>(),
          ));
  gh.factory<_i23.CompleteRegistrationRepositoryI>(() =>
      _i24.CompleteRegistrationRepository(
          get<_i22.CompleteRegistrationDataSourceI>()));
  gh.factory<_i25.CompleteRegistrationUseCase>(() =>
      _i25.CompleteRegistrationUseCase(
          get<_i23.CompleteRegistrationRepositoryI>()));
  gh.factory<_i26.GetGroupsUseCase>(
      () => _i26.GetGroupsUseCase(get<_i23.CompleteRegistrationRepositoryI>()));
  gh.factory<_i27.SignInUseCase>(
      () => _i27.SignInUseCase(get<_i20.AuthRepositoryI>()));
  gh.factory<_i28.SignOutUseCase>(
      () => _i28.SignOutUseCase(get<_i20.AuthRepositoryI>()));
  gh.factory<_i29.SignUpUseCase>(
      () => _i29.SignUpUseCase(get<_i20.AuthRepositoryI>()));
  gh.factory<_i30.AppStateCubit>(() => _i30.AppStateCubit(
        authRepository: get<_i18.AuthRepositoryI>(),
        firebaseAuth: get<_i6.FirebaseAuth>(),
      ));
  gh.factory<_i31.CompleteRegistrationCubit>(
      () => _i31.CompleteRegistrationCubit(
            get<_i26.GetGroupsUseCase>(),
            get<_i25.CompleteRegistrationUseCase>(),
          ));
  gh.factory<_i32.SignInCubit>(
      () => _i32.SignInCubit(get<_i27.SignInUseCase>()));
  gh.factory<_i33.SignUpCubit>(
      () => _i33.SignUpCubit(get<_i29.SignUpUseCase>()));
  return get;
}

class _$RegisterModule extends _i34.RegisterModule {}
