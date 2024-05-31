import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  // DateTime currentDate = DateTime.now();

// Format the current date and time
String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());



  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
  {
    'name': 'Aarav Patel',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Nice post!',
    'date': '2023-10-15 08:45:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Aditi Sharma',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Great work!',
    'date': '2023-11-20 11:00:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Ananya Mishra',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Awesome!',
    'date': '2023-12-01 06:00:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Arjun Gupta',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Keep it up!',
    'date': '2024-01-01 18:00:00',
    'star': "⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Ayesha Singh',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Amazing!',
    'date': '2024-02-01 02:30:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Divya Joshi',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Very cool',
    'date': '2024-03-01 09:30:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Harshita Sharma',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Great job!',
    'date': '2024-04-01 14:00:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Karan Singh',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Very nice!',
    'date': '2024-05-01 17:45:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Mehak Verma',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Well done!',
    'date': '2024-06-01 21:20:00',
    'star': "⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Neha Kapoor',
    'pic': 'https://www.example.com/image.jpg',
    'message': 'Superb!',
    'date': '2024-07-01 23:55:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like': 'assets/likeDark.png',
  },
  {
    'name': 'Chuks Okwuenu',
    'pic': 'https://picsum.photos/300/30',
    'message': 'I love to code',
    'date': '2021-01-01 12:00:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Manmeet Paul',
    'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
    'message': 'Very cool',
    'date': '2023-12-01 06:00:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'

  },
  {
    'name': 'Martins ',
    'pic': 'assets/img/userpic.jpg',
    'message': 'Very cool',
    'date': '2024-04-01 11:30:00',
    'star': "⭐️⭐️⭐️",
    'like':'assets/likeDark.png'

  },
  {
    'name': 'Harveer Kaur',
    'pic': 'https://picsum.photos/300/30',
    'message': 'Very cool',
    'date': '2024-02-01 02:30:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  // Additional Indian names
  {
    'name': 'Aarav Patel',
    'pic': 'https://example.com/aarav.jpg',
    'message': 'Awesome!',
    'date': '2022-05-15 09:30:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aadya Gupta',
    'pic': 'https://example.com/aadya.jpg',
    'message': 'Great job!',
    'date': '2023-08-20 14:45:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aaradhya Singh',
    'pic': 'https://example.com/aaradhya.jpg',
    'message': 'Keep it up!',
    'date': '2023-11-10 18:00:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aarav Sharma',
    'pic': 'https://example.com/aarav.jpg',
    'message': 'Nice work!',
    'date': '2023-12-25 21:30:00',
    'star': "⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aaliyah Reddy',
    'pic': 'https://example.com/aaliyah.jpg',
    'message': 'Fantastic!',
    'date': '2024-02-05 22:45:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Advik Kumar',
    'pic': 'https://example.com/advik.jpg',
    'message': 'Brilliant!',
    'date': '2024-03-10 10:00:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Ananya Verma',
    'pic': 'https://example.com/ananya.jpg',
    'message': 'Keep it going!',
    'date': '2024-04-15 12:15:00',
    'star': "⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aarush Tiwari',
    'pic': 'https://example.com/aarush.jpg',
    'message': 'Excellent!',
    'date': '2024-05-20 16:30:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Anika Sharma',
    'pic': 'https://example.com/anika.jpg',
    'message': 'Good job!',
    'date': '2024-06-25 18:45:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aryan Patel',
    'pic': 'https://example.com/aryan.jpg',
    'message': 'Amazing work!',
    'date': '2024-07-30 20:00:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aradhya Singh',
    'pic': 'https://example.com/aradhya.jpg',
    'message': 'Keep it up!',
    'date': '2024-08-15 09:15:00',
    'star': "⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Aarav Sharma',
    'pic': 'https://example.com/aarav.jpg',
    'message': 'Nice one!',
    'date': '2024-09-20 11:30:00',
    'star': "⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  {
    'name': 'Ananya Reddy',
    'pic': 'https://example.com/ananya.jpg',
    'message': 'Great!',
    'date': '2024-10-25 13:45:00',
    'star': "⭐️⭐️⭐️⭐️⭐️",
    'like':'assets/likeDark.png'
  },
  // Add more models with Indian names as needed
];


  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              ),
              subtitle: Text(data[i]['message'],style: TextStyle(color: Colors.white),),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10,color: Colors.white)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Comment Page"),
      //   backgroundColor: Colors.red,
      // ),
      body: 
      Container(
  decoration: BoxDecoration(
gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors:
                                                  <Color>[Color.fromARGB(164, 0, 0, 0), Color.fromARGB(163, 255, 17, 0),Colors.red]),

                                                // <Color>[Color.fromARGB(164, 0, 0, 0), Color.fromARGB(152, 158, 158, 158),Color.fromARGB(243, 255, 255, 255)]
                                               
    borderRadius: BorderRadius.circular(20),
  ),
  child: ClipRRect(
     borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration
      (
      borderRadius: BorderRadius.circular(20),
      ),
      child: CommentBox(
        userImage: CommentBox.commentImageParser(
        imageURLorPath: "assets/profile/prof3.png"),
        child: commentChild(filedata),
        labelText: 'Write a comment...',
        errorText: 'Comment cannot be blank',
        withBorder: false,
        sendButtonMethod: () {
          if (formKey.currentState!.validate()) {
            print(commentController.text);
            setState(() {
              var value = {
                'name': 'Ritish',
                'pic':
                    'assets/profile/prof3.png',
                'message': commentController.text,
                'date': formattedDate ,
                
                
                // '2021-01-01 12:00:00'
              };
              filedata.insert(0, value);
            });
            commentController.clear();
            FocusScope.of(context).unfocus();
          } else {
            print("Not validated");
          }
        },
      
        formKey: formKey,
        commentController: commentController,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
      ),
    ),
  ),
),

    );
  }
}