
import 'package:flutter/material.dart';

void main() {
  runApp(const KidsWorldApp());
}

class KidsWorldApp extends StatelessWidget {
  const KidsWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF6558D3);

    return MaterialApp(
      title: 'عالم الطفل - Kids World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFF7F7FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F7FC),
          foregroundColor: Color(0xFF29264D),
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          shadowColor: const Color(0x1A28204D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: KidsWorldShell(),
      ),
    );
  }
}

// بيانات الأنشطة التعليمية
class LearningActivity {
  const LearningActivity(
    this.title,
    this.subtitle,
    this.emoji,
    this.color,
    this.items,
  );

  final String title;
  final String subtitle;
  final String emoji;
  final Color color;
  final List<String> items;
}

// الشاشة الرئيسية والتنقل
class KidsWorldShell extends StatefulWidget {
  const KidsWorldShell({super.key});

  @override
  State<KidsWorldShell> createState() => _KidsWorldShellState();
}

class _KidsWorldShellState extends State<KidsWorldShell> {
  int selectedIndex = 0;

  static const pages = [
    HomePage(),
    SimplePage(
      icon: '🌍',
      title: 'اكتشف العالم',
      subtitle: 'تعرف على الحيوانات والأماكن والأشياء من حولك',
    ),
    GamesPage(),
    ParentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_rounded),
            label: 'اكتشف',
          ),
          NavigationDestination(
            icon: Icon(Icons.extension_rounded),
            label: 'ألعابي',
          ),
          NavigationDestination(
            icon: Icon(Icons.family_restroom_rounded),
            label: 'الأسرة',
          ),
        ],
      ),
    );
  }
}

// الأنشطة التعليمية
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const activities = <LearningActivity>[
    LearningActivity(
      'الحروف',
      'أ ب ت',
      '🔤',
      Color(0xFFE8E4FF),
      ['أ', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر'],
    ),
    LearningActivity(
      'الأرقام',
      '1 2 3',
      '🔢',
      Color(0xFFFFE9D9),
      ['١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'],
    ),
    LearningActivity(
      'الألوان',
      'ألوان جميلة',
      '🎨',
      Color(0xFFFFE4EE),
      ['أحمر ❤️', 'أزرق 💙', 'أصفر 💛', 'أخضر 💚', 'بنفسجي 💜'],
    ),
    LearningActivity(
      'الحيوانات',
      'أصدقاء صغار',
      '🐼',
      Color(0xFFE1F5E9),
      ['أسد 🦁', 'قطة 🐱', 'أرنب 🐰', 'فيل 🐘', 'زرافة 🦒'],
    ),
    LearningActivity(
      'الإنجليزية',
      'Learn English',
      '🌟',
      Color(0xFFE0F1FF),
      ['Apple 🍎', 'Cat 🐱', 'Sun ☀️', 'Book 📘', 'Ball ⚽'],
    ),
    LearningActivity(
      'القصص',
      'حكايات ممتعة',
      '📚',
      Color(0xFFFFF2CC),
      ['الأرنب والنجمة', 'الصديق الوفي', 'رحلة إلى الغابة'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E4FF),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: Text('🌈', style: TextStyle(fontSize: 29)),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عالم الطفل',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF29264D),
                        ),
                      ),
                      Text(
                        'نتعلم ونلعب كل يوم!',
                        style: TextStyle(color: Color(0xFF77758E)),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'الملف الشخصي',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('سيُضاف الملف الشخصي لاحقاً'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),

        // بطاقة الترحيب
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF7568E8),
                    Color(0xFF9B83E8),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحباً يا بطل! 👋',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'هل أنت مستعد لمغامرة جديدة\nمن التعلم والمرح؟',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.6,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('🧒🏻👧🏻', style: TextStyle(fontSize: 48)),
                ],
              ),
            ),
          ),
        ),

        // الشخصيات
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Text('👧🏻', style: TextStyle(fontSize: 36)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ريتال وكنان',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'أصدقاؤك في رحلة التعلم والاكتشاف',
                          style: TextStyle(
                            color: Color(0xFF77758E),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('👦🏻', style: TextStyle(fontSize: 36)),
                ],
              ),
            ),
          ),
        ),

        // عنوان الأنشطة
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  'هيا نتعلم',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF29264D),
                  ),
                ),
                SizedBox(width: 7),
                Text('✨', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),

        // بطاقات الأنشطة
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ActivityCard(
                  activity: activities[index],
                );
              },
              childCount: activities.length,
            ),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 13,
              crossAxisSpacing: 13,
              childAspectRatio: 1.05,
            ),
          ),
        ),

        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 28),
          sliver: SliverToBoxAdapter(
            child: Text(
              'مع ريتال وكنان، كل يوم حكاية واكتشاف جديد 💜',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF77758E),
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// بطاقة النشاط
class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
  });

  final LearningActivity activity;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ActivityPage(activity: activity),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 53,
                height: 53,
                decoration: BoxDecoration(
                  color: activity.color,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Center(
                  child: Text(
                    activity.emoji,
                    style: const TextStyle(fontSize: 29),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Color(0xFF29264D),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    activity.subtitle,
                    style: const TextStyle(
                      color: Color(0xFF85839A),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// صفحة النشاط
class ActivityPage extends StatelessWidget {
  const ActivityPage({
    super.key,
    required this.activity,
  });

  final LearningActivity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: activity.color,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(
                  activity.emoji,
                  style: const TextStyle(fontSize: 55),
                ),
                const SizedBox(height: 8),
                Text(
                  'هيا نتعرف على ${activity.title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF29264D),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: activity.items.map((item) {
              return Chip(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(12),
                label: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'أحسنت! 🌟 أنت بطل عالم الطفل',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.stars_rounded),
            label: const Text('أحسنت!'),
          ),
        ],
      ),
    );
  }
}

// صفحة الاكتشاف
class SimplePage extends StatelessWidget {
  const SimplePage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 65),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: Color(0xFF29264D),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF77758E),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة الألعاب
class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const games = [
      ('لعبة الحروف', '🔤', 'تعرف على الحروف العربية'),
      ('لعبة الأرقام', '🔢', 'تعلم العد بطريقة ممتعة'),
      ('لعبة الذاكرة', '🧠', 'اختبر ذاكرتك وتركيزك'),
      ('لعبة الألوان', '🎨', 'اكتشف الألوان الجميلة'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ألعابي 🧩'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: games.map((game) {
          return Card(
            margin: const EdgeInsets.only(bottom: 13),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: Text(
                game.$2,
                style: const TextStyle(fontSize: 35),
              ),
              title: Text(
                game.$1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(game.$3),
              trailing: const Icon(Icons.arrow_back_ios_new),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${game.$1} ستتوفر قريباً!'),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ركن ولي الأمر
class ParentPage extends StatelessWidget {
  const ParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ركن ولي الأمر 👨‍👩‍👧'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: Text('👨‍👩‍👧‍👦', style: TextStyle(fontSize: 75)),
          ),
          const SizedBox(height: 15),
          const Text(
            'مرحباً بكم في ركن الأسرة',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w900,
              color: Color(0xFF29264D),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'مساحة مخصصة لمتابعة تعلم الطفل وإدارة تجربته بأمان.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF77758E),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 25),
          const ParentOption(
            icon: Icons.school_rounded,
            title: 'متابعة التعلم',
            subtitle: 'متابعة الأنشطة التي يتعلمها الطفل',
          ),
          const ParentOption(
            icon: Icons.volume_up_rounded,
            title: 'إعدادات الصوت',
            subtitle: 'إعدادات الأصوات والقراءة',
          ),
          const ParentOption(
            icon: Icons.security_rounded,
            title: 'أمان الطفل',
            subtitle: 'تجربة آمنة ومناسبة للأطفال',
          ),
        ],
      ),
    );
  }
}

class ParentOption extends StatelessWidget {
  const ParentOption({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF6558D3),
          size: 30,
        ),
        title: Text(
          title,
  
