import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> posts = [
    "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/049/855/771/small/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-free-photo.jpg",
    "https://wallup.net/wp-content/uploads/2019/09/4972-beautiful-nature.jpg",
    "https://i0.wp.com/redandwinedecor.in/wp-content/uploads/2023/05/2-20.jpg?fit=1080%2C1080&ssl=1",
    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/049/855/771/small/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-free-photo.jpg",
    "https://wallup.net/wp-content/uploads/2019/09/4972-beautiful-nature.jpg",
    "https://i0.wp.com/redandwinedecor.in/wp-content/uploads/2023/05/2-20.jpg?fit=1080%2C1080&ssl=1",
    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/049/855/771/small/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-free-photo.jpg",
    "https://wallup.net/wp-content/uploads/2019/09/4972-beautiful-nature.jpg",
    "https://i0.wp.com/redandwinedecor.in/wp-content/uploads/2023/05/2-20.jpg?fit=1080%2C1080&ssl=1",
    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ti_a_sore",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Bagian Foto dan Followers
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/vektor-gratis/ilustrasi-ikon-vektor-kartun-anak-laki-laki-keren-lucu-berpose-dabbing-konsep-ikon-mode-orang-terpencil_138676-5680.jpg?semt=ais_hybrid&w=740&q=80"),
                ),
                Column(
                  children: [
                    Text("673",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("Posts")
                  ],
                ),
                Column(
                  children: [
                    Text("9963",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("Followers")
                  ],
                ),
                Column(
                  children: [
                    Text("79",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("Following")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Official IG | TI A Sore Semester 4",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa.",
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text("Followed by "),
                Text(
                  "mikroskil, ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "ti_a_pagi ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("and "),
                Text(
                  "130 others",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Following")),
                ElevatedButton(onPressed: () {}, child: Text("Message")),
                ElevatedButton(onPressed: () {}, child: Text("Email"))
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.amber,
                    ),
                    Text("Highlight 1")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.amberAccent,
                    ),
                    Text("Highlight 2")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueAccent,
                    ),
                    Text("Highlight 3")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                    ),
                    Text("Highlight 4")
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(posts[index]))),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
