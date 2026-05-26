import 'package:ennatodo/domain/auth/usecases/is_logged_in.dart';
import 'package:ennatodo/presentation/splash/bloc/splash_state.dart';
import 'package:ennatodo/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash()); // Stato iniziale

  void appStarted() async {
    // In questo funzione per ora rimadno al sign in ma più in là sarà questa a decidere se andare li o nella Homescreen
    // se l'utente è già autenticato
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    }else{
      emit(UnAuthenticated());
    }
    
  }
}
