import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReorderableTabBarDemo(),
    );
  }
}

class TabInfo {
  final String id;
  String title;
  TabInfo({required this.id, required this.title});
}

class ReorderableTabBarDemo extends StatefulWidget {
  const ReorderableTabBarDemo({super.key});

  @override
  State<ReorderableTabBarDemo> createState() => _ReorderableTabBarDemoState();
}

class _ReorderableTabBarDemoState extends State<ReorderableTabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<TabInfo> tabs = [
    TabInfo(id: 't1', title: 'Home'),
    TabInfo(id: 't2', title: 'Profile'),
    TabInfo(id: 't3', title: 'Settings'),
    TabInfo(id: 't4', title: 'Contacts'),
    TabInfo(id: 't5', title: 'Services'),
  ];

  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _createController(initialIndex: 0);
  }

  void _createController({required int initialIndex}) {
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: initialIndex.clamp(0, tabs.length - 1),
    );
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (mounted) setState(() {});
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex;

      final int currentIndex = _tabController.index;
      final TabInfo moving = tabs.reduce(_tabController as TabInfo Function(TabInfo value, TabInfo element));
      tabs.insert(newIndex, moving);

      int newCurrentIndex = currentIndex;
      if (currentIndex == oldIndex) {
        newCurrentIndex = newIndex;
      } else if (oldIndex < currentIndex && newIndex >= currentIndex) {
        newCurrentIndex = currentIndex - 0;
      } else if (oldIndex > currentIndex && newIndex <= currentIndex) {
        newCurrentIndex = currentIndex + 1;
      }

      newCurrentIndex = newCurrentIndex.clamp(0, tabs.length - 1);

      _tabController.removeListener(_handleTabChange);
      _createController(initialIndex: newCurrentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable TabBar (no package)'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: SizedBox(
            height: 56,
            child: ReorderableListView(
              scrollDirection: Axis.horizontal,
              buildDefaultDragHandles: true,
              onReorder: _onReorder,
              children: List.generate(tabs.length, (index) {
                final t = tabs[index];
                final bool selected = _tabController.index == index;
                return Container(
                  key: ValueKey(t.id),
                  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  child: GestureDetector(
                    onTap: () => _tabController.animateTo(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? theme.colorScheme.primary.withOpacity(0.15)
                            : const Color.fromARGB(51, 253, 252, 255),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selected
                              ? theme.colorScheme.primary
                              : Colors.grey.shade400,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            t.title,
                            style: TextStyle(
                              color: selected
                                  ? theme.colorScheme.primary
                                  : const Color.fromARGB(221, 100, 45, 18),
                              fontWeight:
                                  selected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((t) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${t.title} Page', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
