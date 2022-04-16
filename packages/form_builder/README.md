# FormBuilder

This widget helps to create, validate and submit a form in a simpler and cleaner way.

---

## Usage

You can use the `FormBuilder` widget to create a form and add fields to its children. You need to create a `FormBuilderController` and pass it to the `FormBuilder` to be able to access the form functionality.

*Note that you do not need to `dispose` the `FormBuilderController`, It will be disposed automatically inside the `FormBuilder`.*

*Note that each field should have a `unique` name.*

```dart
class LoginForm extends StatelessWidget {
  final FormBuilderController _controller = FormBuilderController();

  @override
  Widget build(BuildContext context) => FormBuilder(
      controller: _controller,
      children: <Widget>[
        FormTextField(
          name: 'email',
          label: 'Enter your email address',
        ),
        FormTextField(
          name: 'password',
          label: 'Enter your password',
        ),
      ],
    );
}
```

You can use the `FormBuilderController` to access the form.

Note that the `value` field will only be updated when you `save` the form.

```dart
void submit() {
  if (_controller.saveAndValidate()) {
      print(_controller.value);
      // {"email": "user@example.com", "password": "123456"}
  }
}
```

---

## FormBuilderField

`FormBuilderField` handles the shared logic for all kinds of fields internally, It allows you to render your own custom UI using the `builder` method.

Example of a simple checkbox field:

```dart
class FormCheckboxField extends StatelessWidget {
  const FormCheckboxField({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) => FormBuilderField<bool>(
        name: name,
        builder: (FormBuilderFieldBuilderState<bool> field) => Checkbox(
          value: field.value ?? false,
          onChanged: field.didChange,
        ),
      );
}
```

## FormValidator

This class contains a bunch of validation functions that can be chained together to create a validator for form fields, Form field will be validated in order of given validation chain.

In order to add a new rule, you can simply create an extension on `FormValidator`.

Note that you need to call `validate()` method at the end of the chain to build the validator.

```dart
FormTextField(
  name: 'password',
  label: 'Enter your password',
  validator: FormValidator()
      .required()
      .noSpecialCharacter()
      .min(3)
      .max(6)
      .validate(),
)
```
