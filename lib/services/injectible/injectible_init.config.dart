// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../../domain/auth/datasource/auth_datasource.dart' as _i21;
import '../../domain/auth/repository/auth_repo.dart' as _i22;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i23;
import '../../flows/auth/data/repositories/auth_repository_impl.dart' as _i25;
import '../../flows/auth/domain/repositories/auth_repository.dart' as _i24;
import '../../flows/auth/domain/usecases/sign_in.dart' as _i35;
import '../../flows/auth/domain/usecases/sign_out.dart' as _i36;
import '../../flows/auth/domain/usecases/sign_up.dart' as _i37;
import '../../flows/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i41;
import '../../flows/auth/presentation/pages/sign_up/cubit/sign_up_cubit.dart'
    as _i42;
import '../../flows/complete_registration/data/datasources/complete_registration_datasource.dart'
    as _i27;
import '../../flows/complete_registration/data/repositories/complete_registration_repository.dart'
    as _i29;
import '../../flows/complete_registration/domain/repositories/complete_registration_repository.dart'
    as _i28;
import '../../flows/complete_registration/domain/usecases/complete_registration.dart'
    as _i30;
import '../../flows/complete_registration/domain/usecases/get_groups.dart'
    as _i31;
import '../../flows/complete_registration/presentation/pages/cubit/complete_registration_cubit.dart'
    as _i40;
import '../../flows/main/data/datasources/lessons_datasources.dart' as _i11;
import '../../flows/main/data/repositories/lessons_repository.dart' as _i13;
import '../../flows/main/domain/repositories/lessons_repository.dart' as _i12;
import '../../flows/main/domain/usecase/get_lessons.dart' as _i32;
import '../../flows/main/presentation/pages/main/cubit/main_cubit.dart' as _i34;
import '../../flows/splash/presentation/pages/splash/cubit/splash_cubit.dart'
    as _i16;
import '../../flows/teacher/data/datasources/teacher_datasource.dart' as _i17;
import '../../flows/teacher/data/repositories/teacher_repository.dart' as _i19;
import '../../flows/teacher/domain/repositories/teacher_repository.dart'
    as _i18;
import '../../flows/teacher/domain/usecases/change_time.dart' as _i26;
import '../../flows/teacher/domain/usecases/get_lessons.dart' as _i33;
import '../../flows/teacher/presentation/pages/main/cubit/teacher_main_cubit.dart'
    as _i38;
import '../../navigation/app_state_cubit/app_state_cubit.dart' as _i39;
import '../../themes/theme_data_values.dart' as _i20;
import '../app_intenal_notification_system/bloc/app_intenal_notifications_bloc.dart'
    as _i3;
import '../firestore/firestore_groups.dart' as _i7;
import '../firestore/firestore_lessons.dart' as _i8;
import '../firestore/firestore_users.dart' as _i9;
import 'injectible_init.dart' as _i43; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i9.FirestoreUsers>(
      () => _i9.FirestoreUsers(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i10.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i11.LessonsDataSourceI>(
      () => _i11.LessonsDataSource(get<_i8.FirestoreLessons>()));
  gh.factory<_i12.LessonsRepositoryI>(
      () => _i13.LessonsRepository(get<_i11.LessonsDataSourceI>()));
  await gh.factoryAsync<_i14.PackageInfo>(
    () => registerModule.packageInfo,
    preResolve: true,
  );
  await gh.factoryAsync<_i15.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i16.SplashCubit>(() => _i16.SplashCubit());
  gh.factory<_i17.TeacherDataSourceI>(
      () => _i17.TeacherDataSource(get<_i8.FirestoreLessons>()));
  gh.factory<_i18.TeacherRepositoryI>(
      () => _i19.TeacherRepository(get<_i17.TeacherDataSourceI>()));
  gh.lazySingleton<_i20.ThemeDataValues>(() => _i20.ThemeDataValues());
  gh.factory<_i21.AuthDataSourceI>(() => _i21.AuthDataSourceImpl(
        firebaseAuth: get<_i5.FirebaseAuth>(),
        firestoreUsers: get<_i9.FirestoreUsers>(),
      ));
  gh.factory<_i22.AuthRepositoryI>(
      () => _i23.AuthRepositoryImplementation(get<_i21.AuthDataSourceI>()));
  gh.factory<_i24.AuthRepositoryI>(
      () => _i25.AuthRepositoryImpl(get<_i21.AuthDataSourceI>()));
  gh.factory<_i26.ChangeTimeUseCase>(
      () => _i26.ChangeTimeUseCase(get<_i18.TeacherRepositoryI>()));
  gh.factory<_i27.CompleteRegistrationDataSourceI>(
      () => _i27.CompleteRegistrationDataSource(
            get<_i7.FirestoreGroups>(),
            get<_i9.FirestoreUsers>(),
          ));
  gh.factory<_i28.CompleteRegistrationRepositoryI>(() =>
      _i29.CompleteRegistrationRepository(
          get<_i27.CompleteRegistrationDataSourceI>()));
  gh.factory<_i30.CompleteRegistrationUseCase>(() =>
      _i30.CompleteRegistrationUseCase(
          get<_i28.CompleteRegistrationRepositoryI>()));
  gh.factory<_i31.GetGroupsUseCase>(
      () => _i31.GetGroupsUseCase(get<_i28.CompleteRegistrationRepositoryI>()));
  gh.factory<_i32.GetLessonsUseCase>(
      () => _i32.GetLessonsUseCase(get<_i12.LessonsRepositoryI>()));
  gh.factory<_i33.GetTeachersLessonsUseCase>(
      () => _i33.GetTeachersLessonsUseCase(get<_i18.TeacherRepositoryI>()));
  gh.factory<_i34.MainCubit>(
      () => _i34.MainCubit(get<_i32.GetLessonsUseCase>()));
  gh.factory<_i35.SignInUseCase>(
      () => _i35.SignInUseCase(get<_i24.AuthRepositoryI>()));
  gh.factory<_i36.SignOutUseCase>(
      () => _i36.SignOutUseCase(get<_i24.AuthRepositoryI>()));
  gh.factory<_i37.SignUpUseCase>(
      () => _i37.SignUpUseCase(get<_i24.AuthRepositoryI>()));
  gh.factory<_i38.TeacherMainCubit>(() => _i38.TeacherMainCubit(
        get<_i33.GetTeachersLessonsUseCase>(),
        get<_i26.ChangeTimeUseCase>(),
      ));
  gh.factory<_i39.AppStateCubit>(() => _i39.AppStateCubit(
        authRepository: get<_i22.AuthRepositoryI>(),
        firebaseAuth: get<_i5.FirebaseAuth>(),
      ));
  gh.factory<_i40.CompleteRegistrationCubit>(
      () => _i40.CompleteRegistrationCubit(
            get<_i31.GetGroupsUseCase>(),
            get<_i30.CompleteRegistrationUseCase>(),
          ));
  gh.factory<_i41.SignInCubit>(
      () => _i41.SignInCubit(get<_i35.SignInUseCase>()));
  gh.factory<_i42.SignUpCubit>(
      () => _i42.SignUpCubit(get<_i37.SignUpUseCase>()));
  return get;
}

class _$RegisterModule extends _i43.RegisterModule {}
