// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i16;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../../domain/auth/datasource/auth_datasource.dart' as _i21;
import '../../domain/auth/repository/auth_repo.dart' as _i22;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i23;
import '../../flows/auth/data/repositories/auth_repository_impl.dart' as _i25;
import '../../flows/auth/domain/repositories/auth_repository.dart' as _i24;
import '../../flows/auth/domain/usecases/sign_in.dart' as _i33;
import '../../flows/auth/domain/usecases/sign_out.dart' as _i34;
import '../../flows/auth/domain/usecases/sign_up.dart' as _i35;
import '../../flows/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i38;
import '../../flows/auth/presentation/pages/sign_up/cubit/sign_up_cubit.dart'
    as _i39;
import '../../flows/complete_registration/data/datasources/complete_registration_datasource.dart'
    as _i26;
import '../../flows/complete_registration/data/repositories/complete_registration_repository.dart'
    as _i28;
import '../../flows/complete_registration/domain/repositories/complete_registration_repository.dart'
    as _i27;
import '../../flows/complete_registration/domain/usecases/complete_registration.dart'
    as _i29;
import '../../flows/complete_registration/domain/usecases/get_groups.dart'
    as _i30;
import '../../flows/complete_registration/presentation/pages/cubit/complete_registration_cubit.dart'
    as _i37;
import '../../flows/main/data/datasources/lessons_datasources.dart' as _i12;
import '../../flows/main/data/repositories/lessons_repository.dart' as _i14;
import '../../flows/main/domain/repositories/lessons_repository.dart' as _i13;
import '../../flows/main/domain/usecase/get_lessons.dart' as _i31;
import '../../flows/main/presentation/pages/main/cubit/main_cubit.dart' as _i32;
import '../../flows/menu/presentation/pages/create_marker/cubit/create_marker_cubit.dart'
    as _i5;
import '../../flows/menu/presentation/pages/map/cubit/map_cubit.dart' as _i15;
import '../../flows/menu/presentation/pages/pick_marker_location/cubit/pick_marker_location_cubit.dart'
    as _i17;
import '../../flows/splash/presentation/pages/splash/cubit/splash_cubit.dart'
    as _i19;
import '../../navigation/app_state_cubit/app_state_cubit.dart' as _i36;
import '../../themes/theme_data_values.dart' as _i20;
import '../app_intenal_notification_system/bloc/app_intenal_notifications_bloc.dart'
    as _i3;
import '../firestore/firestore_groups.dart' as _i8;
import '../firestore/firestore_lessons.dart' as _i9;
import '../firestore/firestore_users.dart' as _i10;
import 'injectible_init.dart' as _i40; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i9.FirestoreLessons>(
      () => _i9.FirestoreLessons(get<_i7.FirebaseFirestore>()));
  gh.factory<_i10.FirestoreUsers>(
      () => _i10.FirestoreUsers(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i11.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i12.LessonsDataSourceI>(
      () => _i12.LessonsDataSource(get<_i9.FirestoreLessons>()));
  gh.factory<_i13.LessonsRepositoryI>(
      () => _i14.LessonsRepository(get<_i12.LessonsDataSourceI>()));
  gh.factory<_i15.MapCubit>(() => _i15.MapCubit());
  await gh.factoryAsync<_i16.PackageInfo>(
    () => registerModule.packageInfo,
    preResolve: true,
  );
  gh.factory<_i17.PickMarkerLocationCubit>(
      () => _i17.PickMarkerLocationCubit());
  await gh.factoryAsync<_i18.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i19.SplashCubit>(() => _i19.SplashCubit());
  gh.lazySingleton<_i20.ThemeDataValues>(() => _i20.ThemeDataValues());
  gh.factory<_i21.AuthDataSourceI>(() => _i21.AuthDataSourceImpl(
        firebaseAuth: get<_i6.FirebaseAuth>(),
        firestoreUsers: get<_i10.FirestoreUsers>(),
      ));
  gh.factory<_i22.AuthRepositoryI>(
      () => _i23.AuthRepositoryImplementation(get<_i21.AuthDataSourceI>()));
  gh.factory<_i24.AuthRepositoryI>(
      () => _i25.AuthRepositoryImpl(get<_i21.AuthDataSourceI>()));
  gh.factory<_i26.CompleteRegistrationDataSourceI>(
      () => _i26.CompleteRegistrationDataSource(
            get<_i8.FirestoreGroups>(),
            get<_i10.FirestoreUsers>(),
          ));
  gh.factory<_i27.CompleteRegistrationRepositoryI>(() =>
      _i28.CompleteRegistrationRepository(
          get<_i26.CompleteRegistrationDataSourceI>()));
  gh.factory<_i29.CompleteRegistrationUseCase>(() =>
      _i29.CompleteRegistrationUseCase(
          get<_i27.CompleteRegistrationRepositoryI>()));
  gh.factory<_i30.GetGroupsUseCase>(
      () => _i30.GetGroupsUseCase(get<_i27.CompleteRegistrationRepositoryI>()));
  gh.factory<_i31.GetLessonsUseCase>(
      () => _i31.GetLessonsUseCase(get<_i13.LessonsRepositoryI>()));
  gh.factory<_i32.MainCubit>(
      () => _i32.MainCubit(get<_i31.GetLessonsUseCase>()));
  gh.factory<_i33.SignInUseCase>(
      () => _i33.SignInUseCase(get<_i24.AuthRepositoryI>()));
  gh.factory<_i34.SignOutUseCase>(
      () => _i34.SignOutUseCase(get<_i24.AuthRepositoryI>()));
  gh.factory<_i35.SignUpUseCase>(
      () => _i35.SignUpUseCase(get<_i24.AuthRepositoryI>()));
  gh.factory<_i36.AppStateCubit>(() => _i36.AppStateCubit(
        authRepository: get<_i22.AuthRepositoryI>(),
        firebaseAuth: get<_i6.FirebaseAuth>(),
      ));
  gh.factory<_i37.CompleteRegistrationCubit>(
      () => _i37.CompleteRegistrationCubit(
            get<_i30.GetGroupsUseCase>(),
            get<_i29.CompleteRegistrationUseCase>(),
          ));
  gh.factory<_i38.SignInCubit>(
      () => _i38.SignInCubit(get<_i33.SignInUseCase>()));
  gh.factory<_i39.SignUpCubit>(
      () => _i39.SignUpCubit(get<_i35.SignUpUseCase>()));
  return get;
}

class _$RegisterModule extends _i40.RegisterModule {}
