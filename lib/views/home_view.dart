import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_app/app/constants/strings.dart';
import 'package:riverpod_api_app/controller/user_controller.dart';

class HomeView extends ConsumerWidget {
  final controller = ChangeNotifierProvider((ref) => UserController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(controller);
    ref.read(controller).getUserList();
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            StringConstants.home_page_title,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView.separated(
              itemBuilder: (context, index) {
                var userData = watch.users[index]!;
                return Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    leading: userData.avatar != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(userData.avatar!),
                            radius: 25)
                        : Container(),
                    title: Text(
                        "${userData.firstName ?? ""} ${userData.lastName ?? ""} ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    subtitle: Text("${userData.email ?? ""}} ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15)),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: ref.watch(controller).users.length),
        ));
  }
}
