import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<int> _favoritos = [];
  List<int> get favoritos => _favoritos;
  set favoritos(List<int> value) {
    _favoritos = value;
  }

  void addToFavoritos(int value) {
    _favoritos.add(value);
  }

  void removeFromFavoritos(int value) {
    _favoritos.remove(value);
  }

  void removeAtIndexFromFavoritos(int index) {
    _favoritos.removeAt(index);
  }

  void updateFavoritosAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _favoritos[index] = updateFn(_favoritos[index]);
  }

  void insertAtIndexInFavoritos(int index, int value) {
    _favoritos.insert(index, value);
  }
}
