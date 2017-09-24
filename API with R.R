library(httr)#previously this package should be installed


#Guide to enter the github API's with R using httr package
#First: To regist the new application in https://github.com/settings/developers
#Use any URL for the homepage URL (http://github.com is fine)
#and http://localhost:1410 as the callback url

oauth_endpoints("github")#We get some specific functions to that API we want
#enter. In this case 'github'

myapp<-oauth_app("profiles",key = '5c576e360156527b85f9',
                 secret = 'd90ff04522d2c38d3bf900bda5964bb8d0058fc2')
#The arguments are appname,client id y client secret respectly, we get these 
#when we create the app in the API

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
#we save in req the code from url