String  validateEmail(String value){
  late String _msg;
  RegExp regex = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if(value.isEmpty){
    _msg = 'Your username is required';
  }else if(!regex.hasMatch(value)){
    _msg = 'Please provide a valid email address';
  }
  return  _msg;
}