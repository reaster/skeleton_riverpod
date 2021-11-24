import 'sample_item.dart';

/// Manages SampleItem creation, storage and deletion.
class SampleService {
  int _itemNameCounter = 0;
  final List<SampleItem> _items = [];

  /// Create new SampleItem and add to store.
  SampleItem createItem() {
    final item = SampleItem(++_itemNameCounter);
    _items.add(item);
    return item;
  }

  /// Return stored list of SampleItems.
  List<SampleItem> get items => List.unmodifiable(_items);

  /// Remove SampleItem from store, returning removed instance if found.
  SampleItem? removeItemById(int id) {
    SampleItem item = _items.firstWhere((item) => item.id == id,
        orElse: () => const SampleItem(0));
    if (item.id == 0) {
      return null;
    } else {
      _items.remove(item);
      return item;
    }
  }
}
