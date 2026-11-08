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
          foregroundColor: Color(0xFF252344),
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

class KidsWorldShell extends StatefulWidget {
  const KidsWorldShell({super.key});

  @override
  State<KidsWorldShell> createState() => _KidsWorldShellState();
}

class _KidsWorldShellState extends State<KidsWorldShell> {
  int _selectedIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const SimplePage(
        icon: '🌍',
        title: 'اكتشف العالم',
        subtitle: 'قريباً سنكتشف الحيوانات والأماكن والأشياء من حولنا',
      ),
      const SimplePage(
        icon: '🧩',
        title: 'ألعابي',
        subtitle: 'ستجد هنا ألعاباً تعليمية ممتعة وتتحدى ذكاءك',
      ),
      const SimplePage(
        icon: '👨‍👩‍👧',
        title: 'ركن ولي الأمر',
        subtitle: 'إعدادات الأسرة ومتابعة تقدم الطفل ستتوفر هنا',
      ),
    ];

    return Scaffold(
      body: SafeArea(child: IndexedStack(index: _selectedIndex, children: pages)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.explore_rounded), label: 'اكتشف'),
          NavigationDestination(icon: Icon(Icons.extension_rounded), label: 'ألعابي'),
          NavigationDestination(icon: Icon(Icons.family_restroom_rounded), label: 'الأسرة'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const activities = <LearningActivity>[
   const LearningActivity('الحروفconst', 'أ ب ت', '🔤', const Color(0xFFE8E4FF),
        ['أ', 'ب', 'ت', 'ث', 'ج', 'ح']),
   const LearningActivity('الأرقامconst', '1 2 3', '🔢', const Color(0xFFFFE9D9),
        ['١', '٢', '٣', '٤', '٥', '٦']),
   const LearningActivity('الألوانconst', 'ألوان جميلة', '🎨', const Color(0xFFFFE4EE),
        ['أحمر ❤️', 'أزرق 💙', 'أصفر 💛', 'أخضر 💚']),
   const LearningActivity('الحيوانات', 'أصدقاء صغار', '🐼', const Color(0xFFE1F5E9),
        ['أسد 🦁', 'قطة 🐱', 'أرنب 🐰', 'فيل 🐘']),
  const  LearningActivity('الإنجليزية', 'Hello!', '🌟', const Color(0xFFE0F1FF),
        ['Apple 🍎', 'Cat 🐱', 'Sun ☀️', 'Book 📘']),
  const  LearningActivity('القصص', 'حكايات ممتعة', '📚', const Color(0xFFFFF2CC),
        ['الأرنب والنجمة', 'الصديق الوفي', 'رحلة إلى الغابة']),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E4FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text('🌈', style: TextStyle(fontSize: 27)),
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
                          fontSize: 21,
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
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('سيُضاف الملف الشخصي لاحقاً')),
                  ),
                  icon: const Icon(Icons.account_circle_rounded, size: 31),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7568E8), Color(0xFF9B83E8)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Row(
                children: [
                  const Expanded(
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
                          'هل أنت مستعد لمغامرة\nجديدة من التعلم والمرح؟',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('🧒🏻👧🏻', style: TextStyle(fontSize: 47)),
                ],
              ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
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
                Text('✨', style: TextStyle(fontSize: 19)),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ActivityCard(activity: activities[index]),
              childCount: activities.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 13,
              crossAxisSpacing: 13,
              childAspectRatio: 1.13,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 24),
          sliver: SliverToBoxAdapter(
            child: Text(
              'مع ريتال وكنان، كل يوم حكاية واكتشاف جديد 💜',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF77758E), fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}

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

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activity});

  final LearningActivity activity;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ActivityPage(activity: activity),
          ),
        ),
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
                  child: Text(activity.emoji, style: const TextStyle(fontSize: 29)),
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

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key, required this.activity});

  final LearningActivity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(activity.title)),
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
                Text(activity.emoji, style: const TextStyle(fontSize: 55)),
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
            children: activity.items
                .map(
                  (item) => Chip(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(12),
                    label: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('أحسنت! التمارين التفاعلية ستضاف في المرحلة القادمة 🌟'),
              ),
            ),
            icon: const Icon(Icons.stars_rounded),
            label: const Text('جرّب نشاطاً'),
          ),
        ],
      ),
    );
  }
}

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
            Text(icon, style: const TextStyle(fontSize: 65)),
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
              style: const TextStyle(color: Color(0xFF77758E), height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
