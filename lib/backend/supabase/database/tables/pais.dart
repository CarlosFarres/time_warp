import '../database.dart';

class PaisTable extends SupabaseTable<PaisRow> {
  @override
  String get tableName => 'pais';

  @override
  PaisRow createRow(Map<String, dynamic> data) => PaisRow(data);
}

class PaisRow extends SupabaseDataRow {
  PaisRow(super.data);

  @override
  SupabaseTable get table => PaisTable();

  int get idPais => getField<int>('id_pais')!;
  set idPais(int value) => setField<int>('id_pais', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);
}
