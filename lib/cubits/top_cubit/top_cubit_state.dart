part of 'top_cubit.dart';

@immutable
sealed class TopCubitState {}
class TopLoadingState extends TopCubitState {}
class TopLoadedState extends TopCubitState{}
class TopFailuerState extends TopCubitState {
   final String message;

  TopFailuerState(this.message);
}

