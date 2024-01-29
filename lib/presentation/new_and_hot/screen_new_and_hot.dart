import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/hot_and_new/bloc/hotand_new_bloc_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: Text(
              "New & Hot",
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: kwhite,
              ),
            ),
            centerTitle: false,
            actions: [
              const Icon(Icons.cast, color: Colors.white, size: 30),
              kWidth,
              Container(
                color: Colors.blue,
                height: 30,
                width: 30,
              ),
              kWidth,
            ],
            bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              labelColor: kBlack,
              unselectedLabelColor: kwhite,
              dividerColor: kBlack,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kwhite,
                borderRadius: kradius30,
              ),
              tabs: const [
                Tab(text: "  🍿 Coming Soon    "),
                Tab(text: "    👀 Everyone's Watching   "),
              ],
            ),
          ),
        ),
        body: const TabBarView(children: [
           ComingSoon(),
           EveryOneWatching(),
        ]),
      ),
    );
  }
  

  // Widget _buildComingSoon() {
  
  // }
}
class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) { 
       BlocProvider.of<HotandNewBlocBloc>(context).add(const LoadDataInComingSoon()); 
    });
   return RefreshIndicator(
    onRefresh: () async{
     BlocProvider.of<HotandNewBlocBloc>(context).add(const LoadDataInComingSoon()); 

    },
     child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BlocBuilder<HotandNewBlocBloc, HotandNewBlocState>(
          builder: (context, state) {
     
             if(state.isLoading){
                    return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                  }else if(state.isError){
                   return const Center(child: Text("Error WhileLoading"),);
                  }else if(state.comingSoonList!.isEmpty){
                   return const Center(child: Text("CominSoon List is Empty"),);
                  }else{
                    return ListView.builder(
                itemCount: state.comingSoonList!.length,
                itemBuilder: (context, index) {
                  final movie  = state.comingSoonList![index];
                  if(movie.id==null){
                    return const SizedBox();
                  }
                  return ComingSoonWidget(
                    id: movie.id.toString(), 
                    day: '9',
                     month: 'January',
                      posterPath: '$imgaeAppendUrl${movie.posterPath}',
                       movieName: movie.originalTitle??'No Titile',
                        movieDescription: movie.overview??"No Description"
                        );
                },
              );
                  }
     
            
          },
        ),
      ),
   );
  }

 
}

class EveryOneWatching extends StatelessWidget {
  const EveryOneWatching({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) { 
       BlocProvider.of<HotandNewBlocBloc>(context).add(const LoadDataInEveryOneWatching()); 
    });
   return RefreshIndicator(
    onRefresh: () async{
             BlocProvider.of<HotandNewBlocBloc>(context).add(const LoadDataInEveryOneWatching()); 
    },
     child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BlocBuilder<HotandNewBlocBloc, HotandNewBlocState>(
          builder: (context, state) {
     
             if(state.isLoading){
                    return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                  }else if(state.isError){
                   return const Center(child: Text("Error WhileLoading"),);
                  }else if(state.everyoneWatchingList!.isEmpty){
                   return const Center(child: Text("everyone watching List is Empty"),);
                  }else{
                    return ListView.builder(
                itemCount: state.everyoneWatchingList!.length,
                itemBuilder: (context, index) {
                  final movie  = state.everyoneWatchingList![index];
                  if(movie.id==null){
                    return const SizedBox();
                  }
                  final tv = state.everyoneWatchingList![index];
                  return EveryOneWatchingWidget(
                    posterPath: '$imgaeAppendUrl${movie.posterPath}', 
                    movieName: tv.originalName??'No name',
                     movieDescription: tv.overview??"No OverView"
                     );
                },
              );
                  }
     
            
          },
        ),
      ),
   );
  }

 
}
