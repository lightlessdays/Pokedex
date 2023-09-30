part of '../pokemon_info.dart';

class _Label extends Text {
  _Label(String text, bool isDark)
      : super(
          text,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.6),
            height: 0.8,
          ),
        );
}

class _ContentSection extends StatelessWidget {
  final String label;
  final List<Widget>? children;

  const _ContentSection({
    Key? key,
    required this.label,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(height: 0.8, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 22),
        if (children != null) ...children!
      ],
    );
  }
}

class _TextIcon extends StatelessWidget {
  final ImageProvider icon;
  final String text;

  const _TextIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: icon, width: 12, height: 12),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(height: 0.8)),
      ],
    );
  }
}

class _PokemonAbout extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonAbout(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final slideController = PokemonInfoStateProvider.of(context).slideController;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Column(
        children: <Widget>[
          _buildDescription(pokemon.description),
          const SizedBox(height: 28),
          _buildHeightWeight(pokemon.height, pokemon.weight, context, false),
          const SizedBox(height: 31),
          _buildBreeding(pokemon.gender, pokemon.eggGroups, false),
          const SizedBox(height: 35),
          _buildTraining(pokemon.baseExp, false),
        ],
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      "\n$description\n",
      style: const TextStyle(height: 1.5,fontSize: 20),
    );
  }

  Widget _buildHeightWeight(String height, String weight, BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Height', isDark),
                const SizedBox(height: 11),
                Text(
                  height,
                  style: const TextStyle(
                    height: 0.8,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Weight', isDark),
                const SizedBox(height: 11),
                Text(weight,
                    style: const TextStyle(
                      height: 0.8,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreeding(PokemonGender gender, List<String> eggGroups, bool isDark) {
    return _ContentSection(
      label: 'Breeding',
      children: [
        Row(
          children: <Widget>[
            Expanded(child: _Label('Gender', isDark)),
            if (gender.genderless)
              const Expanded(
                flex: 3,
                child: Text('Genderless', style: TextStyle(height: 0.8)),
              )
            else ...[
              Expanded(
                child: _TextIcon(AppImages.male, '${gender.male}%'),
              ),
              Expanded(
                flex: 2,
                child: _TextIcon(AppImages.female, '${gender.female}%'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: <Widget>[
            Expanded(child: _Label('Egg Groups', isDark)),
            Expanded(
              flex: 2,
              child: Text(eggGroups.join(', '), style: const TextStyle(height: 0.8)),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ],
    );
  }


  Widget _buildTraining(double baseExp, bool isDark) {
    return _ContentSection(
      label: 'Training',
      children: [
        Row(
          children: <Widget>[
            Expanded(flex: 1, child: _Label('Base EXP', isDark)),
            Expanded(flex: 3, child: Text('$baseExp')),
          ],
        ),
      ],
    );
  }
}
