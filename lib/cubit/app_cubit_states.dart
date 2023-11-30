
import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class CubitStates extends Equatable{

}

class InitialState extends CubitStates{
  @override
  List<Object> get props => [];

}

class WelcomeState extends CubitStates{
  @override
  List<Object> get props => [];

}
class LoadingState extends CubitStates{
  @override
  List<Object> get props => [];

}
class LoadedState extends CubitStates{

  final List<DataModel> places;
  LoadedState({required this.places});

  @override
  List<Object> get props => [];

}

class DetailsState extends CubitStates{

  final DataModel places;
  DetailsState({required this.places});

  @override
  List<Object> get props => [];

}



