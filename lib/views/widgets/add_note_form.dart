
// import 'custom_text_field.dart';

// class AddNoteForm extends StatefulWidget {
//   const AddNoteForm({
//     super.key,
//   });

//   @override
//   State<AddNoteForm> createState() => _AddNoteFormState();
// }

// class _AddNoteFormState extends State<AddNoteForm> {
//   final GlobalKey<FormState> formKey = GlobalKey();

//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   String? title, subTitle;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       autovalidateMode: autovalidateMode,
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 32,
//           ),
//           CustomTextField(
//             onSaved: (value) {
//               title = value;
//             },
//             hint: 'title',
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           CustomTextField(
//             onSaved: (value) {
//               subTitle = value;
//             },
//             hint: 'content',
//             maxLines: 5,
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           const ColorsListView(),
//           const SizedBox(
//             height: 32,
//           ),
//           BlocBuilder<AddNoteCubit, AddNoteState>(
//             builder: (context, state) {
//               return CustomButton(
//                 isLoading: state is AddNoteLoading ? true : false,
//                 onTap: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                     DateTime currentDate = DateTime.now();

//                     String formattedCurrentDate =
//                         DateFormat.yMd().format(currentDate);
//                     NoteModel noteModel = NoteModel(
//                         title: title!,
//                         subTitle: subTitle!,
//                         date: formattedCurrentDate,
//                         color: const Color.fromARGB(255, 144, 169, 189).value);
//                     BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
//                   } else {
//                     autovalidateMode = AutovalidateMode.always;
//                     setState(() {});
//                   }
//                 },
//               );
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//         ],
//       ),
//     );
//   }
// }
