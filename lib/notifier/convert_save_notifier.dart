import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import '/notifier/download_xlsx_notifier.dart';

class ConvertAndSave extends ChangeNotifier {
  List<int> _fileAsInt = [];
  List<int> get fileAsInt => _fileAsInt;
  Future<void> convertTOXlsxAndSave(List<Map<String, dynamic>> data) async {
    var excel = Excel.createExcel();
    Sheet sheet = excel['Attendence at ${DateTime.now().toIso8601String()}'];

    // var key = data[0].keys.toList();
    List<CellValue?> emptyCellValue =
        ['', '', '', '', ''].map((string) => TextCellValue(string)).toList();
    if (sheet.maxRows == 0) {
      sheet.appendRow(emptyCellValue);
    }
    // List<CellValue?> cellValueList =
    //     key.map((string) => TextCellValue(string)).toList();
    // sheet.appendRow(cellValueList);

    for (var newData in data) {
      var values = newData.values.toList();
      List<CellValue> cells =
          values.map((maping) => TextCellValue(maping)).toList();
      sheet.appendRow(cells);
    }
    _fileAsInt = excel.save()!;
    DownloadFileAsXlsx().downloadfiler(_fileAsInt);
  }
}
