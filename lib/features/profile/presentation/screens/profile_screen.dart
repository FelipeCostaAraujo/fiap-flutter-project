import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobr1/core/components/components.dart';

import '../../profile.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  final ProfileViewModel profile;
  const ProfileScreen({required this.profile, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? localPicture;

  @override
  initState() {
    super.initState();
    nameController.text = widget.profile.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Perfil', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: choicePhoto,
                child: CircleAvatar(
                  radius: 100,
                  child: ClipOval(
                    child: widget.profile.picture.isNotEmpty && localPicture == null
                        ? Image.network(
                            widget.profile.picture,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          )
                        : Image.asset(
                            localPicture ?? 'assets/images/cat.jpg',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome é obrigatório';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: widget.profile.email,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () async {
                if(formKey.currentState!.validate()){
                  widget.profile.name = nameController.text;
                  await context.read<ProfileCubit>().saveProfileData(widget.profile.toEntity());
                  if(context.mounted){
                    showSnackMessage(context, "Perfil salvo com sucesso!");
                  }
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  choicePhoto(){
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Câmera'),
              onTap: () {
                Navigator.pop(context);
                callCamera(ImageSource.camera);
              },
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galeria'),
              onTap: () {
                Navigator.pop(context);
                callCamera(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  Future callCamera(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        widget.profile.picture = image.path;
        localPicture = image.path;
      });
    }
  }
}
