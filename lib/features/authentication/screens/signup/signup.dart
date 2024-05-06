import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //TItle

              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              //form
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              const TSignupForm(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Text(
                'Or Continue With',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Divider
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
