import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/category.dart';
import 'package:pokedex/routes.dart';

const List<Category> categories = [
  Category(name: 'Pokedex', color: AppColors.teal, route: Routes.pokedex),
  Category(name: 'Type', color: AppColors.red, route: Routes.pokedex),
  Category(name: 'Items', color: AppColors.yellow, route: Routes.items),
  Category(name: 'Type Effects', color: AppColors.brown, route: Routes.typeEffects),
];
