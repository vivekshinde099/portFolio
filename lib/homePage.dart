import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'carouselDemoPage.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = 0;
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
    final key = GlobalObjectKey<ExpandableFabState>(context);
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: key,
        overlayStyle: ExpandableFabOverlayStyle(
          // color: Colors.black.withOpacity(0.5),
          blur: 5,
        ),
        onOpen: () {
          debugPrint('onOpen');
        },
        afterOpen: () {
          debugPrint('afterOpen');
        },
        onClose: () {
          debugPrint('onClose');
        },
        afterClose: () {
          debugPrint('afterClose');
        },
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.edit),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.search),
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: ((context) => const NextPage())));
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.share),
            onPressed: () {
              final state = key.currentState;
              if (state != null) {
                debugPrint('isOpen:${state.isOpen}');
                state.toggle();
              }
            },
          ),
        ],
      ),
      appBar: AppBar(title: Text('My PortFolio')),
      body: SingleChildScrollView(
        child: Container(
     decoration:const BoxDecoration(
           gradient:  LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             colors: [
               Color(0xffE4EfE9),
               Color(0xff93A5CF),
             ],
           )
     ),
          child: Column(
            children: [
               Container(
                 margin: EdgeInsets.symmetric(vertical: 5,horizontal: 4),
                // width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height*0.2,
                 decoration: BoxDecoration(
                   color: Colors.cyan[50],
                   border: Border.all(color: Colors.black12,style: BorderStyle.solid),
                   gradient:  const LinearGradient(
                       colors: [
                         Color(0xFFf5f7fa),
                         Color(0xFFc3cfe2),
                       ],
                       begin: FractionalOffset(0.0, 0.0),
                       end: FractionalOffset(1.0, 0.0),
                       stops: [0.0, 1.0],
                       tileMode: TileMode.clamp),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: Padding(
                   padding:  EdgeInsets.only(left: 5),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children:  <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(top: 10),
                         child: CircleAvatar(radius: (52),
                             backgroundColor: Colors.white,
                             child: ClipRRect(
                               borderRadius:BorderRadius.circular(50),
                               child: Image.asset('asset/profile.png'),
                             )
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 5,vertical:30),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: const [
                             Text(
                               'Vivek Shinde',
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 30,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Text(
                               'devil_vicky08_ss',
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(width: 20,),
                       Container(
                         // color: Colors.redAccent,
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             IconButton(onPressed: (){

                             },
                                 icon: Icon(Icons.settings)),
                             IconButton(onPressed: (){

                             },
                                 icon: Icon(Icons.message)),
                             IconButton(onPressed: (){

                             },
                                 icon: Icon(Icons.thumb_up_alt_sharp)),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
              ),
              Container(
                // color: Colors.orange[50],
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeFactor: 0.4,
                  ),
                  items: imageSliders1,
                ),
              ),
              SizedBox(height: 25,),
              FlipCard(
                fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                direction: FlipDirection.HORIZONTAL, // default
                side: CardSide.FRONT,
                // The side to initially display.
                front: Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.black45,width: 1.5),
                    gradient:  LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2E3192),
                      Color(0xff1BFFFF),
                    ],
                  ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Account Details',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Saving A/C',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 10),
                      Text("1212  0100  8989",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 20),
                     Center(
                       child: Text("Rs. 6523.00 /-",style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.w500,
                         fontSize: 18,
                       ),),
                     ),
                      SizedBox(height: 10),
                      Text("UPI ID: 5578299abx.imh@icici",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),),
                      Divider(
                        height: 10,
                        color: Colors.white,
                        thickness: 1,
                        indent : 10,
                        endIndent : 10,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Statement",style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Text("Debit Card",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Text("Services",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                back: Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.black45,width: 1.5),
                    gradient:  LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff2E3192),
                        Color(0xff1BFFFF),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('My Account Details',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text('Saving A/C',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 10),
                      Text("1212  0100  8989",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.white,width: 1.5)
                        ),
                        child: TextButton(
                          onPressed: (){},
                          child: Text("View Balance",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("UPI ID: 5578299abx.imh@icici",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),),
                      Divider(
                        height: 10,
                        color: Colors.white,
                        thickness: 1,
                        indent : 10,
                        endIndent : 10,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Statement",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Text("Debit Card",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Text("Services",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ),
              SizedBox(height: 25,),
              Container(
                // color: Colors.greenAccent,
                height: 300,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black45,width: 1.5),
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),

                  children: [
                    Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),
                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),
                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: const [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                  ],
                      ),

                // The end action pane is the one at the right or the bottom side.
                endActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 2,
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archive',
                    ),
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.save,
                      label: 'Save',
                    ),
                  ],
                ), child: ListTile(title: Text('Slide To Remove/Save')),
                    ),
                    Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(1),
                      // The start action pane is the one at the left or the top side.
                      startActionPane: const ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),
                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ],
                      ),endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: const [
                        SlidableAction(
                          // An action can be bigger than the others.
                          flex: 2,
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: const ListTile(title: Text('Slide To Remove/Save')),
                    ),
                  ]
                ),
              ),
            ],
          )
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Color(0xff93A5CF),
        color: Colors.white70,
        buttonBackgroundColor: Colors.blue,
        items: <Widget>[
          Icon(Icons.portrait_outlined, size: 30,),
          Icon(Icons.list, size: 30,),
          Icon(Icons.calendar_month, size: 30,),
        ],
        onTap: (index) {
          selectedPage = index;
          if(selectedPage != 0){
            //listView == true;
          }
          print("Vivek:$selectedPage");
          //Handle button tap
        },
        letIndexChange: (selectedPage) => true,
      ),
    );
  }
}
final List<Widget> imageSliders1 = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();
void doNothing(BuildContext context) {}
