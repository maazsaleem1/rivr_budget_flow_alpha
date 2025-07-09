import 'package:flutter/material.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        elevation: 0,
        title: const Text('App Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _SettingsSection(
            title: 'Account',
            children: [_SettingsTile(title: 'Change Email', icon: Icons.email), _SettingsTile(title: 'Change Password', icon: Icons.lock)],
          ),
          _SettingsSection(
            title: 'Preferences',
            children: [
              _SettingsTile(title: 'Currency', icon: Icons.attach_money, trailing: Text('USD', style: TextStyle(color: Colors.white70))),
              _SettingsTile(title: 'Timezone', icon: Icons.access_time, trailing: Text('GMT+0', style: TextStyle(color: Colors.white70))),
            ],
          ),
          _SettingsSection(
            title: 'Notifications',
            children: [
              _SettingsSwitchTile(title: 'Transaction Alerts', icon: Icons.notifications_active, value: true),
              _SettingsSwitchTile(title: 'Budget Limit Alerts', icon: Icons.notifications, value: false),
              _SettingsSwitchTile(title: 'Goal Progress', icon: Icons.flag, value: true),
            ],
          ),
          _SettingsSection(title: 'Security', children: [_SettingsSwitchTile(title: 'Biometric Login', icon: Icons.fingerprint, value: false)]),
          _SettingsSection(
            title: 'Data & Privacy',
            children: [
              _SettingsTile(title: 'Export Data', icon: Icons.download),
              _SettingsTile(title: 'Delete Account', icon: Icons.delete, iconColor: Colors.red),
            ],
          ),
          _SettingsSection(
            title: 'About',
            children: [
              _SettingsTile(title: 'App Version', icon: Icons.info, trailing: Text('v1.0.0', style: TextStyle(color: Colors.white70))),
              _SettingsTile(title: 'Terms of Service', icon: Icons.description),
              _SettingsTile(title: 'Privacy Policy', icon: Icons.privacy_tip),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SettingsSection({required this.title, required this.children});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      ...children,
      const Divider(color: Color(0x339CA3AF)),
    ],
  );
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final Color? iconColor;
  const _SettingsTile({required this.title, required this.icon, this.trailing, this.iconColor});
  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon, color: iconColor ?? Colors.white),
    title: Text(title, style: const TextStyle(color: Colors.white)),
    trailing: trailing,
    onTap: () {},
  );
}

class _SettingsSwitchTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool value;
  const _SettingsSwitchTile({required this.title, required this.icon, required this.value});
  @override
  Widget build(BuildContext context) => SwitchListTile(
    secondary: Icon(icon, color: Colors.white),
    title: Text(title, style: const TextStyle(color: Colors.white)),
    value: value,
    onChanged: (v) {},
    activeColor: const Color(0xFF00D1E9),
    inactiveThumbColor: Colors.white24,
    inactiveTrackColor: Colors.white10,
  );
}
