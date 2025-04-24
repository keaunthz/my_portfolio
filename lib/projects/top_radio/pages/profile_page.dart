import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/widgets/profile_item.dart';
import 'package:portfolio/projects/top_radio/widgets/rounded_button_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String mockProfileImageUrl =
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextStyles.thaiTextWidget(
          title: "ลุ้นของรางวัล",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 80, // Equivalent to width/height 100
                      backgroundImage: NetworkImage(mockProfileImageUrl),
                    ),
                  ),
                  const Gap(20),
                  ProfileItem("ข้อมูลส่วนตัว", () => {}),
                  const Gap(20),
                  ProfileItem("เชื่อมโยงบัญชี", () => {}),
                  const Gap(20),
                  ProfileItem("ข้อกำหนดและเงื่อนไข", () => {}),
                  const Gap(20),
                  ProfileItem("ตั้งค่าแจ้งเตือน", () => {}),
                  const Gap(20),
                  ProfileItem("การขอสิทธิ์ของเจ้าของข้อมูล", () => {}),
                  const Gap(20),
                  ProfileItem("เกี่ยวกับเรา", () => {}),
                  const Gap(20),
                  RoundedButtonWidget(
                    content: 'ออกจากระบบ',
                    onTapFunction: () async {},
                    backgroundColor: redAccColor,
                  ),
                  const Gap(100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
