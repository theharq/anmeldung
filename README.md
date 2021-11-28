## Anmeldung

This is a simple script for those times we don't get an appointment in the Burgeramt and the 14 days deadline has already passed.

## How it works

The Heroku Scheduler calls a rake task and when an available date is found it will send an email, an SMS, and will call to notify you. It is not intended to make the appointment for you. Once the alert is received you may continue with the booking of the appointment.

### Configuring the script

The first step would be to create a Heroku app and add the [google chrome buildpack](https://github.com/heroku/heroku-buildpack-google-chrome).

Set up a Twilio account, and add the Mailgun addon to the project, then make sure to have the following environment variables set with your configuration:

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

After getting your appointment please disable this script.


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

