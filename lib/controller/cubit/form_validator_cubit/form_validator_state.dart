part of 'form_validator_cubit.dart';

@immutable
abstract class FormValidatorState {
  final AutovalidateMode autovalidateMode;
  final String email;
  final String name;
  final String city;
  final String phone;

  final String gender;

  final String states;

  final String country;

  final bool obscureText;

  const FormValidatorState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.email = '',
    this.name = '',
    this.phone = '',
    this.gender = '',
    this.city = '',
    this.states = '',
    this.country = '',
    this.obscureText = true,
  });

  FormValidatorState copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? name,
    String? phone,
    String? gender,
    String? city,
    String? states,
    String? country,
    bool? obscureText,
  });
}

class FormValidatorUpdate extends FormValidatorState {
  const FormValidatorUpdate({
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String email = '',
    String name = '',
    String phone = '',
    String gender = '',
    String city = '',
    String states = '',
    String country = '',
    bool obscureText = true,
  }) : super(
          autovalidateMode: autovalidateMode,
          email: email,
          name: name,
          phone: phone,
          gender: gender,
          city: city,
          states: states,
          country: country,
          obscureText: obscureText,
        );

  @override
  FormValidatorUpdate copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? name,
    String? phone,
    String? gender,
    String? city,
    String? states,
    String? country,
    bool? obscureText,
  }) {
    return FormValidatorUpdate(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      states: states ?? this.states,
      country: country ?? this.country,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
