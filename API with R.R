library(Rfacebook)#previously this package should be installed
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

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp,
                               cache = FALSE) #very important cache=false
#FALSE means don't cache
#Get OAuth credentials
gtoken <- config(token = github_token)
req <- GET("https://github.com/rasbt", gtoken)
#we save in req the code from url
stop_for_status(req)
req<-content(req)
#Important: The code is in xml format.


##Guide to enter the facebook API with Rfacebook packages

app_id<-'143231016299300'
app_secret<-'75a5619490249f09995267da0ca46e59'
#token<-'8AyWu4xXlPnOjOzGCBI8zq2XD-g'
#We get this information from app

token<-fbOAuth(app_id = app_id,app_secret = app_secret)
#go to the app, click in add product, click in  login
# and we paste http://localhost:1410/ in URL..

