import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostDetailScreen extends StatefulWidget {
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        //backgroundColor: Colors.transparent,
        backgroundColor: Color(0x44000000),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/img_login.jpg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: RichText(
                        text: TextSpan(
                            text: "Nguyễn Đông Hướng",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(text: '\n'),
                              WidgetSpan(
                                child: Text(
                                  String.fromCharCode(0xf2ff),
                                  style: TextStyle(
                                    fontFamily:
                                        'MaterialIcons', //<-- fontFamily
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: ' 100',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(text: '       '),
                              WidgetSpan(
                                child: Text(
                                  String.fromCharCode(0xef6d),
                                  style: TextStyle(
                                    fontFamily:
                                        'MaterialIcons', //<-- fontFamily
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: ' 20',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(text: '       '),
                              WidgetSpan(
                                child: Text(
                                  String.fromCharCode(0xf051f),
                                  style: TextStyle(
                                    fontFamily:
                                        'MaterialIcons', //<-- fontFamily
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: ' 2002-12-12',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "aaaaaaaaaaaaaaaaaaaaaaaaasssssssssssssssssssssssssssssaaaaaa",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Center(
                child: Html(
                  data:
                      "<h1 class=\"entry-title\">&nbsp;</h1>\r\n<p><strong>Few skills scare people away like coding. Television portrayals make it seem like writing computer code is a genius-level activity, as weird symbols race across the screen and techno music blares in the background.</strong></p>\r\n<div class=\"media-wrap image-wrap\" style=\"text-align: center;\"><img class=\"wp-image-10117\" style=\"height: auto;\" src=\"https://www.scotthyoung.com/blog/wp-content/uploads/2019/07/coding-perception-vs-reality.png\" sizes=\"(max-width: 800px) 100vw, 800px\" srcset=\"https://www.scotthyoung.com/blog/wp-content/uploads/2019/07/coding-perception-vs-reality.png 800w, https://www.scotthyoung.com/blog/wp-content/uploads/2019/07/coding-perception-vs-reality-300x147.png 300w, https://www.scotthyoung.com/blog/wp-content/uploads/2019/07/coding-perception-vs-reality-768x375.png 768w\" alt=\"\" height=\"auto\" /></div>\r\n<p><br /><strong>But the truth is that coding is actually pretty easy.</strong><br /><strong>I&rsquo;m not saying this to dismiss the work of brilliant programmers. A skill can simultaneously be fairly easy to get the basics in, while also being really difficult to master. Everyone learns to write, few people learn to write well. There&rsquo;s no contradiction, therefore, in saying that basic literacy is an &ldquo;easy&rdquo; skill to acquire (in that the vast majority of us are able to do it), without dismissing the efforts of talented writers.</strong><br /><strong>Nor am I saying this to mock people who are trying to learn programming and find it frustrating.</strong><br /><strong>Rather, I say coding is easy because I believe that almost all people, even if they don&rsquo;t see themselves as particularly smart, have the ability to learn to write simple programs. That they don&rsquo;t is mostly due to some structural barriers than any intrinsic difficulty with the skill itself.</strong><br /><strong>My Experience Coding</strong><br /><strong>Listen to this article</strong><br /><br /><strong>I&rsquo;ve been writing programs for over half my life. I&rsquo;ve taken a couple university classes. I even worked through the <a href=\"https://www.scotthyoung.com/blog/myprojects/mit-challenge-2/\">content of a CS degree online</a> (which is totally unnecessary if you want to learn to code, by the way).</strong><br /><strong>In some ways, my background may seem to disqualify me about making statements on the ease of coding. However, I can say, without a doubt, that subjects like engineering, accounting, physics and law are more difficult than programming. Most math you learn in high-school is more difficult too, although you usually get waaay more practice with algebra than code, which often leads to a misperception as to which is more difficult.</strong><br /><strong>Why Coding Feels Hard</strong><br /><strong>Learning to code is hard for a couple reasons:</strong></p>\r\n<ol>\r\n<li><strong>Installing new languages is super frustrating. This is the first activity for a would-be programmer and, to this day, the thing I hate most about programming. This can create the misperception that programming is really hard because newbies extrapolate the difficulty of getting set up to how it will be every moment after.</strong></li>\r\n<li><strong>There are waay too many languages, tools, libraries and plug-ins. Starting programming is super overwhelming because there are a bajillion things to learn and you have no idea where to start.</strong></li>\r\n<li><strong>Early classes tend to be populated with people who have taught themselves programming before. Thus, you may think you&rsquo;re not smart enough to program because of an unfair comparison. (I once knew a woman who got a masters in civil engineering, which is much harder than intro coding, and she told me she wasn&rsquo;t smart enough to code because of her first class. This is <em>bananas</em>, and yet people fall for it because some nerdy kid has like ten years of experience before the class starts.)</strong></li>\r\n</ol>\r\n<p><strong>The first moments of programming are the hardest. Getting set up is annoyingly difficult and often requires learning a new way of working with computers even before you write a single line of code.</strong></p>",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
