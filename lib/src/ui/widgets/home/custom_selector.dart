import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelector extends StatefulWidget {
  final List<Widget> childrens;
  final ValueChanged<int> onSelected;
  final int selectedCount;
  final EdgeInsets margin;
  const CustomSelector({
    Key? key,
    required this.childrens,
    required this.selectedCount,
    required this.onSelected,
    this.margin = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  _CustomSelectorState createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector>
    with SingleTickerProviderStateMixin {
  final Duration _duration = const Duration(milliseconds: 400);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
  }

  Widget buildTile({Widget? child}) {
    _isSelected = widget.selectedCount == widget.childrens.indexOf(child!);

    if (_isSelected) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          child: InkWell(
            onTap: () {
              widget.onSelected(
                widget.childrens.indexOf(
                  child,
                ),
              );
            },
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: 50,
          margin: widget.margin,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Color(0x10000000), blurRadius: 15)
            ],
            borderRadius: BorderRadiusDirectional.circular(50),
          ),
          child: Stack(
            alignment: _animation.value,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - 40) / 2,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[200]!,
                  borderRadius: BorderRadiusDirectional.circular(
                    20,
                  ),
                ),
              ),
              Row(
                children: widget.childrens
                    .map(
                      (e) => buildTile(
                        child: e,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
