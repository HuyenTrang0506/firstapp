import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voting_app/src/common_widgets/primary_button.dart';
import 'package:voting_app/src/common_widgets/responsive_center.dart';
import 'package:voting_app/src/constants/app_sizes.dart';
import 'package:voting_app/src/features/onboarding/presentation/onboarding_controller.dart';
import 'package:voting_app/src/localization/string_hardcoded.dart';
import 'package:voting_app/src/routing/app_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.indigo, Colors.blue],
            ),
          ),
        ),
        elevation: 0.0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'ELECT',
                style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'CHAIN',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.how_to_vote_rounded),
            onPressed: () {},
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.info_outline_rounded),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationVersion: '^1.0.0',
                  applicationName: 'ElectChain',
                  applicationLegalese: 'Brave Tech Solutions',
                );
              },
            ),
          ),
        ],
      ),
      body: ResponsiveCenter(
        maxContentWidth: 450,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Discover our new voting app \nYour easy way to participate in democracy!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            gapH16,
            Image.asset(
              'assets/voting-box.png',
              width: 200,
              height: 200,
              semanticLabel: 'Voting box',
            ),
            gapH16,
            Container(
              width: 150, // specify your desired width here
              child: PrimaryButton(
                text: 'Get Started'.hardcoded,
                isLoading: state.isLoading,
                onPressed: state.isLoading
                    ? null
                    : () async {
                        await ref
                            .read(onboardingControllerProvider.notifier)
                            .completeOnboarding();
                        if (context.mounted) {
                          // go to sign in page after completing onboarding
                          context.goNamed(AppRoute.signIn.name);
                        }
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
