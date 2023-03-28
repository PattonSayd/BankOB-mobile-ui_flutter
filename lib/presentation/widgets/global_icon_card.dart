// import 'package:flutter/material.dart';

// class GlobalIconCard extends StatelessWidget {
//   final Function onClick;
//   final Widget widget;
//   final bool isLeft;
//   final Color color;
//   const GlobalIconCard({
//     Key? key,
//     required this.onClick,
//     required this.widget,
//     required this.isLeft,
//     this.color = AppColors.card,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onClick(),
//       child: Card(
//         color: color,
//         shape: RoundedRectangleBorder(borderRadius: AppStyles.kBorderRadius16),
//         margin: EdgeInsets.only(
//             right: isLeft ? 0 : 24, top: 8, bottom: 8, left: isLeft ? 24 : 0),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: widget,
//         ),
//       ),
//     );
//   }
// }
