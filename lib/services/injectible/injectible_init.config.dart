// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i18;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../../domain/auth/datasource/auth_datasource.dart' as _i23;
import '../../domain/auth/repository/auth_repo.dart' as _i24;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i25;
import '../../flows/auth/data/repositories/auth_repository_impl.dart' as _i27;
import '../../flows/auth/domain/repositories/auth_repository.dart' as _i26;
import '../../flows/auth/domain/usecases/sign_in.dart' as _i39;
import '../../flows/auth/domain/usecases/sign_out.dart' as _i40;
import '../../flows/auth/domain/usecases/sign_up.dart' as _i41;
import '../../flows/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i45;
import '../../flows/auth/presentation/pages/sign_up/cubit/sign_up_cubit.dart'
    as _i46;
import '../../flows/complete_registration/data/datasources/complete_registration_datasource.dart'
    as _i28;
import '../../flows/complete_registration/data/repositories/complete_registration_repository.dart'
    as _i30;
import '../../flows/complete_registration/domain/repositories/complete_registration_repository.dart'
    as _i29;
import '../../flows/complete_registration/domain/usecases/complete_registration.dart'
    as _i31;
import '../../flows/complete_registration/domain/usecases/get_groups.dart'
    as _i32;
import '../../flows/complete_registration/presentation/pages/cubit/complete_registration_cubit.dart'
    as _i43;
import '../../flows/main/data/datasources/lessons_datasources.dart' as _i12;
import '../../flows/main/data/repositories/lessons_repository.dart' as _i14;
import '../../flows/main/domain/repositories/lessons_repository.dart' as _i13;
import '../../flows/main/domain/usecase/get_lessons.dart' as _i33;
import '../../flows/main/presentation/pages/main/cubit/main_cubit.dart' as _i36;
import '../../flows/menu/data/datasources/markers_datasource.dart' as _i15;
import '../../flows/menu/data/repositories/markers_repository_impl.dart'
    as _i17;
import '../../flows/menu/domain/repositories/markers_repository.dart' as _i16;
import '../../flows/menu/domain/usecases/add_marker_point.dart' as _i22;
import '../../flows/menu/domain/usecases/get_marker_points.dart' as _i34;
import '../../flows/menu/domain/usecases/get_marker_types.dart' as _i35;
import '../../flows/menu/presentation/pages/create_marker/cubit/create_marker_cubit.dart'
    as _i44;
import '../../flows/menu/presentation/pages/map/cubit/map_cubit.dart' as _i37;
import '../../flows/menu/presentation/pages/pick_marker_location/cubit/pick_marker_location_cubit.dart'
    as _i38;
import '../../flows/splash/presentation/pages/splash/cubit/splash_cubit.dart'
    as _i20;
import '../../navigation/app_state_cubit/app_state_cubit.dart' as _i42;
import '../../themes/theme_data_values.dart' as _i21;
import '../app_intenal_notification_system/bloc/app_intenal_notifications_bloc.dart'
    as _i3;
import '../firestore/firestore_groups.dart' as _i7;
import '../firestore/firestore_lessons.dart' as _i8;
import '../firestore/firestore_markers.dart' as _i9;
import '../firestore/firestore_users.dart' as _i10;
import 'injectible_init.dart' as _i47; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.FirestoreGroups>(
      () => _i7.FirestoreGroups(get<_i6.FirebaseFirestore>()));
  gh.factory<_i8.FirestoreLessons>(
      () => _i8.FirestoreLessons(get<_i6.FirebaseFirestore>()));
  gh.factory<_i9.FirestoreMarkers>(
      () => _i9.FirestoreMarkers(get<_i6.FirebaseFirestore>()));
  gh.factory<_i10.FirestoreUsers>(
      () => _i10.FirestoreUsers(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i11.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i12.LessonsDataSourceI>(
      () => _i12.LessonsDataSource(get<_i8.FirestoreLessons>()));
  gh.factory<_i13.LessonsRepositoryI>(
      () => _i14.LessonsRepository(get<_i12.LessonsDataSourceI>()));
  gh.factory<_i15.MarkersDataSourceI>(
      () => _i15.MarkersDataSourceImpl(get<_i9.FirestoreMarkers>()));
  gh.factory<_i16.MarkersRepositoryI>(
      () => _i17.MarkersRepositoryImpl(get<_i15.MarkersDataSourceI>()));
  await gh.factoryAsync<_i18.PackageInfo>(
    () => registerModule.packageInfo,
    preResolve: true,
  );
  await gh.factoryAsync<_i19.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i20.SplashCubit>(() => _i20.SplashCubit());
  gh.lazySingleton<_i21.ThemeDataValues>(() => _i21.ThemeDataValues());
  gh.factory<_i22.AddMarkerPointUseCase>(
      () => _i22.AddMarkerPointUseCase(get<_i16.MarkersRepositoryI>()));
  gh.factory<_i23.AuthDataSourceI>(() => _i23.AuthDataSourceImpl(
        firebaseAuth: get<_i5.FirebaseAuth>(),
        firestoreUsers: get<_i10.FirestoreUsers>(),
      ));
  gh.factory<_i24.AuthRepositoryI>(
      () => _i25.AuthRepositoryImplementation(get<_i23.AuthDataSourceI>()));
  gh.factory<_i26.AuthRepositoryI>(
      () => _i27.AuthRepositoryImpl(get<_i23.AuthDataSourceI>()));
  gh.factory<_i28.CompleteRegistrationDataSourceI>(
      () => _i28.CompleteRegistrationDataSource(
            get<_i7.FirestoreGroups>(),
            get<_i10.FirestoreUsers>(),
          ));
  gh.factory<_i29.CompleteRegistrationRepositoryI>(() =>
      _i30.CompleteRegistrationRepository(
          get<_i28.CompleteRegistrationDataSourceI>()));
  gh.factory<_i31.CompleteRegistrationUseCase>(() =>
      _i31.CompleteRegistrationUseCase(
          get<_i29.CompleteRegistrationRepositoryI>()));
  gh.factory<_i32.GetGroupsUseCase>(
      () => _i32.GetGroupsUseCase(get<_i29.CompleteRegistrationRepositoryI>()));
  gh.factory<_i33.GetLessonsUseCase>(
      () => _i33.GetLessonsUseCase(get<_i13.LessonsRepositoryI>()));
  gh.factory<_i34.GetMarkerPointsUseCase>(
      () => _i34.GetMarkerPointsUseCase(get<_i16.MarkersRepositoryI>()));
  gh.factory<_i35.GetMarkerTypesUseCase>(
      () => _i35.GetMarkerTypesUseCase(get<_i16.MarkersRepositoryI>()));
  gh.factory<_i36.MainCubit>(
      () => _i36.MainCubit(get<_i33.GetLessonsUseCase>()));
  gh.factory<_i37.MapCubit>(
      () => _i37.MapCubit(get<_i34.GetMarkerPointsUseCase>()));
  gh.factory<_i38.PickMarkerLocationCubit>(
      () => _i38.PickMarkerLocationCubit(get<_i22.AddMarkerPointUseCase>()));
  gh.factory<_i39.SignInUseCase>(
      () => _i39.SignInUseCase(get<_i26.AuthRepositoryI>()));
  gh.factory<_i40.SignOutUseCase>(
      () => _i40.SignOutUseCase(get<_i26.AuthRepositoryI>()));
  gh.factory<_i41.SignUpUseCase>(
      () => _i41.SignUpUseCase(get<_i26.AuthRepositoryI>()));
  gh.factory<_i42.AppStateCubit>(() => _i42.AppStateCubit(
        authRepository: get<_i24.AuthRepositoryI>(),
        firebaseAuth: get<_i5.FirebaseAuth>(),
      ));
  gh.factory<_i43.CompleteRegistrationCubit>(
      () => _i43.CompleteRegistrationCubit(
            get<_i32.GetGroupsUseCase>(),
            get<_i31.CompleteRegistrationUseCase>(),
          ));
  gh.factory<_i44.CreateMarkerCubit>(
      () => _i44.CreateMarkerCubit(get<_i35.GetMarkerTypesUseCase>()));
  gh.factory<_i45.SignInCubit>(
      () => _i45.SignInCubit(get<_i39.SignInUseCase>()));
  gh.factory<_i46.SignUpCubit>(
      () => _i46.SignUpCubit(get<_i41.SignUpUseCase>()));
  return get;
}

class _$RegisterModule extends _i47.RegisterModule {}
