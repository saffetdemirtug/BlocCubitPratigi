part of 'counter_cubit.dart';

//arayüzde gösterien kısımdır.
@immutable
abstract class CounterCubitState {
  final int sayac;
  const CounterCubitState({required this.sayac});
}

class CounterInitial extends CounterCubitState {
  //kullanımı opsiyoneldir.Sayaçın hangi değerle başlayacağı belirlenir.

  const CounterInitial({required int baslangicDegeri})
      : super(sayac: baslangicDegeri);
}

class MyCounterState extends CounterCubitState {
  const MyCounterState({required int sayacDegeri}) : super(sayac: sayacDegeri);
}
