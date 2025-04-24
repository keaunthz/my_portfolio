import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/constants/icon_constants.dart';
import 'package:portfolio/projects/top_radio/models/post_model.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/utils/enum.dart';
import 'package:portfolio/projects/top_radio/widgets/activity_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/text_input_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final TextEditingController _searchController = TextEditingController();
  CategoryTagEnum _selectedCategory = CategoryTagEnum.unknown;
  List<PostModel> _filteredEvents = [];
  final List<PostModel> _allEvents = [];

  @override
  void initState() {
    super.initState();
    _initializeMockData();
    _searchController.addListener(_filterEvents);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _initializeMockData() {
    _allEvents.addAll([
      // Entertainment
      PostModel(
        id: '1',
        title: 'Music Festival 2023',
        description: 'เทศกาลดนตรีระดับนานาชาติกับศิลปินชื่อดัง',
        imageUrl:
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=600',
        tag: CategoryTagEnum.entertainment,
        place: 'สวนลุมพินี',
        startDate: "17 เม.ย - 20 เม.ย 2567",
      ),
      PostModel(
        id: '2',
        title: 'Stand-up Comedy Night',
        description: 'ค่ำคืนแห่งเสียงหัวเราะกับนักแสดงตลกชั้นนำ',
        imageUrl:
            'https://images.unsplash.com/photo-1551818255-e6e10975bc17?w=600',
        tag: CategoryTagEnum.entertainment,
        place: 'โรงละครอักษรา',
        startDate: "21 เม.ย - 22 เม.ย 2567",
      ),

      // Health
      PostModel(
        id: '3',
        title: 'Yoga in the Park',
        description: 'โยคะกลางแจ้งเพื่อสุขภาพกายและใจ',
        imageUrl:
            'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600',
        tag: CategoryTagEnum.health,
        place: 'สวนเบญจกิติ',
        startDate: "23 เม.ย - 24 เม.ย 2567",
      ),
      PostModel(
        id: '4',
        title: 'Mindfulness Workshop',
        description: 'เรียนรู้การฝึกสมาธิแบบ Mindfulness',
        imageUrl:
            'https://images.unsplash.com/photo-1530026186672-2cd00ffc50fe?w=600',
        tag: CategoryTagEnum.health,
        place: 'ศูนย์สุขภาพจิต',
        startDate: "26 เม.ย - 29 เม.ย 2567",
      ),

      // Promotion
      PostModel(
        id: '5',
        title: 'Black Friday Sale',
        description: 'ส่วนลดสูงสุด 70% ในงาน Black Friday',
        imageUrl:
            'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=600',
        tag: CategoryTagEnum.promotion,
        place: 'ศูนย์การค้าสยามพารากอน',
        startDate: "1 เม.ย - 2 เม.ย 2567",
      ),
      PostModel(
        id: '6',
        title: 'New Store Opening',
        description: 'ร่วมงานเปิดตัวสาขาใหม่ พร้อมโปรโมชั่นพิเศษ',
        imageUrl:
            'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?w=600',
        tag: CategoryTagEnum.promotion,
        place: 'ศูนย์การค้าเอ็มควอเทียร์',
        startDate: "4 เม.ย - 6 เม.ย 2567",
      ),

      // Food
      PostModel(
        id: '7',
        title: 'Food Festival',
        description: 'สัมผัสประสบการณ์อาหารจากทั่วโลก',
        imageUrl:
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600',
        tag: CategoryTagEnum.food,
        place: 'ลานหน้าศูนย์วัฒนธรรม',
        startDate: "7 เม.ย - 8 เม.ย 2567",
      ),
      PostModel(
        id: '8',
        title: 'Wine Tasting',
        description: 'สัมมนาชิมไวน์กับผู้เชี่ยวชาญ',
        imageUrl:
            'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600',
        tag: CategoryTagEnum.food,
        place: 'โรงแรมดุสิตธานี',
        startDate: "9 เม.ย - 10 เม.ย 2567",
      ),

      // HouseWork
      PostModel(
        id: '9',
        title: 'Home Organization Workshop',
        description: 'เรียนรู้เทคนิคการจัดระเบียบบ้าน',
        imageUrl:
            'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?w=600',
        tag: CategoryTagEnum.houseWork,
        place: 'ศูนย์เรียนรู้ชุมชน',
        startDate: "11 เม.ย - 12 เม.ย 2567",
      ),
      PostModel(
        id: '10',
        title: 'DIY Furniture',
        description: 'เวิร์คช็อปทำเฟอร์นิเจอร์ด้วยตัวเอง',
        imageUrl:
            'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=600',
        tag: CategoryTagEnum.houseWork,
        place: 'โฮมโปร สาขาหัวหมาก',
        startDate: "11 เม.ย - 13 เม.ย 2567",
      ),
    ]);

    _filteredEvents = List.from(_allEvents);
  }

  void _filterEvents() {
    final searchText = _searchController.text.toLowerCase();

    setState(() {
      _filteredEvents =
          _allEvents.where((post) {
            final matchesCategory =
                _selectedCategory == CategoryTagEnum.unknown ||
                post.tag == _selectedCategory;
            final matchesSearch = post.title.toLowerCase().contains(searchText);
            return matchesCategory && matchesSearch;
          }).toList();
    });
  }

  void _toggleFavorite(String eventId) {
    setState(() {
      final index = _allEvents.indexWhere((e) => e.id == eventId);
      if (index != -1) {
        final event = _allEvents[index];
        _allEvents[index] = event.copyWith(isFavorite: !event.isFavorite);
        _filterEvents(); // อัปเดต filtered list
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: blackColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              TextInputWidget(
                inputController: _searchController,
                labelName: "",
                hintText: "ค้นหา Event & News",
                left: const Icon(Icons.search),
                right:
                    _searchController.text.isNotEmpty
                        ? GestureDetector(
                          onTap: () {
                            _searchController.clear();
                          },
                          child: const Icon(Icons.close),
                        )
                        : null,
                validationErrorMsg: "",
              ),
              const Gap(20),
              TextStyles.normalTextWidget(
                title: "สิ่งที่คุณชอบ",
                fontSize: 20,
                color: whiteColor,
                fontWeight: FontWeight.w600,
              ),
              const Gap(26),
              ActivityWidget(
                onSelectedCategory: (category) {
                  setState(() {
                    _selectedCategory = category;
                    _filterEvents();
                  });
                },
              ),
              const Gap(20),
              TextStyles.normalTextWidget(
                title: "สิ่งที่น่าสนใจ",
                fontSize: 20,
                color: whiteColor,
                fontWeight: FontWeight.w600,
              ),
              const Gap(26),
              _buildEventsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventsList() {
    if (_filteredEvents.isEmpty) {
      return Center(
        child: TextStyles.normalTextWidget(
          title: "ไม่พบกิจกรรม",
          fontSize: 14,
          color: whiteColor,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _filteredEvents.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final event = _filteredEvents[index];
        return _buildEventCard(event);
      },
    );
  }

  Widget _buildEventCard(PostModel event) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Foo()),
          // );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => EventDetailPage(event: event),
          //   ),
          // );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Container(
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 1920 / 1280,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: event.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 14,
                        bottom: 14,
                        child: GestureDetector(
                          onTap: () {
                            _toggleFavorite(event.id!);
                          },
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color:
                                    event.isFavorite
                                        ? primaryColor
                                        : whiteColor,
                                width: 2,
                              ),
                              color:
                                  event.isFavorite
                                      ? primaryColor
                                      : Colors.transparent,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.favorite_border,
                                color: whiteColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyles.normalTextWidget(
                        title: event.title,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF34495E),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          SvgPicture.asset(
                            IconConstants.calendar,
                            width: 17,
                            height: 17,
                          ),
                          const Gap(10),
                          TextStyles.normalTextWidget(
                            title: event.startDate,
                            fontSize: 14,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const Gap(10),
                      Column(
                        children: <Widget>[
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconConstants.clock,
                                width: 17,
                                height: 17,
                              ),
                              const Gap(10),
                              TextStyles.normalTextWidget(
                                title: "17.00 น. - 03.00 น.",
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconConstants.pin,
                                width: 17,
                                height: 17,
                              ),
                              const Gap(10),
                              TextStyles.normalTextWidget(
                                title: event.place,
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
