import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:test_filename_lint/src/invalid_test_filename_rule.dart';

PluginBase createPlugin() => _EquatablePropsPlugin();

class _EquatablePropsPlugin extends PluginBase{
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs)  => [
    InvalidTestFilenameRule(),
  ];

  @override
  List<Assist> getAssists()  => const [];
}