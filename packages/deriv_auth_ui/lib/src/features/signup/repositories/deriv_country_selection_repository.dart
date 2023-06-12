import 'package:deriv_auth_ui/src/features/signup/models/deriv_residence_model.dart';

abstract class DerivCountrySelectionRepository {
  Future<List<DerivResidenceModel>> fetchCountries();
}
