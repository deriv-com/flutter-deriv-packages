import 'package:deriv_auth/core/extensions/context_extension.dart';
import 'package:deriv_auth/features/signup/models/deriv_residence_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Selection List of Countries for User to Select.
class CountrySelectionListWidget extends StatefulWidget {
  /// Initializes a new instance of [CountrySelectionListWidget].
  const CountrySelectionListWidget(
      {required this.countries, required this.onChanged, Key? key})
      : super(key: key);

  /// List of countries.
  final List<DerivResidenceModel> countries;

  /// Event for when a country is selected.
  final Function(int itemIndex)? onChanged;

  @override
  State<CountrySelectionListWidget> createState() =>
      _CountrySelectionListWidgetState();
}

class _CountrySelectionListWidgetState
    extends State<CountrySelectionListWidget> {
  final List<DerivResidenceModel> _filteredCountries = <DerivResidenceModel>[];

  final TextEditingController _searchController = TextEditingController();

  final FocusNode _searchFocusNode = FocusNode();

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();

    _filteredCountries.addAll(widget.countries);
    _searchController.addListener(_searchControllerHandler);
  }

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        builder: (BuildContext context, ScrollController controller) =>
            Scaffold(
          backgroundColor: context.theme.colors.primary,
          appBar: _buildAppBar(),
          body: _buildCountryList(),
        ),
      );

  PreferredSizeWidget _buildAppBar() => PreferredSize(
        preferredSize: const Size.fromHeight(ThemeProvider.margin64),
        child: Column(
          children: <Widget>[
            _buildHandler(),
            _buildAppBarContent(),
          ],
        ),
      );

  Widget _buildHandler() => Container(
        padding: const EdgeInsets.symmetric(vertical: ThemeProvider.margin08),
        child: Center(
          child: Container(
            height: ThemeProvider.margin04,
            width: ThemeProvider.margin40,
            decoration: BoxDecoration(
              color: context.theme.colors.active,
              borderRadius: BorderRadius.circular(ThemeProvider.margin02),
            ),
          ),
        ),
      );

  Widget _buildAppBarContent() => SizedBox(
        height: ThemeProvider.margin44,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _isSearching ? _buildSearchField() : _buildTitle(),
              ),
            ),
            if (!_isSearching)
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _searchFocusNode.requestFocus();

                  _handleSearchButton(isSearching: true);
                },
              ),
          ],
        ),
      );

  Widget _buildTitle() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(width: ThemeProvider.margin48),
          Text(
            context.derivAuthLocalization.labelChooseCountry,
            style: TextStyles.subheading,
          ),
        ],
      );

  Widget _buildSearchField() => TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        style: context.theme.textStyle(
          textStyle: TextStyles.subheading,
          color: context.theme.colors.general,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _handleSearchButton(isSearching: false),
          ),
          suffixIcon: _searchController.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
          contentPadding: const EdgeInsets.only(top: ThemeProvider.margin08),
          hintText: context.derivAuthLocalization.labelSearchCountry,
          hintStyle: context.theme.textStyle(
            textStyle: TextStyles.subheading,
            color: context.theme.colors.active,
          ),
        ),
      );

  Widget _buildCountryList() => ListView.builder(
        itemCount: _filteredCountries.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Padding(
            padding: const EdgeInsets.all(ThemeProvider.margin12),
            child: Text(
              _filteredCountries[index].name,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.general,
              ),
            ),
          ),
          onTap: () => _onCountryListItemTap(_filteredCountries[index]),
        ),
      );

  void _onCountryListItemTap(DerivResidenceModel residence) {
    final int actualIndex = widget.countries.indexOf(residence);

    widget.onChanged?.call(actualIndex);

    Navigator.of(context).pop(actualIndex);
  }

  void _searchControllerHandler() {
    _filteredCountries
      ..clear()
      ..addAll(
        widget.countries.where(
          (DerivResidenceModel country) =>
              _searchController.text.isEmpty ||
              country.name.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  ),
        ),
      );

    setState(() {});
  }

  void _handleSearchButton({required bool isSearching}) {
    _isSearching = isSearching;

    _searchController.clear();

    setState(() {});
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();

    _searchController.dispose();

    super.dispose();
  }
}
