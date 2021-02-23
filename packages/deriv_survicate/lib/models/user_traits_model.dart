/// User traits model.
class UserTraitsModel {
  /// initializes user traits model.
  UserTraitsModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.organization,
    this.department,
    this.jobTitle,
    this.phone,
    this.website,
    this.addressFirstLine,
    this.addressSecondLine,
    this.city,
    this.state,
    this.zipCode,
    this.fax,
    this.annualRevenue,
    this.employees,
    this.industry,
    this.customTraits,
  });

  /// User id.
  final String userId;

  /// User first name.
  final String firstName;

  /// User last name.
  final String lastName;

  /// User Email.
  final String email;

  /// Organization.
  final String organization;

  /// Department.
  final String department;

  /// Job title.
  final String jobTitle;

  /// Phone no.
  final String phone;

  /// User website.
  final String website;

  /// Address first line.
  final String addressFirstLine;

  /// Address second line.
  final String addressSecondLine;

  /// City.
  final String city;

  /// State.
  final String state;

  /// Zip code.
  final String zipCode;

  /// Fax.
  final String fax;

  /// User annual revenue.
  final String annualRevenue;

  /// Employees.
  final String employees;

  /// Industry.
  final String industry;

  /// Custom traits.
  final Map<String, String> customTraits;

  /// Converts [UserTraitsModel] into map.
  Map<String, String> toMap() {
    final Map<String, String> userTraits = <String, String>{};

    _putValueIntoMap(userTraits, userId, 'user_id');
    _putValueIntoMap(userTraits, firstName, 'first_name');
    _putValueIntoMap(userTraits, lastName, 'last_name');
    _putValueIntoMap(userTraits, email, 'email');
    _putValueIntoMap(userTraits, organization, 'organization');
    _putValueIntoMap(userTraits, department, 'department');
    _putValueIntoMap(userTraits, jobTitle, 'job_title');
    _putValueIntoMap(userTraits, phone, 'phone');
    _putValueIntoMap(userTraits, website, 'website');
    _putValueIntoMap(userTraits, addressFirstLine, 'address_one');
    _putValueIntoMap(userTraits, addressSecondLine, 'address_two');
    _putValueIntoMap(userTraits, city, 'city');
    _putValueIntoMap(userTraits, state, 'state');
    _putValueIntoMap(userTraits, zipCode, 'zip');
    _putValueIntoMap(userTraits, fax, 'fax');
    _putValueIntoMap(userTraits, annualRevenue, 'annual_revenue');
    _putValueIntoMap(userTraits, employees, 'employees');
    _putValueIntoMap(userTraits, industry, 'industry');

    if (customTraits != null && customTraits.isNotEmpty) {
      userTraits.addAll(customTraits);
    }

    return userTraits;
  }

  void _putValueIntoMap(Map<String, String> map, String value, String key) {
    if (value != null) {
      map[key] = value;
    }
  }
}
