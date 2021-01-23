import 'package:equatable/equatable.dart';
import 'package:thit_flutter_bloc/data/model/speaker.dart';

abstract class SpeakerListState extends Equatable {

  final List propss;
  SpeakerListState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnSpeakerListState extends SpeakerListState {

  UnSpeakerListState();

  @override
  String toString() => 'UnSpeakerListState';
}

/// Initialized
class InSpeakerListState extends SpeakerListState {
  final List<Speaker> speakerList;

  InSpeakerListState(this.speakerList) : super([speakerList]);

  @override
  String toString() => 'InSpeakerListState $speakerList';
}

class ErrorSpeakerListState extends SpeakerListState {
  final String errorMessage;

  ErrorSpeakerListState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorSpeakerListState';
}
