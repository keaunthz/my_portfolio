import 'package:flutter/material.dart';
import 'package:portfolio/projects/bringoo/models/faq_topic.dart';
import 'package:portfolio/projects/bringoo/widgets/faq_detail_page.dart';
import 'package:portfolio/projects/bringoo/widgets/menu_sections.dart';

abstract class UserGroupEnum {
  static String manager = 'manager';
  static String staff = 'staff';
  static String customer = 'customer';
}

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  bool loading = true;
  List<FaqTopicDao> faqList = [];

  @override
  void initState() {
    super.initState();
    loadFAQs();
  }

  void loadFAQs() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final mockFaqTopics = [
      FaqTopicDao(
        id: '1',
        code: 'general',
        name: 'General Questions',
        description: 'Common questions about the app',
        items: [
          FaqTopicItem(
            id: '1-1',
            code: 'how-to-use',
            userGroup: UserGroupEnum.staff,
            name: 'How to use the app?',
            description: 'Step by step guide to use the application',
          ),
          FaqTopicItem(
            id: '1-2',
            code: 'login-issue',
            userGroup: UserGroupEnum.staff,
            name: 'Login problems',
            description: 'Troubleshooting login issues',
          ),
        ],
      ),
      FaqTopicDao(
        id: '2',
        code: 'payments',
        name: 'Payment Questions',
        description: 'Questions about payments and transactions',
        items: [
          FaqTopicItem(
            id: '2-1',
            code: 'payment-methods',
            userGroup: UserGroupEnum.staff,
            name: 'Available payment methods',
            description: 'List of all supported payment methods',
          ),
        ],
      ),
    ];

    final staffFaqList =
        mockFaqTopics
            .map((topic) {
              final staffItems =
                  topic.items
                      ?.where((item) => item.userGroup == UserGroupEnum.staff)
                      .toList();
              return topic..items = staffItems;
            })
            .where((topic) => topic.items?.isNotEmpty ?? false)
            .toList();

    setState(() {
      faqList = staffFaqList;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
          appBar: AppBar(title: const Text('FAQs')),
          body: SafeArea(
            child: ListView.builder(
              itemCount: faqList.length,
              itemBuilder: (context, index) {
                final faqTopics = faqList[index];
                return MenuSections(
                  headerText: faqTopics.name ?? '',
                  sections:
                      faqTopics.items
                          ?.map(
                            (e) => MenuSectionModel(
                              label: e.name,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => FaqDetailPage(
                                          parentGroupName: faqTopics.name ?? '',
                                          faqTopicItem: e,
                                        ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList() ??
                      [],
                );
              },
            ),
          ),
        );
  }
}
