import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/form_validator_cubit.dart';
import '../../../core/themes/app_theme.dart';
import '../../../utils/validator.dart';

// you can see we've added our Validator mixin
// and now we can access all it's method directly
class UserInfoPage extends StatelessWidget with Validator {
  UserInfoPage({Key? key}) : super(key: key);

  final FormValidatorCubit _formValidatorCubit = FormValidatorCubit();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Listener's Info 🎧",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.primaryLight,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocSelector<FormValidatorCubit, FormValidatorState,
                AutovalidateMode>(
              bloc: _formValidatorCubit,
              selector: (state) => state.autovalidateMode,
              builder: (context, AutovalidateMode autovalidateMode) {
                return Form(
                  key: _formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      TextFormField(
                        // mixin method
                        validator: validateName,
                        onChanged: _formValidatorCubit.updateName,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          prefixIcon: Icon(Icons.face),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateEmail,
                        onChanged: _formValidatorCubit.updateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validatePhone,
                        onChanged: _formValidatorCubit.updatePhone,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          hintText: 'Enter your phone no.',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateGender,
                        onChanged: _formValidatorCubit.updateGender,
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          hintText: 'Enter your Gender',
                          prefixIcon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateCity,
                        onChanged: _formValidatorCubit.updateCity,
                        decoration: const InputDecoration(
                          labelText: 'City',
                          hintText: 'Enter your city',
                          prefixIcon: Icon(Icons.location_on),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateStates,
                        onChanged: _formValidatorCubit.updateStates,
                        decoration: const InputDecoration(
                          labelText: 'State',
                          hintText: 'Enter your State',
                          prefixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateCountry,
                        onChanged: _formValidatorCubit.updateCountry,
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          hintText: 'Enter your country',
                          prefixIcon: Icon(Icons.map),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Do your job here
                  } else {
                    // in case a user has submitted invalid form we'll set
                    // AutovalidateMode.always which will rebuild the form
                    // in result we'll start getting error message
                    _formValidatorCubit
                        .updateAutovalidateMode(AutovalidateMode.always);
                  }
                },
                child: const Text('SAVE'),
              ),
            ),
            const SizedBox(height: 8.0)
          ],
        ),
      ),
    );
  }
}
