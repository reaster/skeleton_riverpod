import 'package:riverpod/riverpod.dart';
import 'sample_feature/sample_controller.dart';
import 'sample_feature/sample_item.dart';
import 'sample_feature/sample_service.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_service.dart';

///
/// This is just one of many ways services, controllers and providers can be
/// orginized. Having all the state management declarations in one file
/// simplfies the app at the expnse of modularity and testability.
///
final settingsController = SettingsController(SettingsService());
final settingsProvider =
    Provider<SettingsController>((ref) => settingsController);

final sampleStateNotifier = SampleStateNotifier(SampleService());
final sampleProvider =
    StateNotifierProvider<SampleStateNotifier, List<SampleItem>>(
        (ref) => sampleStateNotifier);
