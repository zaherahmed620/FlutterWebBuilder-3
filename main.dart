import 'package:flutter/material.dart';

void main() {
  runApp(const YemenCashApp());
}

class YemenCashApp extends StatelessWidget {
  const YemenCashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YemenCash',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      locale: const Locale('ar'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242424),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ✅ الشريط العلوي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/story.png'), // صورة القصة
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/icons/icon-bell.png', width: 20),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/icons/icon-settings.png', width: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ بطاقة الرصيد
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('assets/icons/bg-pattern2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Text("الرصيد", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFF28500))),
                    SizedBox(height: 8),
                    Text("USD *****", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ✅ إعلان تجريبي
            Container(
              height: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/ads/ad1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ شبكة الخدمات
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                serviceBox("تطبيقات", 'assets/icons/icon-apps.png'),
                serviceBox("ألعاب", 'assets/icons/game.png'),
                serviceBox("سداد الفواتير", 'assets/icons/icon-bills.png'),
                serviceBox("العمليات", 'assets/icons/icon-history.png'),
                serviceBox("تحويل إلى حساب", 'assets/icons/icon-transfer.png'),
                serviceBox("بطائق نت", 'assets/icons/card.png'),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),

      // ✅ الشريط السفلي
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: Color(0xFFFFA500),
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/icon-history.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/nav-profile.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/nav-home.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/nav-services.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/icon-bag.png')), label: ''),
        ],
        onTap: (index) {
          // TODO: Handle navigation
        },
      ),
    );
  }

  Widget serviceBox(String label, String iconPath) {
    return InkWell(
      onTap: () {
        // TODO: Navigate
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 40),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}