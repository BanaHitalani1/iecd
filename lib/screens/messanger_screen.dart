import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              radius: 50,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Chats',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 22,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      size: 23,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 22,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_calendar_rounded,
                      size: 23,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 100,
                child: Center(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => storyItem(),
                    itemCount: 10,
                  ),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => chatItem(),
              separatorBuilder: (context,index) => Divider(thickness: 10,),
              itemCount: 20,
            ),
            Divider(thickness: 10,)
          ],
        ),
      ),
    );
  }
}

Widget storyItem() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8),
    margin: EdgeInsets.only(right: 8),
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://www.nigeriagalleria.com/blog/wp-content/uploads/2023/03/Why-do-Anime-Characters-Make-Perfect-Profile-Pictures.png'),
          radius: 30,
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 9,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 8,
        ),
      ],
    ),
  );
}

Widget chatItem() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
      ),
      title: Text('Bana Hitalani'),
      subtitle: Text('Hello Everyone !!!!'),
      trailing: Icon(Icons.check_circle),
    ),
  );
}
