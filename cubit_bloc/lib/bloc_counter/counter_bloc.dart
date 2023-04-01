// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(const CounterInitial(baslangicDegeri: 60)) {
    on<ArttirEvent>((event, emit) {
      emit(MyCounterBlocState(sayacDegeri: state.sayac + 1));
    });

    on<AzaltEvent>((event, emit) {
      emit(MyCounterBlocState(sayacDegeri: state.sayac -1));
    });
  }
}
