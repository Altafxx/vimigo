import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  // final Widget image;
  // final TextEditingController controller;
  // final BorderRadius inputRadius;
  // final Function onSend, onImageRemoved;

  const CommentBox({
    Key? key,
    // required this.image,
    // required this.controller,
    // required this.inputRadius,
    // required this.onSend,
    // required this.onImageRemoved
  }) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  // late Widget image;

  @override
  void initState() {
    // image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          TextFormField(
            // controller: widget.controller,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    // widget.inputRadius ??
                    BorderRadius.circular(32),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        // child: image,
      ),
    );
  }
}
