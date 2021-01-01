class TableProvider {
  static final bankTable = "banks";
  static final createBankTable = "CREATE TABLE ${bankTable} ("
      "id INTEGER PRIMARY KEY,"
      "name TEXT "
      ")";
}
