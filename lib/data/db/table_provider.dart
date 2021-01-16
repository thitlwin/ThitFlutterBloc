class TableProvider {
  static final userTable = "users";
  static final createUserTable = "CREATE TABLE ${userTable} ("
      "id INTEGER PRIMARY KEY,"
      "name TEXT ,"
      "email TEXT "
      ")";

  static final bankTable = "banks";
  static final createBankTable = "CREATE TABLE ${bankTable} ("
      "id INTEGER PRIMARY KEY,"
      "name TEXT "
      ")";

  static final noteTable = "note";
  static final createNoteTable = "CREATE TABLE ${noteTable} ("
      "id INTEGER PRIMARY KEY,"
      "note TEXT,"
      "read_flag INTEGER"
      ")";
}
