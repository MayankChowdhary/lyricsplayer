import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


part 'form_validator_state.dart';

class FormValidatorCubit extends Cubit<FormValidatorState> {
  FormValidatorCubit() : super(const FormValidatorUpdate());

  void initForm({
    String email = '',
    String name = '',
    String phone = '',
    String gender = '',
    String city = '',
    String states = '',
    String country = '',
  }) {
    emit(state.copyWith(
      email: email,
      name: name,
      phone: phone,
      gender: gender,
      city: city,
      states:states,
      country: country,
    ));
  }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }



  void updateName(String? name) {
    emit(state.copyWith(name: name));
  }

  void updatePhone(String? phone) {
    emit(state.copyWith(phone: phone));
  }

  void updateGender(String? gender) {
    emit(state.copyWith(gender: gender));
  }

  void updateStates(String? states) {
    emit(state.copyWith(states: states));
  }

  void updateCountry(String? country) {
    emit(state.copyWith(country: country));
  }



  void updateCity(String? city) {
    emit(state.copyWith(city: city));
  }

  void updateAutovalidateMode(AutovalidateMode? autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

  void toggleObscureText() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void reset() {
    emit(const FormValidatorUpdate());
  }
}