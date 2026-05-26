import 'package:ennatodo/common/bloc/button/button_cubit.dart';
import 'package:ennatodo/data/auth/repository/auth_repository_impl.dart';
import 'package:ennatodo/data/auth/source/auth_firebase_service.dart';
import 'package:ennatodo/data/category/repository/category_repository_impl.dart';
import 'package:ennatodo/data/category/source/category_firebase_service.dart';
import 'package:ennatodo/domain/auth/repository/auth.dart';
import 'package:ennatodo/domain/auth/usecases/get_user.dart';
import 'package:ennatodo/domain/auth/usecases/is_logged_in.dart';
import 'package:ennatodo/domain/auth/usecases/password_reset_usecase.dart';
import 'package:ennatodo/domain/auth/usecases/signin_usecase.dart';
import 'package:ennatodo/domain/auth/usecases/signup_usecase.dart';
import 'package:ennatodo/domain/category/repository/category.dart';
import 'package:ennatodo/domain/category/usecases/get_categories.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

  // repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  // usecases auth
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<PasswordResetUsecase>(PasswordResetUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());
  // usecases category
  sl.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());

  sl.registerFactory<ButtonCubit>(() => ButtonCubit());
}
