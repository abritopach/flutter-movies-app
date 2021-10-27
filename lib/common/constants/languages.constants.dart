import 'package:movies_app/domain/entities/language.entity.dart';

class Languages {
  // Declare a private constructor.
  const Languages._();

  // Create an array of languages with 2 Language Entities.
  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}