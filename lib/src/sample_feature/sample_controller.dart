import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sample_item.dart';
import 'sample_service.dart';

/// SampleStateNofifier notifies UI widgets when the list of SampleItem changes.
class SampleStateNotifier extends StateNotifier<List<SampleItem>> {
  final SampleService sampleService;

  SampleStateNotifier(this.sampleService) : super(sampleService.items);

  /// Create new SampleItem and add to store.
  void createItem() {
    final item = sampleService.createItem();
    state = sampleService.items;
    print(
        "Created: $item. SampleService now contains ${sampleService.items.length} items.");
  }

  /// Return stored list of SampleItems.
  List<SampleItem> get items => sampleService.items;

  /// Remove SampleItem from store, returning removed instance if found.
  void removeItemById(int id) {
    if (sampleService.removeItemById(id) != null) {
      print("item removed: $id");
      state = sampleService.items;
    }
  }
}
