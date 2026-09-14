import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_loader.dart';
import '../../../movies/presentation/widgets/movie_card.dart';
import '../notifiers/home_notifier.dart';
import '../widget/featured_movies_carousel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: homeState.when(
        loading: () => const _HomeLoadingShimmer(),
        error: (err, st) => ErrorView(
          message: err.toString(),
          onRetry: () => ref.read(homeNotifierProvider.notifier).refresh(),
        ),
        data: (state) => RefreshIndicator(
          onRefresh: () => ref.read(homeNotifierProvider.notifier).refresh(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Premium Floating Sliver App Bar
              SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight: 60,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                title: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: AppRadius.borderSm,
                      ),
                      child: const Icon(Icons.movie_filter_rounded,
                          color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'MOVIEVERSE',
                      style: AppTextStyles.titleLarge.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search_rounded, color: Colors.white),
                    onPressed: () => context.go('/search'),
                  ),
                ],
              ),
              // const SliverToBoxAdapter(child: OfflineBanner()),
              // Featured Hero Carousel
              if (state.featuredMovies.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: FeaturedMoviesCarousel(
                      movies: state.featuredMovies,
                    ),
                  ),
                ),

              // Trending Today Rail
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SectionHeader(
                      title: '🔥 Trending Today',
                      onSeeAll: () => context.go('/discover'),
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingMovies.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final movie = state.trendingMovies[index];

                          return SizedBox(
                            width: 130,
                            child: MovieCard(
                              movie: movie,
                              onTap: () => context.push('/movie/${movie.id}'),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              // Popular Movies Rail
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SectionHeader(
                      title: '🎬 Popular Movies',
                      onSeeAll: () => context.go('/discover'),
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingMovies.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final movie = state.trendingMovies[index];

                          return SizedBox(
                            width: 130,
                            child: MovieCard(
                              movie: movie,
                              onTap: () => context.push('/movie/${movie.id}'),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              // Popular TV Shows Rail
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SectionHeader(
                      title: '📺 Popular TV Shows',
                      onSeeAll: () => context.go('/discover'),
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingMovies.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final movie = state.trendingMovies[index];

                          return SizedBox(
                            width: 130,
                            child: MovieCard(
                              movie: movie,
                              onTap: () => context.push('/movie/${movie.id}'),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              // Top Rated Movies Rail
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SectionHeader(
                      title: '⭐ Top Rated',
                      onSeeAll: () => context.go('/discover'),
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingMovies.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final movie = state.trendingMovies[index];

                          return SizedBox(
                            width: 130,
                            child: MovieCard(
                              movie: movie,
                              onTap: () => context.push('/movie/${movie.id}'),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeLoadingShimmer extends StatelessWidget {
  const _HomeLoadingShimmer();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          ShimmerBox(
            width: double.infinity,
            height: 200,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          SizedBox(height: 24),
          ShimmerBox(
            width: 160,
            height: 24,
          ),
          SizedBox(height: 16),
          // Shimmer for the movie rail
          _MovieRailShimmer(titleWidth: 160),
          SizedBox(height: 24),
          _MovieRailShimmer(titleWidth: 160),
          SizedBox(height: 24),
          _MovieRailShimmer(titleWidth: 160),
          SizedBox(height: 24),
          _MovieRailShimmer(titleWidth: 160),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _MovieRailShimmer extends StatelessWidget {
  final double titleWidth;

  const _MovieRailShimmer({
    required this.titleWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerBox(
                width: titleWidth,
                height: 24,
              ),
              const ShimmerBox(
                width: 60,
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, __) {
              return const SizedBox(
                width: 130,
                child: MovieCardShimmer(),
              );
            },
          ),
        ),
      ],
    );
  }
}
