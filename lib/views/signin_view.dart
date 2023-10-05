// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_app/app/cache/cache_manager.dart';
import 'package:riverpod_api_app/app/constants/route_constants.dart';
import 'package:riverpod_api_app/app/constants/strings.dart';
import 'package:riverpod_api_app/controller/user_controller.dart';
import 'package:riverpod_api_app/models/user_model.dart';
import 'package:riverpod_api_app/widgets/button_widget.dart';
import 'package:riverpod_api_app/widgets/input_widget.dart';

class SignInView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final controller = ChangeNotifierProvider((ref) => UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      var user = CacheManager.getInstance
          .getCacheItem<UserModel>("UserData", UserModel());
      if (user != null) {
        Navigator.pushNamed(context, RouteCostants.home);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          StringConstants.signin_page_title,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputWidget(
                    controller: _mailController,
                    prefixIcon: const Icon(Icons.email),
                    hintText: StringConstants.mail_address_hint_text,
                  ),
                  InputWidget(
                    controller: _passwordController,
                    prefixIcon: const Icon(Icons.verified_user),
                    hintText: StringConstants.password_hint_text,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                      text: StringConstants.signin,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      textColor: Colors.black,
                      width: 300,
                      height: 50,
                      fontSize: 25,
                      radius: 4,
                      boxShadow: Colors.black,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          var model = UserModel(
                              email: _mailController.text,
                              password: _passwordController.text);
                          var status = await ref.read(controller).signin(model);

                          if (status) {
                            Navigator.pushNamed(context, RouteCostants.home);
                          }
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
