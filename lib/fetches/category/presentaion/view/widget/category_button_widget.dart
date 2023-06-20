import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/category_cubit.dart';

class CategoryButtonsWidget extends StatelessWidget {
  const CategoryButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return           BlocBuilder<CategoryCubit, CategoryState>(
      builder: (BuildContext context, state) {
        return SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CategoryCubit.get(context).myCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  CategoryCubit.get(context).changeIndexCategory(index);
                },
                child: Card(
                  elevation: 0,
                  color:(CategoryCubit.get(context).indexCategory==index)?Colors.blue: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(CategoryCubit.get(context).myCategory[index]),
                  ),
                ),
              );
            },),
        );
      },


    );
  }
}
