class Dimensions{
  double heightScreen = 0 ;
  double widthScreen = 0;

  static  final Dimensions _instance  = Dimensions._privateConstructor()  ;

  Dimensions._privateConstructor() ;

  static Dimensions getInstance(){
    return _instance;
  }


  void setDimension(double height , double width){
    _instance.heightScreen = height ;
    _instance.widthScreen = width ;
  }
}