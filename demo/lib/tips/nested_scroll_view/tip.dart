import 'package:flutter/material.dart';

class NestedTabsTip extends StatelessWidget {
  const NestedTabsTip({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text("NestedScrollView"),
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  collapsedHeight: kToolbarHeight,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ColoredBox(
                        color: innerBoxIsScrolled ? Colors.blue : Colors.red),
                  ),
                  bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    tabs: [
                      for (int index = 0; index < 3; index++)
                        Tab(text: index.toString())
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              for (int index = 0; index < 3; index++)
                Builder(
                  builder: (context) {
                    return nestedTab(index.toString());
                  },
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget nestedTab(String title) {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          key: PageStorageKey<String>(title),
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                );
              },
            )
          ],
        );
      },
    );
  }
}
