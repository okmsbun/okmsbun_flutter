# Changelog

## 0.0.1

* TODO: Describe initial release.

## 0.0.13

### Additions and Changes

- Added an `alignment` parameter to `image_asset.dart`, `image_memory.dart`, `image_network.dart`, and `image_widget.dart`.
  - All image widgets now support alignment, providing more flexible positioning options.
  - In factory constructors such as `ImageWidget.asset`, `ImageWidget.network`, and `ImageWidget.bytes`, the `alignment` parameter defaults to `Alignment.center`.

- Updated **dependencies**:
  - `cached_network_image`: ^3.3.1 → ^3.4.1  
  - `dio`: ^5.4.0 → ^5.7.0  
  - `flutter_lints`: ^3.0.1 → ^5.0.0  
  - Other minor version upgrades (e.g., `sqflite`, `path_provider`).

- Revised **linter rules** and the `okmsbun_flutter_lints.yaml` file:
  - Enabled a number of additional rules by default (e.g., `avoid_as`, `list_remove_unrelated_type`, etc.).
  - Some rules are now optional (e.g., `avoid_positional_boolean_parameters`, `always_specify_types`).
  - Deactivated redundant or conflicting rules.

- Bumped version in **pubspec.yaml** from `0.0.12` to `0.0.13`.
  - Updated `environment` constraints for `sdk` and `flutter`.
  - Moved to Flutter 3.27.2 for better linter compatibility.

### Important Reminder
- When upgrading, note that the new `alignment` parameter may simplify how you position images. If you were previously using another widget just for alignment, you can now take advantage of the built-in `alignment`.
- Check for any breaking changes in packages like `dio` or `cached_network_image`. Use `dart pub outdated` and `dart pub upgrade` to verify compatibility before fully adopting this version.

## 0.0.14

Refactor EstimatedAppBarContainer for improved readability; update version to 0.0.14; remove unused VSCode settings