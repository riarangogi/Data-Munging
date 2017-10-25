library(RGoogleAnalytics)#previously this package should be installed
library(RCurl)#previously this package should be installed
library(twitteR)#previously this package should be installed
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

app_id<-'497827420597347'
app_secret<-'8352c830c1d73f97c5f0593ead4fb29a'
#We get this information from app

token<-fbOAuth(app_id = app_id,app_secret = app_secret)
#go to the app, click in add product, click in  login
# and we paste http://localhost:1410/ in URL..

post_page_bpp<-getPage('BibliotecaPublicaPiloto',token = token,n=50)
#we get the post information from bpp page and save in
#post_page_bpp variable


##Guide to enter the twitter API with twitteR packages

api_key <-'Qgz8aMN94Lbx22FYzpZUM6OvS'
api_secret <-'JOFl64xIbGcajBbnsYRpr4Sf1TPfBDlLx9FwbjRipViL0H2m0L'
access_token <-'831699805583863808-hity6rLSWqcBixeC5qQsO4x85xc7wTh'
access_token_secret <-'Ux4bebOxzVPVRm93tqdBM4zWQgwl1fQJEnUyZwKYMBdXv'
#We get this information from app

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
#Is very important that we select the 2 option

tweets<-userTimeline('carobolivar17',n=30)
#we saved the tweets of @carobolivar 17 in tweets variable


##Guide to enter the google API with RGoogleAnalytics packages

client_id<-(
'945826807451-trhck9kjcdjrkokabn1k14bivujap92u.apps.googleusercontent.com')
client_secret<-'RJ5QvBLpqivBCLVJv6AbxWFf'

token<-Auth(client.id = client_id,client.secret = client_secret)
#we paste http://localhost:1410/ in URL of redirect..

ValidateToken(token)
