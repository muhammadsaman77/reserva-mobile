import 'package:booking_app/bloc/search/search_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:booking_app/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();


  SearchPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueNormal,
        foregroundColor: Colors.white,
        title: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            final bloc = context.read<SearchBloc>();
            return bloc.isSearching
                ? TextField(
              controller: _searchController,
              onChanged: (query) => context.read<SearchBloc>().add(FetchSearchResults(query)),
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white60),
              ),
              style: TextStyle(color: Colors.white),
            )
                : const Text('Search Hotel',style:
              TextStyle(fontWeight: FontWeight.w600,fontSize: 18),);
          },
        ),
        actions: [
          IconButton(
            icon: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                final bloc = context.read<SearchBloc>();
                return Icon(bloc.isSearching ? Icons.close : Icons.search);
              },
            ),
            onPressed: () => context.read<SearchBloc>().add(ToggleSearchEvent()),
          ),
        ],
        ),
       body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial){
            context.read<SearchBloc>().add(FetchSearchResults(""));
          }
          if (state is SearchLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                  childAspectRatio: 9 / 12
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: state.results.length,
              itemBuilder: (context, index) => CardItem(
                onTap: () {
                  Navigator.of(context).pushNamed('/detail',
                      arguments: state.results[index].id);
                },
                address: state.results[index].address,
                imagePath: state.results[index].images[0],
                itemName: state.results[index].name,
                price: state.results[index].price.toString(),
                rating: state.results[index].rating,
              ),
            );
          }
          return  const Center(child: CircularProgressIndicator());
        })
    );
  }
}
