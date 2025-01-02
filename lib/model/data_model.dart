
class RefrenceModel {
  RefrenceModel({
    required this.keyField,
    required this.pairedField,
  });
  final String keyField;
  final String pairedField;

  Map<String, dynamic> dataToJson() {
    return {
      'data':{
        'key': keyField,
        'paired':pairedField
      }
    };
  }

  //  List<Map<String, dynamic>> dataToJson() {
  //   return [
  //     {
  //       'data': {'key': keyField, 'paired': pairedField}
  //     }
  //   ];
  // }

  factory RefrenceModel.fromJson(Map<String, dynamic> data) {
    return RefrenceModel(
     keyField: data['key'],
     pairedField: data['pairedField']
    );
  }
}
