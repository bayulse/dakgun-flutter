import 'package:dakgun/core/viewmodels/post_model.dart';
import 'package:dakgun/ui/shared/app_colors.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PostBarenganView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [Inject<PostModel>(() => PostModel())],
      builder: (_, __) {
        final postModel = Injector.getAsModel<PostModel>(context: context);

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF43A689), Color(0xFF00FFB4)],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.75, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: FlatButton(
                    child: Text(
                      'Post',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Color(0xFFF6F9FC),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Headline', style: descStyle),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                hintText: 'Tuliskan judul',
                              ),
                            ),
                            UIHelper.verticalSpaceSmall,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Tanggal & waktu', style: descStyle),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                hintText:
                                    'Tentukan tanggal & waktu', //TODO: datepicker
                                suffixIcon: IconButton(
                                  icon: Image.asset(
                                    'assets/images/date_post.png',
                                    color: subtitleTextColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            UIHelper.verticalSpaceSmall,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Meeting point', style: descStyle),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                hintText:
                                    'Tentukan titik kumpul', //TODO: pin location
                                suffixIcon: IconButton(
                                  icon: Image.asset(
                                    'assets/images/titik_kumpul_post.png',
                                    color: subtitleTextColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            UIHelper.verticalSpaceSmall,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Deskripsi', style: descStyle),
                            ),
                            TextFormField(
                              maxLines: 4,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                hintText: 'Tulis pesanmu disini',
                              ),
                            ),
                            UIHelper.verticalSpaceSmall,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Tag', style: descStyle),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                hintText: 'e.g. adventure, survival, climb',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Photos', style: descStyle),
                          ),
                          UIHelper.verticalSpaceSmall,
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  postModel.setState(
                                    (state) => postModel.state.getImage(),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 80.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: subtitleTextColor),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color:
                                            Color.fromRGBO(136, 152, 170, 0.25),
                                      ),
                                    ),
                                    Icon(Icons.camera_alt)
                                  ],
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Expanded(
                                child: Container(
                                  height: 80.0,
                                  child: postModel.state.images.length == 0
                                      ? Container()
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              postModel.state.images.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.0),
                                              child: SizedBox(
                                                height: 80.0,
                                                width: 80.0,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Image.file(
                                                    postModel
                                                        .state.images[index],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
