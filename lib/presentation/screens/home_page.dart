import 'package:booking_app/bloc/search/search_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
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
                      arguments:{
                    'id' : state.results[index].id
                      }
                  );
                },
                address: state.results[index].address,
                imagePath: state.results[index].images[0],
                itemName: state.results[index].name,
                price: state.results[index].price.toString(),
                rating: state.results[index].rating,
              ),
            );
          }
          return  const   Center(child: CircularProgressIndicator());
        })
    ;

  }
}
