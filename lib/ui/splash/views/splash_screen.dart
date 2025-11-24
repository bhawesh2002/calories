import 'package:calories/data/providers/repository_provider.dart';
import 'package:calories/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(permissionRepoProvider).accquireDeniedPermissions();

      Future.delayed((const Duration(seconds: 1)), () {
        if (mounted) Navigator.of(context).pushNamed(AppRoutes.home);
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
