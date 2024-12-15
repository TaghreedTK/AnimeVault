part of 'year_cubit_cubit.dart';

@immutable
sealed class YearCubitState {}


class ThisYearLoadingState extends YearCubitState {}
class ThisYearLoadedState extends YearCubitState {}
class ThisYearFailuerState extends YearCubitState {
   final String message;

  ThisYearFailuerState( this.message);
}
