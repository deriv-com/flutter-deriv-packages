/// Base class that all FeatureModel(s) should extend.
abstract class BaseModel {
  /// Creates a JSON object from a [BaseModel].
  Map<String, dynamic> toJson();
}
