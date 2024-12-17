import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfileListItem extends StatelessWidget {
  final Profile profile;

  const ProfileListItem({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profile.imageUrl),
      ),
      title: Text(
        profile.name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Wrap(
            spacing: 4,
            children: profile.tags.map((tag) => _buildTagChip(tag)).toList(),
          ),
        ],
      ),
      onTap: () {
        // TODO: 프로필 상세 페이지로 이동하는 로직
      },
    );
  }

  Widget _buildTagChip(String label) {
    Color textColor;
    Color backgroundColor;

    switch (label) {
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
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
