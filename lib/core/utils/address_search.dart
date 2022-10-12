import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/utils/suggestion.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  late final sessionToken;
  late PlaceApiProvider apiClient;

  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Suggestion("", ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Suggestion>>(
      future: query == "" ? null
          : apiClient.fetchSuggestions(query, Localizations.localeOf(context).languageCode),
      builder: (context, snapshot) => query == '' ? Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Text('enter_your_address'.tr),
      ) : snapshot.hasData ? ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title:
          Text((snapshot.data?[index] as Suggestion).description),
          onTap: () {
            close(context, snapshot.data![index]);
          },
        ),
        itemCount: snapshot.data?.length ?? 0,
      ) : Container(child: Text('loading'.tr)),
    );
  }

}
