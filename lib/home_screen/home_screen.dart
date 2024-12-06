import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 100;
  double width = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            if (height == 100) {
              height = 300;
              width = 300;
            } else {
              height = 100;
              width = 100;
            }
            setState(() {});
          },
          child: AnimatedOpacity(
            duration: Duration(seconds: 3),
            opacity: height == 100 ? .2 : 1,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: height == 100 ? Colors.black : Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(height == 100
                          ? "https://images.pexels.com/photos/29646627/pexels-photo-29646627/free-photo-of-stylish-mature-woman-with-gray-hair-outdoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                          : "https://images.pexels.com/photos/27080341/pexels-photo-27080341/free-photo-of-facade-of-a-modern-apartment-building-in-a-city.jpeg"))),
              duration: Duration(seconds: 3),
              curve: Curves.bounceIn,
              height: height,
              width: width,
              // child: AnimatedGrid(
              //     itemBuilder: (context, index, animation) => Container(
              //           color: Colors.red,
              //         ),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: height == 100 ? 2 : 3)),
            ),
          ),
        ),
      ),
    );
  }
}
