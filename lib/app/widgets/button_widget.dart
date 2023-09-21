part of widget;

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  const ButtonWidget({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(padding),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: Text(text ?? ""),
      ),
    );
  }
}
