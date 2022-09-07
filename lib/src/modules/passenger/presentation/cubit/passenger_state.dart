part of 'passenger_cubit.dart';

abstract class PassengerState extends Equatable {
  const PassengerState();

  @override
  List<Object> get props => [];
}

class PassengerPathInitial extends PassengerState {}
