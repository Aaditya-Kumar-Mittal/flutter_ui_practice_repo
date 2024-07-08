// ignore_for_file: file_names

class CourseModel {
  String? name;
  String? description;
  String? university;
  String? noOfCourses;
  String? tag1;
  String? tag2;

  CourseModel(
      {this.name,
      this.description,
      this.noOfCourses,
      this.university,
      this.tag1,
      this.tag2});
}

class CourseList {
  static List<CourseModel> list = [
    CourseModel(
        name: "Data Science",
        description:
            "Launch your career in data science. A sweet-course introduction to data science, developed and taught by leading professors.",
        university: "Johns Hopkins University",
        noOfCourses: "17 Courses",
        tag1: "Data Science",
        tag2: "Machine Learning"),
    CourseModel(
        name: "Machine Learning",
        description:
            "This specialization from leading researchers at University of Washington introduces you to the exciting high-demand field of machine learning.",
        university: "University of Washington",
        noOfCourses: "8 Courses",
        tag1: "Machine Learning",
        tag2: "Decision Tree"),
    CourseModel(
        name: "Big Data",
        description:
            "Drive better business decisions with an overview of how big data is organized and interpreted. Apply insights to real-world problems and questions.",
        university: "University of California San Diego",
        noOfCourses: "10 Courses",
        tag1: "Data Science",
        tag2: "Apache Spark"),
  ];
}
