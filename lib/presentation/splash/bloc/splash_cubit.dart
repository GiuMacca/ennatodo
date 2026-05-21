import 'package:ennatodo/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash()); // Stato iniziale

  void appStarted() async {
    // In questo funzione per ora rimadno al sign in ma più in là sarà questa a decidere se andare li o nella Homescreen
    // se l'utente è già autenticato
    await Future.delayed(const Duration(seconds: 2));
    emit(UnAuthenticated());
  }
}
