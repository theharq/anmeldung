## Anmeldung

This is a simple script for those times we don't get an appointment in the Burgeramt and the deadline of the 14 days is past.

## How it works

It is a simple ruby script that is executed by a task scheduler every 10 minutes and when there is a date available it will send an email, as sms and will call you to alert you. It is not intended to make the appointment for you. Once the alert is received you can go to the page and do it yourself.


### Configuring the script

The first step would be to create a heroku app and add the [google chrome buildpack](https://github.com/heroku/heroku-buildpack-google-chrome).

Setup a twilio account and add the mailgun addon to the project, then make sure to have the following environment variables set with your configuration:

```
TWILIO_ACCOUNT_SID
TWILIO_AUTH_TOKEN
TWILIO_NUMBER
MAILGUN_SMTP_LOGIN
MAILGUN_SMTP_PASSWORD
BURGERAMT_IDS
MY_EMAIL
MY_PHONE
```

After deploying the script go to the scheduler addon you decided to use and configure it to run this rake task: `rake check_anmeldung`

After getting your appointment please disable the script.


## Relevant links

* [Registration of an apartment][1]
* [Heroku mailgun addon][2]
* [Heroku scheduler addon][3]
* [Twilio][4]
* [Google Chrome buildpack][5]

  [1]: https://service.berlin.de/dienstleistung/120686/
  [2]: https://elements.heroku.com/addons/mailgun
  [3]: https://elements.heroku.com/addons/crontogo
  [4]: https://www.twilio.com/voice
  [5]: https://github.com/heroku/heroku-buildpack-google-chrome

