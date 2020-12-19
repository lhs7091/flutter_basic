# Flutter Spring connect

 - Front : Flutter
 - Back : SpringBoot
 
## SpringBoot server setting
  for test, we need ngrok or global ip address for spring boot server.  
  becase android ip address after flutter run would be private IP.  
  so it couldn't trans any data.
  
  I think it's simple option hereby.  
  - run ngrok(https://ngrok.com/download)
  - input command : ngrok http 8080  
    -> 8080 means your spring boot server port after running.  
  - check your new domain(ex. https://c4a0538b50d3.ngrok.io)
  - change IP address in source (front_flutter/lib/spring_test_screen.dart)
  - and running.  
 
