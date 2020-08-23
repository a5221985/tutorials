
heroku domains:add www.atriahealthcare.com.au
heroku domains:add atriahealthcare.com.au

cat 565e69c6dd06f23.crt gd_bundle-g2-g1.crt > combined.crt

heroku addons:create ssl:endpoint
heroku certs:add combined.crt server.key

heroku certs

CNAME: www, aquatic-cicada-8bvp6o75t4yh2rm4cfajhwqv.ssl.herokudns.com
Forwarding:
https://www.atriahealthcare.com.au
Permanent (301)
Forward only

Try the following after a while (may take from 2 hours to a day)

curl -vI https://www.atriahealthcare.com.au
