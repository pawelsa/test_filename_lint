## About this lint

Simple dart lint that checks if test file is names correctly.
For `dart test` command, only files with `_test` suffix are considered.
It may be easy to forget about that, and test that is not being run is useless.

## Installation

In your pubspec add

```yaml
    dev_dependencies:
        test_filename_lint: 0.1.0
```

In `analysis_options` add

```yaml
analyzer:
  plugins:
    - custom_lint
```