import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/termsandcondition_checkbox.dart';
import 'package:t_store/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../verify_email/verify_email.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController signupController =
        Get.put(SignupController()); // Initialize the controller

    return Form(
      key: signupController.formKey, // Use the form key from the controller
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: signupController.firstNameController,
                  // Connect controller to form field
                  validator: TValidation.validateFirstName,
                  // Add validation function
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: signupController.lastNameController,
                  // Connect controller to form field
                  validator: TValidation.validateLastName,
                  // Add validation function
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //USERNAME

          //EMAIL

          TextFormField(
            controller: signupController.emailController,
            // Connect controller to form field
            validator: TValidation.validateEmail,
            // Add validation function
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //PHONE NO

          TextFormField(
            controller: signupController.phoneController,
            // Connect controller to form field
            validator: TValidation.validatePhone,
            // Add validation function
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //PASSWORD

          Obx(
            () => TextFormField(
              controller: signupController.passwordController,
              // Connect controller to form field
              validator: TValidation.validatePassword,
              // Add validation function
              obscureText: signupController.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => signupController.hidePassword.value = !signupController.hidePassword.value,
                    icon: Icon(signupController.hidePassword.value? Iconsax.eye_slash : Iconsax.eye )),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //TERMS AND CONDITIONS CHECKBOX
          const TTermsandConditionCheckbox(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          //SIGNUP BUTTON

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                signupController
                    .submitSignupForm(); // Call submit function from the controller
              },
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
