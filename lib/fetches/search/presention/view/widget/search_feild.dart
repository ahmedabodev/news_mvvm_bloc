import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/home_cubit.dart';

class SearchTextForm extends StatelessWidget {
   SearchTextForm({super.key});
  TextEditingController searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<HomeCubit, HomeState>(

      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(

            controller: searchController,
            onChanged: (value) {
              HomeCubit.get(context).changeSearch(searchController.text);
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.blue
                    )
                ),
                labelText: 'Search',
                contentPadding: const EdgeInsets.all(10),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.white
                    )
                ),
                constraints: const BoxConstraints.expand(height: 45)
            ),
          ),
        );
      },
    );
  }
}
