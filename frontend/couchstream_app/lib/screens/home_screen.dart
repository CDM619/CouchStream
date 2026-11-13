
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  final categories = [
    'All',
    'Action',
    'Drama',
    'Thriller',
    'Sci-Fi',
    'Comedy',
  ];

  final movies = [
    {'title': 'Interstellar', 'genre': 'Sci-Fi · Adventure'},
    {'title': 'The Dark Knight', 'genre': 'Action · Crime'},
    {'title': 'Inception', 'genre': 'Sci-Fi · Thriller'},
    {'title': 'The Batman', 'genre': 'Action · Drama'},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 800;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 76,
            titleSpacing: isDesktop ? 40 : 20,
            title: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                ),
                children: [
                  TextSpan(
                    text: 'Couch',
                    style: TextStyle(color: AppTheme.primary),
                  ),
                  TextSpan(
                    text: 'Stream',
                    style: TextStyle(color: AppTheme.secondary),
                  ),
                ],
              ),
            ),
            actions: [
              if (isDesktop) ...[
                _navItem('Home', true),
                _navItem('Explore', false),
                _navItem('Watch Parties', false),
                const SizedBox(width: 20),
              ],
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                tooltip: 'Search',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined),
                tooltip: 'Profile',
              ),
              const SizedBox(width: 16),
            ],
          ),

          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 40 : 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcome(isDesktop),

                const SizedBox(height: 28),

                _buildFeaturedMovie(isDesktop),

                const SizedBox(height: 36),

                _buildSectionTitle('Browse Categories'),

                const SizedBox(height: 16),

                _buildCategories(),

                const SizedBox(height: 36),

                _buildSectionTitle('Recently Added'),

                const SizedBox(height: 18),

                _buildMovieGrid(isDesktop),

                const SizedBox(height: 36),

                _buildWatchPartyBanner(),

                const SizedBox(height: 40),
              ],
            ),
          ),

          bottomNavigationBar: isDesktop
              ? null
              : BottomNavigationBar(
                  currentIndex: 0,
                  backgroundColor: AppTheme.surface,
                  selectedItemColor: AppTheme.primary,
                  unselectedItemColor: AppTheme.muted,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.explore_outlined),
                      label: 'Explore',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.groups_outlined),
                      label: 'Watch Party',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined),
                      label: 'Settings',
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _navItem(String title, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            color: selected ? AppTheme.primary : AppTheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildWelcome(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MOVIE NIGHT STARTS HERE',
          style: TextStyle(
            color: AppTheme.primary,
            letterSpacing: 2,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Movies feel better together.',
          style: TextStyle(
            fontSize: isDesktop ? 34 : 27,
            fontWeight: FontWeight.bold,
            color: AppTheme.secondary,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Discover your next favourite movie.',
          style: TextStyle(
            color: AppTheme.muted,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedMovie(bool isDesktop) {
    return Container(
      width: double.infinity,
      height: isDesktop ? 310 : 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF173C36),
            Color(0xFF141B2B),
            Color(0xFF090D18),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppTheme.border),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 35,
            top: 35,
            child: Icon(
              Icons.movie_creation_outlined,
              size: isDesktop ? 190 : 130,
              color: AppTheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'YOUR NEXT ADVENTURE',
                  style: TextStyle(
                    color: AppTheme.primary,
                    letterSpacing: 2,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Find your next favourite.',
                  style: TextStyle(
                    fontSize: isDesktop ? 32 : 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: AppTheme.background,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Explore Movies'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: AppTheme.secondary,
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = selectedCategory == index;

          return ChoiceChip(
            label: Text(categories[index]),
            selected: selected,
            selectedColor: AppTheme.primary,
            backgroundColor: AppTheme.surface,
            labelStyle: TextStyle(
              color: selected
                  ? AppTheme.background
                  : AppTheme.secondary,
              fontWeight: FontWeight.w600,
            ),
            onSelected: (_) {
              setState(() {
                selectedCategory = index;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildMovieGrid(bool isDesktop) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 4 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.surface,
                      index.isEven
                          ? const Color(0xFF17443A)
                          : const Color(0xFF293248),
                    ],
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.movie_outlined,
                    color: AppTheme.primary,
                    size: 48,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              movie['title']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppTheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              movie['genre']!,
              style: const TextStyle(
                color: AppTheme.muted,
                fontSize: 11,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWatchPartyBanner() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Better together.',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Create a private room for movie night.',
                  style: TextStyle(
                    color: AppTheme.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: AppTheme.background,
            ),
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
