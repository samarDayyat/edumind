import 'package:edumind/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _nameController = TextEditingController();

  // قائمة الاهتمامات
  final List<Map<String, String>> _interests = [
    {'icon': '⚽', 'label': 'رياضة'},
    {'icon': '🎮', 'label': 'ألعاب'},
    {'icon': '🎨', 'label': 'رسم وتصميم'},
    {'icon': '📖', 'label': 'قصص'},
    {'icon': '🏠', 'label': 'ديكور وبناء'},
    {'icon': '🤖', 'label': 'روبوتات وتكنولوجيا'},
  ];

  // قائمة أساليب التعلم
  final List<String> _learningStyles = [
    'بحب أجرب لحالي',
    'بحب حدا يشرحلي خطوة خطوة',
    'بحب التحديات السريعة',
    'بحب الصور والألوان',
    'بحب القصص',
  ];

  final List<int> _selectedInterests = [];
  int? _selectedLearningStyle;

  // الألوان المعتمدة للتطبيق
  final Color _primaryColor = const Color(0xFF6A1B9A); // البنفسجي
  final Color _accentColor = const Color(0xFFFF9800); // البرتقالي

  void _toggleInterest(int index) {
    setState(() {
      if (_selectedInterests.contains(index)) {
        _selectedInterests.remove(index);
      } else {
        if (_selectedInterests.length < 2) {
          _selectedInterests.add(index);
        } else {
          // رسالة تنبيه تفاعلية عند محاولة اختيار أكثر من اهتمامين
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'يمكنك اختيار اهتمامين فقط للحفاظ على بساطة حسابك!',
                style: TextStyle(fontFamily: 'Cairo'),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    final cs = t.colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'إنشاء الملف الشخصي',
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: cs.secondary,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // القسم الأول: الصورة والاسم
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: _accentColor, width: 4),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: _primaryColor.withOpacity(0.1),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: _primaryColor,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              // هنا يتم ربط اختيار الصورة لاحقاً
                            },
                            child: CircleAvatar(
                              backgroundColor: _accentColor,
                              radius: 18,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'Cairo'),
                      decoration: InputDecoration(
                        hintText: 'ما هو اسمك الرائع؟',
                        hintStyle: const TextStyle(fontFamily: 'Cairo'),
                        prefixIcon: Icon(Icons.edit, color: _accentColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: _primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),

              // القسم الثاني: الاهتمامات
              const Text(
                'اختر اهتماماتك المفضلة (1 أو 2 فقط):',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _interests.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedInterests.contains(index);
                  return GestureDetector(
                    onTap: () => _toggleInterest(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? _accentColor.withOpacity(0.15)
                            : Colors.grey[50],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? _accentColor : Colors.grey[300]!,
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: _accentColor.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _interests[index]['icon']!,
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _interests[index]['label']!,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected ? _accentColor : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 35),

              // الخطوة 3: أسلوب التعلم
              const Text(
                'كيف بتحب تتعلم؟',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _learningStyles.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedLearningStyle == index;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedLearningStyle = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? _primaryColor.withOpacity(0.08)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? _primaryColor
                                : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: isSelected ? _primaryColor : Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              _learningStyles[index],
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? _primaryColor
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),

              // زر الحفظ والاستمرار
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed:
                        (_selectedInterests.isNotEmpty &&
                            _selectedLearningStyle != null &&
                            _nameController.text.isNotEmpty)
                        ? () {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        : null, // يبقى الزر معطلاً حتى تُعبأ البيانات الأساسية لضمان تفاعل صحيح
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      disabledBackgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'تأكيد وإنشاء الحساب',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
}
