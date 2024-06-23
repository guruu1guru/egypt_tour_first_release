import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/Screens/succes_send_info_to_guide.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import 'package:intl/intl.dart'; // Import the intl package
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:guru/core/component/custom_text_form_field.dart';
import 'package:guru/core/utils/colors_app.dart';
import 'package:guru/core/utils/custom_text_button.dart';
import 'package:guru/core/utils/styles.dart';
import 'package:guru/logic/tourist/add_tourist_cubit.dart';
import 'package:guru/logic/tourist/add_tourist_state.dart';
import 'package:guru/Screens/contact_tour_with_phone.dart';

class CustomDateFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;

  CustomDateFormField({
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2101),
        );
        if (selectedDate != null) {
          controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: validator,
        ),
      ),
    );
  }
}

class FormForRegisterTourist extends StatefulWidget {
  final String tourGuideName;
  final String tourGuidePhoneNumber;

  const FormForRegisterTourist({
    Key? key,
    required this.tourGuideName,
    required this.tourGuidePhoneNumber,
  }) : super(key: key);

  @override
  State<FormForRegisterTourist> createState() => _FormForRegisterTouristState();
}

class _FormForRegisterTouristState extends State<FormForRegisterTourist> {

  @override
  void initState() {
    super.initState();
  }



  Future<void> _launchWhatsApp(String phoneNumber, String message) async {
    final Uri whatsappUri = Uri.parse(
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Booking Page"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 1, 61, 58),
          foregroundColor: Colors.white,
        ),
        body: BlocListener<AddTouristCubit, TouristState>(
          listener: (context, state) {
            if (state is TouristLoading) {

            } else if (state is TouristSuccess) {
              Navigator.pop(context);
            } else if (state is TouristFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Lottie.asset("images/reg.json", height: 250),
                const SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 1, 61, 58),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      widget.tourGuideName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: context.read<AddTouristCubit>().formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: context
                              .read<AddTouristCubit>()
                              .touristNameController,
                          hintText: "Enter Your Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.length < 3) {
                              return 'Name must be at least 3 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: context
                              .read<AddTouristCubit>()
                              .touristEmailController,
                          hintText: "Enter Your Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                      IntlPhoneField(
                        controller: context.read<AddTouristCubit>().whatsAppNumberController,
                        decoration: InputDecoration(
                          hintText: "WhatsApp Number",
                          filled: true,
                          hintStyle: Styles.font14BlueSemiBold(context), // Adjust as per your project structure
                          fillColor: ColorsApp.moreLightGrey, // Adjust as per your project structure
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'EG', // Initial country code for Egypt
                        onChanged: (phone) {
                          print(phone.completeNumber);
                          context.read<AddTouristCubit>().selectedCountryCodeController.text = '${phone.countryCode}';
                        },
                        onCountryChanged: (phone) {
                          print('Country changed to: ' + phone.name);
                          context.read<AddTouristCubit>().selectedCountryCodeController.text = '${phone.code}';
                        },
                        validator: (phone) {
                          if (phone == null || phone.completeNumber.isEmpty) {
                            return 'Please enter your WhatsApp number';
                          }
                          return null;
                        },
                      ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: context
                              .read<AddTouristCubit>()
                              .touristPhoneNumberController,
                          hintText: "Local Phone Number Eg:- 01112345678",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                              return 'Please enter a valid Egyptian phone number starting with 01';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomDateFormField(
                          controller: context
                              .read<AddTouristCubit>()
                              .touristDateController,
                          hintText: "Select Date",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a date';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: AppTextButton(
                            buttonText: 'Send Information to Guide',
                            textStyle: Styles.font14LightGreyRegular(context),
                            backgroundColor: ColorsApp.darkPrimary,
                            onPressed: () async {
                              if (context.read<AddTouristCubit>().formKey.currentState!.validate()) {
                                context.read<AddTouristCubit>().addTourist();

                                String name = context.read<AddTouristCubit>().touristNameController.text;
                                String phoneNumber = context.read<AddTouristCubit>().touristPhoneNumberController.text;
                                String whatsAppNumber = context.read<AddTouristCubit>().whatsAppNumberController.text;
                                String email = context.read<AddTouristCubit>().touristEmailController.text;
                                String date = context.read<AddTouristCubit>().touristDateController.text;
                                String countryCode = context.read<AddTouristCubit>().selectedCountryCodeController.text; // Fetch selected country code

                                // Format message with country code before WhatsApp number
                                String message = 'Name: $name\nPhone: $phoneNumber\nWhatsApp: $countryCode$whatsAppNumber\nEmail: $email\nDate: $date';

                                // Replace with your actual WhatsApp number
                                print('Tour guide phone number: ${widget.tourGuidePhoneNumber}');
                                try {
                                  String phoneNumberWithCountryCode = '+2${widget.tourGuidePhoneNumber}';
                                  _launchWhatsApp(phoneNumberWithCountryCode, message);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Success(
                                        touristDate: date,
                                        touristEmail: email,
                                        touristName: name,
                                        touristPhoneNumber:phoneNumber ,
                                        tourGuideName:
                                        widget.tourGuideName,
                                        tourGuidePhoneNumber: widget.tourGuidePhoneNumber,

                                      ),
                                    ),
                                  );

                                }

                                catch (e) {
                                  print('Error: $e');
                                }

                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
