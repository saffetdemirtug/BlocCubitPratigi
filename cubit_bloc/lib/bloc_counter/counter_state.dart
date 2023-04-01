part of 'counter_bloc.dart';

@immutable
abstract class CounterBlocState {
  final int sayac;
  const CounterBlocState({required this.sayac});
}

class CounterInitial extends CounterBlocState {
  //kullanımı opsiyoneldir.Sayaçın hangi değerle başlayacağı belirlenir.

  const CounterInitial({required int baslangicDegeri}) : super(sayac: baslangicDegeri);
}


class MyCounterBlocState extends CounterBlocState {
  const MyCounterBlocState({required int sayacDegeri}) : super(sayac: sayacDegeri);
}