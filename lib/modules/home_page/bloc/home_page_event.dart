part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class GetAllPokemonEvent extends HomePageEvent {
  const GetAllPokemonEvent();
}
