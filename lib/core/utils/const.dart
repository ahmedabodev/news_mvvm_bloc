import 'dart:io';

class strings{
  static const fontname='GT';
 static const  imgsor='https://www.themoviedb.org/t/p/w600_and_h900_bestv2';


}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}