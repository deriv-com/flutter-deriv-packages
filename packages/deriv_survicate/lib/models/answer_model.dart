/// Answer model.
class AnswerModel {
  /// Converts a map to [AnswerModel].
  ///
  /// Expect that there might be answer objects that consist only of the type property.
  AnswerModel.fromMap(Map<dynamic, dynamic> survicateAnswer)
      : type = survicateAnswer['type'],
        id = survicateAnswer['id'],
        ids = survicateAnswer['ids'] == null
            ? null
            : List<int>.from(survicateAnswer['ids']),
        value = survicateAnswer['value'];

  /// Answer type.
  final String type;

  /// Answer ID. Applicable only for type = [‘single’, ‘smiley_scale’, ‘dropdown_list’].
  final int id;

  /// Array of answer IDs. Applicable only for type = [‘multiple’].
  final List<int> ids;

  /// Context value of the answer. Applicable only for type = [‘text’, ‘nps’, ‘date’, ‘rating’].
  final String value;
}
