import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/features/settings/presentation/presentation.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsViewModel model;
  static const String routeName = '/settings';
  const SettingsScreen({required this.model, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notificações'),
            value: widget.model.isNotifications,
            onChanged: (value) {
              setState(() {
                widget.model.isNotifications = value;
              });
              context.read<SettingsCubit>().savePreferences(widget.model);
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Aparência',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Modo automático'),
            value: widget.model.isSystemMode,
            onChanged: (value) {
              setState(() {
                widget.model.isSystemMode = value;
              });
              context.read<SettingsCubit>().savePreferences(widget.model);
            },
          ),
          SwitchListTile(
            title: const Text('Modo escuro'),
            value: widget.model.isDarkMode,
            onChanged: !widget.model.isSystemMode
                ? (value) {
                    setState(() {
                      widget.model.isDarkMode = value;
                    });
                    context.read<SettingsCubit>().savePreferences(widget.model);
                  }
                : null,
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'É necessario fechar e abrir o app para aplicar as alterações',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
