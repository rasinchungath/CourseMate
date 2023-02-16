import 'package:flutter/material.dart';
import 'package:restapi/components/coursetile.dart';
import 'package:restapi/helperservices/helperservices.dart';
import 'package:restapi/models/course_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Courses>? courses;
  bool isloaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    courses = await HelperServices().getCourses();
    if (courses == null) {
      setState(() {
        isloaded = false;
      });
    } else {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffFEEFEC),
      appBar: AppBar(
        title: const Text('CourseMate'),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isloaded,
        replacement: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Loading....',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: courses?.length,
          itemBuilder: (context, index) => CourseTile(courses: courses![index]),
        ),
      ),
    ));
  }
}
