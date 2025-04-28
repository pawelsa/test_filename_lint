import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class InvalidTestFilenameRule extends DartLintRule {
  InvalidTestFilenameRule()
      : super(
          code: LintCode(
            name: 'invalid_test_filename',
            problemMessage:
                'Files in the "test/" directory with a top-level "main()" function must end with "_test.dart".',
          ),
        );

  @override
  List<String> get filesToAnalyze => ['test/**.dart'];

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    context.registry.addFunctionDeclaration((node) {
      final filename = resolver.source.fullName.split('/').last;

      var isMainFunction = node.name.lexeme == 'main' &&
          node.parent is CompilationUnit &&
          node.functionExpression.parameters?.parameters.length != null;

      if (isMainFunction && !filename.endsWith('_test.dart')) {
        reporter.atNode(node, code);
      }
    });
  }
}
