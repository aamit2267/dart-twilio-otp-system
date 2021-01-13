import 'package:twilio_dart/twilio.dart';
import 'dart:math';
import 'dart:io';

var key = "your_api_key";
var authtoken = "your_authtoken";
var version = "2021-01-13";
Twilio twilio = new Twilio(key, authtoken, version);

function generate_code(){
  Random rnd = new Random();
  var code = 1000 + rnd.nextInt(9999 - 1000)
  var my_number = "+120375898651";
  var client_number = stdin.readLineSync();
  var message = "Your OTP code: ${code}";
  twilio.sendSMS(my_number, client_number, message).then((response) => print("Your message has been sent!")).catchError(print);
  return code
}

void main(){
  var code_value = generate_code(); 
  var recieved_code = int.parse(stdin.readLineSync());
  
  if (recieved_code == code_value){
    print("Sucess!");
  }else{
    print("Wrong OTP Entered!");
  }
}
