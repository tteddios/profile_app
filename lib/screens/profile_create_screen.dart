import 'package:flutter/material.dart';

class ProfileCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1C1B1F)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyle(
                color: Color(0xFF1C1B1F),
                fontSize: 16,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 이미지와 기본 정보를 담는 상단 영역
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 왼쪽 프로필 이미지
                  Container(
  width: 160,
  height: 200,
  decoration: ShapeDecoration(
    color: Color(0xFFEFF1F5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  // Center 위젯으로 아이콘을 중앙 정렬
  child: Center(
    child: Icon(
      Icons.add,
      size: 18,  // 아이콘 크기
      color: Color(0xFF525252),  // 검정색 아이콘
    ),
  ),
)
                  ,SizedBox(width: 16),
                  // 오른쪽 기본 정보
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '김00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '90.01.01. M',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),
                        Text(
                          '010-1234-5678',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),
                        Text(
                          '00팀 / 대리 / 00기공채',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Details 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('details'),
                  _buildDetailItem('주변인 관계'),
                  _buildDetailItem('sns 링크'),
                  _buildDetailItem('경력'),
                  _buildDetailItem('성격, 취향, 취미'),
                  _buildDetailItem('/'),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Photos 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('photos'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 8),
                          width: 120,
                          height: 120,
                          decoration: ShapeDecoration(
                            color: Color(0xFFEFF1F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Voices 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('voices'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => _buildVoiceItem(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Files 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('files'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => _buildFileItem(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1C1B1F),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Color(0xFF1C1B1F)),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        children: [
          Text(
            '• $text',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF1C1B1F),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF1C1B1F)),
        ],
      ),
    );
  }

  Widget _buildVoiceItem() {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Color(0xFFEFF1F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mic, color: Color(0xFF1C1B1F)),
          Text('241212', style: TextStyle(fontSize: 12)),
          Text('00건 계약 관련', style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildFileItem() {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Color(0xFFEFF1F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.insert_drive_file, color: Color(0xFF1C1B1F)),
          Text('241212', style: TextStyle(fontSize: 12)),
          Text('00건 계약 관련', style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
