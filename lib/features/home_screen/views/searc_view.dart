import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/search_cubit/search_cubit.dart';
import 'package:hitv/features/watch_list/widgets/watch_tile.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class SearchPage extends StatelessWidget {


  SearchPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Search'),
      ),
      body: BlocProvider(
        create: (_) => SearchCubit(),
        child: SearchView(),
      ),
    );
  }
}

class SearchView extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  SearchView();

  @override
  Widget build(BuildContext context) {
     final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Container(
                  width: 280,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(800),
                    boxShadow: [
                      BoxShadow(
                        color:
                            dark ? Colors.grey.withOpacity(0.5) : Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      controller: _controller,
                      

                      decoration: InputDecoration(
                        
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: dark ? Colors.black : Colors.white,
                        ),
                        suffixIcon: IconButton(
                          color: dark ? Colors.blue : Colors.black,
                          onPressed: () {
                            context
                                .read<SearchCubit>()
                                .search(_controller.text);
                          },
                          icon: Icon(Icons.search),
                        ),
                        border: InputBorder.none,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: dark ? Colors.blue : Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchCubitState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SearchLoaded) {
                return ListView.builder(
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    final anime = state.results[index];
                    return WatchListTile(data: anime);
                  },
                );
              } else if (state is SearchError) {
                return Center(child: Text(state.message));
              }
              return Center(child: Text('Enter a search term to begin'));
            },
          ),
        ),
      ],
    );
  }
}
