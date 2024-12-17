import 'package:flutter/material.dart';
import 'package:profile_app/screens/profile_create_screen.dart';


void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: ListView(children: [
          ProfileSearchScreen(),
        ]),
      ),
    );
  }
}

class ProfileSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // 배경색을 흰색으로 설정
      body: SafeArea(
        child: Column(
          children: [
            // Title 섹션
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profiles',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C1B1F),
                  ),
                ),
              ),
            ),
            
            // Search Bar 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  color: Color(0xFFEFF1F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Color(0xFFA09CAB)),
                    hintText: 'Search for name,tag...',
                    hintStyle: TextStyle(
                      color: Color(0xFFA09CAB),
                      fontSize: 16,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ),
            
            // Tags 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTag('인사팀', Color(0xFF525252), Color(0xFFF6F6F6)),
                    SizedBox(width: 8),
                    _buildTag('00동아리', Color(0xFF4E21B6), Color(0xFFF7F3FF)),
                    SizedBox(width: 8),
                    _buildTag('00대학교', Color(0xFFAB0909), Color(0xFFFFF0F0)),
                  ],
                ),
              ),
            ),

            // Profile List 섹션
            Expanded(
              child: ListView(
                children: [
                  _buildProfileListItem('김00', ['인사팀', '00동아리']),
                  _buildProfileListItem('한00', ['인사팀', '00대학교']),
                ],
              ),
            ),
            
            // Create New Button 섹션
            // Create New Button 섹션
Padding(
  padding: const EdgeInsets.all(16),
  child: SizedBox(
    width: double.infinity,
    height: 52,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1C1B1F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        // ProfileDetailScreen으로 네비게이션
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileCreateScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Create New',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label, Color textColor, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildProfileListItem(String name, List<String> tags) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 64,
            decoration: ShapeDecoration(
              color: Color(0xFFEFF1F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C1B1F),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: tags.map((tag) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _buildTag(tag, 
                      tag == '인사팀' ? Color(0xFF525252) : 
                      tag == '00동아리' ? Color(0xFF4E21B6) : Color(0xFFAB0909),
                      tag == '인사팀' ? Color(0xFFF6F6F6) : 
                      tag == '00동아리' ? Color(0xFFF7F3FF) : Color(0xFFFFF0F0),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDetailScreen {
}


  Widget _buildTitle() {
  return Positioned(
    left: 0,
    top: 100, // 80에서 100으로 수정하여 더 아래로 이동
    child: Container(
      height: 40, // 56에서 40으로 수정하여 간격을 좁힘
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), // vertical padding 수정
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Profiles',
              style: TextStyle(
                color: Color(0xFF1C1B1F),
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
 
  Widget _buildSearchBar() {
    return Positioned(
      left: 0,
      top: 136,
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: ShapeDecoration(
            color: Color(0xFFEFF1F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Color(0xFFA09CAB)),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for name,tag...',
                    hintStyle: TextStyle(
                      color: Color(0xFFA09CAB),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTags() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,  // 왼쪽 정렬로 변경
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTag('인사팀', Color(0xFF525252), Color(0xFFF6F6F6)),
          SizedBox(width: 8),
          _buildTag('00동아리', Color(0xFF4E21B6), Color(0xFFF7F3FF)),
          SizedBox(width: 8),
          _buildTag('00대학교', Color(0xFFAB0909), Color(0xFFFFF0F0)),
        ],
      ),
    ),
  );
}


  Widget _buildTag(String label, Color textColor, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: textColor,
          ),
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProfileList() {
    return Positioned(
      left: 0,
      top: 275,
      child: Container(
        height: 160,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            _buildProfileListItem('김00', ['인사팀', '00동아리']),
            _buildProfileListItem('한00', ['인사팀', '00대학교']),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileListItem(String name, List<String> tags) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 64,
            decoration: ShapeDecoration(
              color: Color(0xFFEFF1F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Color(0xFF1C1B1F),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: tags.map((tag) => _buildProfileTag(tag)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTag(String tag) {
    Color textColor;
    Color backgroundColor;
    switch (tag) {
      case '인사팀':
        textColor = Color(0xFF525252);
        backgroundColor = Color(0xFFF6F6F6);
        break;
      case '00동아리':
        textColor = Color(0xFF4E21B6);
        backgroundColor = Color(0xFFF7F3FF);
        break;
      case '00대학교':
        textColor = Color(0xFFAB0909);
        backgroundColor = Color(0xFFFFF0F0);
        break;
      default:
        textColor = Color(0xFF525252);
        backgroundColor = Color(0xFFF6F6F6);
    }

    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildCreateNewButton() {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Container(
        width: 390,
        height: 68,
        padding: const EdgeInsets.only(top: 4, bottom: 12),
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              // TODO: 새 프로필 생성 로직 구현
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Create New',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1C1B1F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(double.infinity, 52),
            ),
          ),
        ),
      ),
    );
  }
