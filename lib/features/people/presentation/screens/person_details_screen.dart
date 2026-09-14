import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/cached_movie_image.dart';
import '../../../../core/widgets/error_view.dart';
import '../../domain/models/person.dart';

final personDetailsProvider = FutureProvider.family<PersonDetails, int>((ref, personId) async {
  final repo = ref.watch(peopleRepositoryProvider);
  final res = await repo.getPersonDetails(personId);
  return res.when(
    success: (details) => details,
    failure: (fail) => throw Exception(fail.message),
  );
});

class PersonDetailsScreen extends ConsumerWidget {
  final int personId;

  const PersonDetailsScreen({super.key, required this.personId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personAsync = ref.watch(personDetailsProvider(personId));

    return Scaffold(
      appBar: AppBar(title: const Text('Actor Details')),
      body: personAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => ErrorView(message: err.toString()),
        data: (person) => SingleChildScrollView(
          padding: AppSpacing.paddingMd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedProfileImage(imagePath: person.profilePath, radius: 50),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(person.name, style: AppTextStyles.displayMedium),
                        const SizedBox(height: 6),
                        Text('Department: ${person.knownForDepartment}', style: AppTextStyles.caption),
                        if (person.birthday != null) ...[
                          const SizedBox(height: 4),
                          Text('Birthday: ${person.birthday}', style: AppTextStyles.caption),
                        ],
                        if (person.placeOfBirth != null) ...[
                          const SizedBox(height: 4),
                          Text('Place of Birth: ${person.placeOfBirth}', style: AppTextStyles.caption),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Biography', style: AppTextStyles.titleLarge),
              const SizedBox(height: 8),
              Text(
                person.biography != null && person.biography!.isNotEmpty
                    ? person.biography!
                    : 'No biography available for this actor.',
                style: AppTextStyles.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
