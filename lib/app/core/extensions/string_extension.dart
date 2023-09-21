// jika ada params
// extension CustomStringExtension on String {
//   String uppercase(bool toAll) {
//     // flutter perbedaan
//     // return this.toUpperCase();
//     return toUpperCase();
//   }
// }

// Text("hello word").uppercase()

// extension CustomStringExtension on String {
//   String get uppercase() {
//     // flutter perbedaan
//     // return this.toUpperCase();
//     return toUpperCase();
//   }
// }

// Text("hello word").uppercase()

extension CustomeIntToBool on int {
  bool toBool() {
    return this == 1;
  }
}
