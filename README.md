# Sensu Monitoring App

Ionic based apps for server monitoring using sensu api, support for push
 notification using google cloud messaging & onesignal api


## Instruction

* Install nodejs
* Install ionic framework `npm install -g ionic`
* Install gulp `npm install -g gulp`
* Install bower `npm install -g bower`
* Clone repo `git clone https://github.com/nsulistiyawan/sensu-monitoring-app.git`
* Install all dependencies `npm install && bower install`
* Changing YOUR_SENSU_URL_BASE_API, ( ONE_SIGNAL_APP_ID, GOOGLE_PROJECT_NUMBER is optional ) on www/js/app.js
* Compile assets `gulp` or `gulp watch`
* Run `ionic serve` or `ionic serve --lab`, open http://localhost:8100


## Building Instruction for Android

* install Apache Cordova `npm install -g cordova`
* install Java Development Kit (JDK)
* install Apache Ant
* install Android SDK
* adding Android SDK Path, Node Path

```
export PATH="$HOME/your_node_path/bin:$PATH"
export PATH="/opt/your_android_sdk_path/tools:$PATH"
export PATH="/opt/your_android_sdk_path:$PATH"
export ANDROID_HOME="/your_android_sdk_path:$PATH"
```

* Save code above on ~/.profile file. So it will be saved on next reboot
* follow instruction at http://ionicframework.com/docs/guide/publishing.html


## Screenshot

![Overview Sensu Monitoring App](http://i.imgur.com/8eGATyo.png)
![Client List Sensu Monitoring App](http://i.imgur.com/MVy6Npn.png)
![Client Details Sensu Monitoring App](http://i.imgur.com/i3IfgGG.png)
![Silenced Event Sensu Monitoring App](http://i.imgur.com/sS02Gm4.png)
