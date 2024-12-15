// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hitv/features/explore_page/tv_explore_page/models/catigpries_model.dart';

import 'package:hitv/utils/constants/colors.dart';

class CategoryButton extends StatefulWidget {
  const CategoryButton({
    Key? key,
    required this.isSelected,
    required this.onPress,
    required this.list,
  
  
  }) : super(key: key);
  final List<bool> isSelected;
  final void Function(int) onPress;
  final List<CategoryModel> list;

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: widget.isSelected,
      onPressed: (int index) {
        widget.onPress;
        // setState(() {
        //   for (int i = 0; i < isSelectedC.length; i++) {
        //     isSelectedC[i] = i == index;
        //   }
        // });

        // final selectedCategory = categories[index];
        // BlocProvider.of<ExplorePageCubit>(context)
        //     .getExplore(id: selectedCategory.id);
      },
      children: widget.list.map((category) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
           category.categoryName,
            // category.categoryName,
            style: TextStyle(
              color: widget.isSelected[widget.list.indexOf(category)]
                  ? Colors.white
                  : Colors.black,
              fontSize: 12,
            ),
          ),
        );
      }).toList(),
      color: TColors.dark,
      selectedColor: TColors.black,
      fillColor: TColors.black,
      borderColor: TColors.dark,
      selectedBorderColor: TColors.black,
      borderRadius: BorderRadius.circular(80),
      constraints: BoxConstraints(minHeight: 40, minWidth: 80),
    );
  }
}
// GestureDetector(
//       onTap: toggleSelected,
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? TColors.black : TColors.dark,
//           border: Border.all(
//             color: isSelected ? TColors.black : TColors.dark,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(isSelected ? 20 : 5),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: Center(
//           child: Text(
//             '${widget.category.categoryName}',
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//               fontSize: 12,
//             ),
//           ),
//         ),
//       ),
//     );