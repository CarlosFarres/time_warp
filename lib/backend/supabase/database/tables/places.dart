import '../database.dart';

class PlacesTable extends SupabaseTable<PlacesRow> {
  @override
  String get tableName => 'places';

  @override
  PlacesRow createRow(Map<String, dynamic> data) => PlacesRow(data);
}

class PlacesRow extends SupabaseDataRow {
  PlacesRow(super.data);

  @override
  SupabaseTable get table => PlacesTable();

  int get idPlace => getField<int>('id_place')!;
  set idPlace(int value) => setField<int>('id_place', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get localidad => getField<String>('localidad');
  set localidad(String? value) => setField<String>('localidad', value);

  String? get photosActual => getField<String>('photosActual');
  set photosActual(String? value) => setField<String>('photosActual', value);

  int? get idPais => getField<int>('id_pais');
  set idPais(int? value) => setField<int>('id_pais', value);

  double? get latitud => getField<double>('latitud');
  set latitud(double? value) => setField<double>('latitud', value);

  double? get longitud => getField<double>('longitud');
  set longitud(double? value) => setField<double>('longitud', value);

  String? get qr => getField<String>('qr');
  set qr(String? value) => setField<String>('qr', value);

  String? get photosOld => getField<String>('photosOld');
  set photosOld(String? value) => setField<String>('photosOld', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  List<String> get coordenadas => getListField<String>('coordenadas');
  set coordenadas(List<String>? value) =>
      setListField<String>('coordenadas', value);
}
