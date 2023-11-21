import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
              contentPadding: const EdgeInsets.all(12),
              hintText: 'Search',
              suffixIcon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 237, 89, 146),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
                tabs: const [
                  Tab(
                    text: 'New',
                  ),
                  Tab(
                    text: 'Popular',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Text("New"),
                    ),
                    Center(
                      child: Text("Popular"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
