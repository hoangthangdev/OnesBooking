import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ones_booking/Controls/profile.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/gestures.dart';
import 'package:ones_booking/ViewPage/CreateNewAccount/form_input.dart';
import 'dart:async';

class HomeNewAccount extends StatelessWidget {
  const HomeNewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: TextInput(),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({Key? key}) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _keyinput = GlobalKey<FormState>();
  var firstDate = DateTime
      .now()
      .year - 1;
  var lastDate = DateTime
      .now()
      .year + 1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyinput,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15.0, 45.0, 15.0, 0.0),
                child: AvatarProfile(),
              ),
              Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Account Name',
                            prefixIcon: Icon(
                              Icons.perm_identity_outlined,
                              color: Colors.black87,
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter some text';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'PassWord (*)',
                            prefixIcon: Icon(
                              Icons.vpn_key_rounded,
                              color: Colors.black87,
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter some text';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Retype PassWord (*)',
                            prefixIcon: Icon(
                              Icons.vpn_key_rounded,
                              color: Colors.black87,
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter some text';
                            }
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Text(
                      'Personal information',
                      style: TextStyle(
                        fontFamily: 'openSans',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                          color: Colors.black,
                          height: 3.0,
                        ))
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'First Name (*)',
                            prefixIcon: Icon(
                              Icons.perm_identity_outlined,
                              color: Colors.black87,
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter some text';
                            }
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Middle Name',
                              prefixIcon: Icon(
                                Icons.vpn_key_rounded,
                                color: Colors.black87,
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Gender',
                              prefixIcon: Icon(
                                Icons.vpn_key_rounded,
                                color: Colors.black87,
                              )),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Last Name (*)',
                            prefixIcon: Icon(
                              Icons.perm_identity_outlined,
                              color: Colors.black87,
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter some text';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: InputDatePickerFormField(
                          firstDate: DateTime(firstDate),
                          lastDate: DateTime(lastDate),
                          initialDate: DateTime.now(),
                          fieldHintText: "Birth date",
                          onDateSaved: (DateTime date) => {print(date)},
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Nationality',
                              prefixIcon: Icon(
                                Icons.vpn_key_rounded,
                                color: Colors.black87,
                              )),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15.0, 20, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Phone (*)',
                prefixIcon: Icon(
                  Icons.vpn_key_rounded,
                  color: Colors.black87,
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return ' Please enter some text';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15.0, 20, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email (*)',
                prefixIcon: Icon(
                  Icons.vpn_key_rounded,
                  color: Colors.black87,
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return ' Please enter some text';
                }
              },
            ),
          ),
          const Agree(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                if (_keyinput.currentState!.validate()) {
                  _showDialog(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Register False!'),
                    backgroundColor: Colors.deepOrangeAccent,
                  ));
                }
              },
              child: const Text('Register'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'I already have an account',
            style: TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarProfile extends StatefulWidget {
  const AvatarProfile({Key? key}) : super(key: key);

  @override
  _AvatarProfileState createState() => _AvatarProfileState();
}

class _AvatarProfileState extends State<AvatarProfile> {
  final ProfileController profilerController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 40,
              ),
            ],
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Obx(() {
                  if (profilerController.isLoading.value) {
                    return const CircleAvatar(
                      backgroundImage: AssetImage('assets/no-user.png'),
                      child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          )),
                    );
                  } else {
                    if (profilerController.imageURL.isNotEmpty) {
                      return CachedNetworkImage(
                        imageUrl: profilerController.imageURL,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) =>
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: imageProvider,
                            ),
                        placeholder: (context, url) =>
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/no-user.png'),
                          child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )),
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      );
                    } else {
                      return const CircleAvatar(
                        backgroundImage: AssetImage('assets/no-user.png'),
                      );
                    }
                  }
                }),
                Positioned(
                  right: -5,
                  bottom: 0,
                  child: SizedBox(
                    height: 20,
                    width: 44,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(primary: Colors.grey[200]),
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0)),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.end,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera),
                                  title: const Text('Camera'),
                                  onTap: () {
                                    Get.back();
                                    profilerController
                                        .uploadImage(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.image),
                                  title: const Text('Gallery'),
                                  onTap: () {
                                    Get.back();
                                    profilerController
                                        .uploadImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset('assets/dslr-camera.svg'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Agree extends StatefulWidget {
  const Agree({Key? key}) : super(key: key);

  @override
  _AgreeState createState() => _AgreeState();
}

class _AgreeState extends State<Agree> {
  bool? _agreeCheck = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              value: _agreeCheck,
              checkColor: Colors.blue,
              activeColor: Colors.black26,
              onChanged: (value) {
                setState(() {
                  _agreeCheck = value;
                });
              },
            ),
          ),
          Link(
            uri: Uri.parse('https://androidride.com'),
            //target: LinkTarget.self,
            builder: (context, followLink) {
              return RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: 'I agree with ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms and conditions',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = followLink,
                  ),
                ]),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _showDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
            Center(
              child: Text('OTP'),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              OtpInput(),
              SizedBox(
                height: 20,
              ),
              BuildTime(),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 25.0,
                  height: 25.0,
                  child: ElevatedButton(
                    child: const Text("Save"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
class BuildTime extends StatelessWidget {
  const BuildTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 120.0, end: 0.0),
          duration:const Duration(seconds: 120),
          builder: (_, value, child) => Text(
            value.toString().split('.')[0],
            style:const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

