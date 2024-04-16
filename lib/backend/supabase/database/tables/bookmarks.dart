import '../database.dart';

class BookmarksTable extends SupabaseTable<BookmarksRow> {
  @override
  String get tableName => 'bookmarks';

  @override
  BookmarksRow createRow(Map<String, dynamic> data) => BookmarksRow(data);
}

class BookmarksRow extends SupabaseDataRow {
  BookmarksRow(super.data);

  @override
  SupabaseTable get table => BookmarksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get idPlace => getField<int>('id_place');
  set idPlace(int? value) => setField<int>('id_place', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);
}
