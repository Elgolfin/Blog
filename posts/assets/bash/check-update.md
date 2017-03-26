This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

```bash
#!/bin/bash

function send_email {

  TO="Display Name <email@domain.ext>"
  FROM="Display Name <email@domain.ext>"
  SUBJECT="Update needed on ${1}"
  MESSAGE="${2}"

  date="$(date -R)"
  priv_key=""
  access_key=""
  signature="$(echo -n "$date" | openssl dgst -sha256 -hmac "$priv_key" -binary | base64 -w 0)"
  auth_header="X-Amzn-Authorization: AWS3-HTTPS AWSAccessKeyId=$access_key, Algorithm=HmacSHA256, Signature=$signature"
  endpoint="https://email.us-west-2.amazonaws.com/"

  action="Action=SendEmail"
  source="Source=$FROM"
  to="Destination.ToAddresses.member.1=$TO"
  subject="Message.Subject.Data=$SUBJECT"
  message="Message.Body.Text.Data=$MESSAGE"

  curl -v -X POST -H "Date: $date" -H "$auth_header" --data-urlencode "$message" --data-urlencode "$to" --data-urlencode "$source" --data-urlencode "$action" --data-urlencode "$subject"  "$endpoint"

}

UPDATE=$(yum check-update)
if [[ $? -gt 0  ]] ; then
  send_email "$(hostname)" "${UPDATE}"
fi
```

[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)