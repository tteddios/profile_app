import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileCreateScreen extends StatefulWidget {
  @override
  _ProfileCreateScreenState createState() => _ProfileCreateScreenState();
}

class _ProfileCreateScreenState extends State<ProfileCreateScreen> {
  File? selectedImage;
  bool isDetailsExpanded = true;
  bool isPhotosExpanded = true;
  bool isVoicesExpanded = true;
  bool isFilesExpanded = true;
  Map<String, List<String>> subItems = {};
  Map<String, bool> isSubItemsExpanded = {};
  
  List<String> detailItems = [
    '경력',
    '성격',
    '취향',
    '취미',
    '주변인 관계',
    'sns 링크'
  ];

  final List<Color> borderColors = [
    Color(0xFF525252),
    Color(0xFFAB0909),
    Color(0xFF6750A4),
    Color(0xFF1A237E),
  ];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

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
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 이미지와 기본 정보
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 160,
                      height: 200,
                      decoration: ShapeDecoration(
                        color: Color(0xFFEFF1F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Icon(
                              Icons.add,
                              size: 32,
                              color: Color(0xFF525252),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1B1F),
                          ),
                          decoration: InputDecoration(
                            hintText: '이름',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            isDense: true,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                        SizedBox(height: 0),
                        TextField(
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1C1B1F),
                          ),
                          decoration: InputDecoration(
                            hintText: '생년월일 (예: 970707)',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            isDense: true,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1C1B1F),
                          ),
                          decoration: InputDecoration(
                            hintText: '전화번호',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            isDense: true,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.phone,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1C1B1F),
                          ),
                          decoration: InputDecoration(
                            hintText: '소속/직급',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            isDense: true,
                          ),
                          textAlignVertical: TextAlignVertical.center,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDetailsExpanded = !isDetailsExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          'details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),
                        Icon(
                          isDetailsExpanded 
                            ? Icons.keyboard_arrow_down 
                            : Icons.keyboard_arrow_up,
                          color: Color(0xFF1C1B1F),
                        ),
                      ],
                    ),
                  ),
                  if (isDetailsExpanded)
                    ...detailItems.map((item) => _buildDetailItem(item)),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Photos 섹션
            _buildSectionHeader('photos'),
            if (isPhotosExpanded)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(4, (index) => _buildPhotoItem()),
                  ),
                ),
              ),
            SizedBox(height: 16),

            // Voices 섹션
            _buildSectionHeader('voices'),
            if (isVoicesExpanded)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(5, (index) => _buildVoiceItem()),
                  ),
                ),
              ),
            SizedBox(height: 16),

            // Files 섹션
            _buildSectionHeader('files'),
            if (isFilesExpanded)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(5, (index) => _buildFileItem()),
                  ),
                ),
              ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String text) {
    final subItemsList = subItems[text] ?? [];
    final isExpanded = isSubItemsExpanded[text] ?? true;
    
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8),
          height: 48,
          child: Row(
            children: [
              Text(
                '•',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1C1B1F),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: text,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    isDense: true,
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1C1B1F),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              if (subItemsList.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSubItemsExpanded[text] = !(isSubItemsExpanded[text] ?? true);
                    });
                  },
                  child: Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 16,
                    color: Color(0xFF1C1B1F),
                  ),
                )
              else
                GestureDetector(
                  onTap: () {
                    setState(() {
                      subItems[text] = [''];
                      isSubItemsExpanded[text] = true;
                    });
                  },
                  child: Icon(Icons.add, size: 16, color: Color(0xFF1C1B1F)),
                ),
            ],
          ),
        ),
        if (subItemsList.isNotEmpty && isExpanded)
          ...subItemsList.asMap().entries.map((entry) {
            final index = entry.key;
            return Container(
              padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
              height: 48,
              child: Row(
                children: [
                  Text(
                    '•',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1C1B1F),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColors[index % borderColors.length],
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '세부 내용을 입력하세요',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1C1B1F),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        subItems[text]!.add('');
                      });
                    },
                    child: Icon(Icons.add, size: 16, color: Color(0xFF1C1B1F)),
                  ),
                ],
              ),
            );
          }).toList(),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    bool isExpanded = title == 'photos' 
      ? isPhotosExpanded 
      : title == 'voices' 
        ? isVoicesExpanded 
        : isFilesExpanded;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (title == 'photos') {
            isPhotosExpanded = !isPhotosExpanded;
          } else if (title == 'voices') {
            isVoicesExpanded = !isVoicesExpanded;
          } else if (title == 'files') {
            isFilesExpanded = !isFilesExpanded;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 16),
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
            Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              color: Color(0xFF1C1B1F),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoItem() {
    return Container(
      width: 120,
      height: 120,
      margin: EdgeInsets.only(right: 8),
      decoration: ShapeDecoration(
        color: Color(0xFFEFF1F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
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
      ],
    ),
  );
}
}