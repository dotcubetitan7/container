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
    'https://cdn.pixabay.com/photo/2016/02/19/10/00/flower-1205637_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/08/30/01/05/rose-2698359_1280.jpg',
    'https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_1280.jpg',
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
      if (newIndex > oldIndex) newIndex--;

      final TabInfo moving = tabs.removeAt(oldIndex);
      tabs.insert(newIndex, moving);

      int newCurrentIndex = _tabController.index;
      if (newCurrentIndex == oldIndex) {
        newCurrentIndex = newIndex;
      } else if (oldIndex < newCurrentIndex && newIndex >= newCurrentIndex) {
        newCurrentIndex -= 1;
      } else if (oldIndex > newCurrentIndex && newIndex <= newCurrentIndex) {
        newCurrentIndex += 1;
      }

      _tabController.removeListener(_handleTabChange);
      _createController(initialIndex: newCurrentIndex);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable TabBar'),
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
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selected
                              ? theme.colorScheme.primary
                              : Colors.grey.shade400,
                        ),
                      ),
                      child: Text(
                        t.title,
                        style: TextStyle(
                          color: selected
                              ? theme.colorScheme.primary
                              : Colors.black87,
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.normal,
                        ),
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
          return Column(
            children: [
              const SizedBox(height: 16),
              Text('${t.title} Page', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: imageUrls.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
