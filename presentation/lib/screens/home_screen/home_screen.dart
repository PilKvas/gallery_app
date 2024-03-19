part of '../../presentation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: AutoTabsScaffold(
        routes: const [
          GalleryStackRoute(),
          ProfileStackRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.router.push(const MediaRoute());
          },
        ),
        bottomNavigationBuilder: (context, router) {
          return BottomNavigationBar(
            currentIndex: router.activeIndex,
            onTap: router.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.person),
              ),
            ],
          );
        },
      ),
    );
  }
}
