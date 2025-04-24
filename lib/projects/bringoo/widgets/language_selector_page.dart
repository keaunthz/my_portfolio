import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/projects/bringoo/models/language_model.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class LanguageSelectorPage extends StatefulWidget {
  const LanguageSelectorPage({super.key});

  @override
  State<LanguageSelectorPage> createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  String? _lang;

  @override
  void initState() {
    super.initState();
  }

  final supportedLanguageList = [
    LanguageModel(label: 'English', value: 'en'),
    LanguageModel(label: 'Deutsch', value: 'de'),
  ];

  void onTitlePressed(String? lang) {
    if (lang == _lang) {
      return;
    }
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Changing Language?'),
          content: Text(
            'Would you like to change language? New language will be used at next app restart.',
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              textStyle: const TextStyle(color: BringooColors.error),
              child: Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                if (lang == null) return;
                setState(() {
                  _lang = lang;
                });
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Languages')),
      body: SafeArea(
        child: Container(
          color: BringooColors.neutral[50],
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children:
                supportedLanguageList.map((LanguageModel langModel) {
                  return _buildCheckboxTile();
                }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxTile() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: BringooColors.neutral.shade100),
          ),
        ),
        child: Row(
          children: [
            Radio(
              value: 'en',
              groupValue: _lang,
              onChanged: (String? value) {
                onTitlePressed(value);
              },
            ),
            Text(
              'de',
              style: BringooTypoGraphy.paragraph01Regular(
                context,
              ).copyWith(color: BringooColors.neutral[800]),
            ),
          ],
        ),
      ),
    );
  }
}
