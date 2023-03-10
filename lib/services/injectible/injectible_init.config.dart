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

import '../../domain/auth/datasource/auth_datasource.dart' as _i26;
import '../../domain/auth/repository/auth_repo.dart' as _i27;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i28;
import '../../flows/auth/data/repositories/auth_repository_impl.dart' as _i30;
import '../../flows/auth/domain/repositories/auth_repository.dart' as _i29;
import '../../flows/auth/domain/usecases/sign_in.dart' as _i46;
import '../../flows/auth/domain/usecases/sign_out.dart' as _i47;
import '../../flows/auth/domain/usecases/sign_up.dart' as _i48;
import '../../flows/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i53;
import '../../flows/auth/presentation/pages/sign_up/cubit/sign_up_cubit.dart'
    as _i54;
import '../../flows/complete_registration/data/datasources/complete_registration_datasource.dart'
    as _i32;
import '../../flows/complete_registration/data/repositories/complete_registration_repository.dart'
    as _i34;
import '../../flows/complete_registration/domain/repositories/complete_registration_repository.dart'
    as _i33;
import '../../flows/complete_registration/domain/usecases/complete_registration.dart'
    as _i35;
import '../../flows/complete_registration/domain/usecases/get_groups.dart'
    as _i36;
import '../../flows/complete_registration/presentation/pages/cubit/complete_registration_cubit.dart'
    as _i51;
import '../../flows/main/data/datasources/lessons_datasources.dart' as _i12;
import '../../flows/main/data/repositories/lessons_repository.dart' as _i14;
import '../../flows/main/domain/repositories/lessons_repository.dart' as _i13;
import '../../flows/main/domain/usecase/get_lessons.dart' as _i37;
import '../../flows/main/domain/usecase/get_notifications.dart' as _i40;
import '../../flows/main/presentation/pages/main/cubit/main_cubit.dart' as _i42;
import '../../flows/menu/data/datasources/markers_datasource.dart' as _i15;
import '../../flows/menu/data/repositories/markers_repository_impl.dart'
    as _i17;
import '../../flows/menu/domain/repositories/markers_repository.dart' as _i16;
import '../../flows/menu/domain/usecases/add_marker_point.dart' as _i25;
import '../../flows/menu/domain/usecases/get_marker_points.dart' as _i38;
import '../../flows/menu/domain/usecases/get_marker_types.dart' as _i39;
import '../../flows/menu/presentation/pages/create_marker/cubit/create_marker_cubit.dart'
    as _i52;
import '../../flows/menu/presentation/pages/map/cubit/map_cubit.dart' as _i43;
import '../../flows/menu/presentation/pages/notifications/cubit/notifications_cubit.dart'
    as _i44;
import '../../flows/menu/presentation/pages/pick_marker_location/cubit/pick_marker_location_cubit.dart'
    as _i45;
import '../../flows/splash/presentation/pages/splash/cubit/splash_cubit.dart'
    as _i20;
import '../../flows/teacher/data/datasources/teacher_datasource.dart' as _i21;
import '../../flows/teacher/data/repositories/teacher_repository.dart' as _i23;
import '../../flows/teacher/domain/repositories/teacher_repository.dart'
    as _i22;
import '../../flows/teacher/domain/usecases/change_time.dart' as _i31;
import '../../flows/teacher/domain/usecases/get_lessons.dart' as _i41;
import '../../flows/teacher/presentation/pages/main/cubit/teacher_main_cubit.dart'
    as _i49;
import '../../navigation/app_state_cubit/app_state_cubit.dart' as _i50;
import '../../themes/theme_data_values.dart' as _i24;
import '../app_intenal_notification_system/bloc/app_intenal_notifications_bloc.dart'
    as _i3;
import '../firestore/firestore_groups.dart' as _i7;
import '../firestore/firestore_lessons.dart' as _i8;
import '../firestore/firestore_markers.dart' as _i9;
import '../firestore/firestore_users.dart' as _i10;
import 'injectible_init.dart' as _i55; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i21.TeacherDataSourceI>(
      () => _i21.TeacherDataSource(get<_i8.FirestoreLessons>()));
  gh.factory<_i22.TeacherRepositoryI>(
      () => _i23.TeacherRepository(get<_i21.TeacherDataSourceI>()));
  gh.lazySingleton<_i24.ThemeDataValues>(() => _i24.ThemeDataValues());
  gh.factory<_i25.AddMarkerPointUseCase>(
      () => _i25.AddMarkerPointUseCase(get<_i16.MarkersRepositoryI>()));
  gh.factory<_i26.AuthDataSourceI>(() => _i26.AuthDataSourceImpl(
        firebaseAuth: get<_i5.FirebaseAuth>(),
        firestoreUsers: get<_i10.FirestoreUsers>(),
      ));
  gh.factory<_i27.AuthRepositoryI>(
      () => _i28.AuthRepositoryImplementation(get<_i26.AuthDataSourceI>()));
  gh.factory<_i29.AuthRepositoryI>(
      () => _i30.AuthRepositoryImpl(get<_i26.AuthDataSourceI>()));
  gh.factory<_i31.ChangeTimeUseCase>(
      () => _i31.ChangeTimeUseCase(get<_i22.TeacherRepositoryI>()));
  gh.factory<_i32.CompleteRegistrationDataSourceI>(
      () => _i32.CompleteRegistrationDataSource(
            get<_i7.FirestoreGroups>(),
            get<_i10.FirestoreUsers>(),
          ));
  gh.factory<_i33.CompleteRegistrationRepositoryI>(() =>
      _i34.CompleteRegistrationRepository(
          get<_i32.CompleteRegistrationDataSourceI>()));
  gh.factory<_i35.CompleteRegistrationUseCase>(() =>
      _i35.CompleteRegistrationUseCase(
          get<_i33.CompleteRegistrationRepositoryI>()));
  gh.factory<_i36.GetGroupsUseCase>(
      () => _i36.GetGroupsUseCase(get<_i33.CompleteRegistrationRepositoryI>()));
  gh.factory<_i37.GetLessonsUseCase>(
      () => _i37.GetLessonsUseCase(get<_i13.LessonsRepositoryI>()));
  gh.factory<_i38.GetMarkerPointsUseCase>(
      () => _i38.GetMarkerPointsUseCase(get<_i16.MarkersRepositoryI>()));
  gh.factory<_i39.GetMarkerTypesUseCase>(
      () => _i39.GetMarkerTypesUseCase(get<_i16.MarkersRepositoryI>()));
  gh.factory<_i40.GetNotificationsUseCase>(
      () => _i40.GetNotificationsUseCase(get<_i13.LessonsRepositoryI>()));
  gh.factory<_i41.GetTeachersLessonsUseCase>(
      () => _i41.GetTeachersLessonsUseCase(get<_i22.TeacherRepositoryI>()));
  gh.factory<_i42.MainCubit>(
      () => _i42.MainCubit(get<_i37.GetLessonsUseCase>()));
  gh.factory<_i43.MapCubit>(
      () => _i43.MapCubit(get<_i38.GetMarkerPointsUseCase>()));
  gh.factory<_i44.NotificationsCubit>(
      () => _i44.NotificationsCubit(get<_i40.GetNotificationsUseCase>()));
  gh.factory<_i45.PickMarkerLocationCubit>(
      () => _i45.PickMarkerLocationCubit(get<_i25.AddMarkerPointUseCase>()));
  gh.factory<_i46.SignInUseCase>(
      () => _i46.SignInUseCase(get<_i29.AuthRepositoryI>()));
  gh.factory<_i47.SignOutUseCase>(
      () => _i47.SignOutUseCase(get<_i29.AuthRepositoryI>()));
  gh.factory<_i48.SignUpUseCase>(
      () => _i48.SignUpUseCase(get<_i29.AuthRepositoryI>()));
  gh.factory<_i49.TeacherMainCubit>(() => _i49.TeacherMainCubit(
        get<_i41.GetTeachersLessonsUseCase>(),
        get<_i31.ChangeTimeUseCase>(),
      ));
  gh.factory<_i50.AppStateCubit>(() => _i50.AppStateCubit(
        authRepository: get<_i27.AuthRepositoryI>(),
        firebaseAuth: get<_i5.FirebaseAuth>(),
      ));
  gh.factory<_i51.CompleteRegistrationCubit>(
      () => _i51.CompleteRegistrationCubit(
            get<_i36.GetGroupsUseCase>(),
            get<_i35.CompleteRegistrationUseCase>(),
          ));
  gh.factory<_i52.CreateMarkerCubit>(
      () => _i52.CreateMarkerCubit(get<_i39.GetMarkerTypesUseCase>()));
  gh.factory<_i53.SignInCubit>(
      () => _i53.SignInCubit(get<_i46.SignInUseCase>()));
  gh.factory<_i54.SignUpCubit>(
      () => _i54.SignUpCubit(get<_i48.SignUpUseCase>()));
  return get;
}

class _$RegisterModule extends _i55.RegisterModule {}
