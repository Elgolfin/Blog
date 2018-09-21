This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

Useful Links - Week of September 17th, 2018
======

- [Working offline](https://developer.mozilla.org/en-US/docs/Web/Apps/Fundamentals/Offline)
- [localForage](https://github.com/localForage/localForage)
- [Offline.js](http://github.hubspot.com/offline/docs/welcome/)
  - [Offline.js Simulate UI](http://craigshoemaker.github.io/offlinejs-simulate-ui/)
- [StorageManager and browser storage limit](https://stackoverflow.com/questions/35242869/what-is-the-storage-limit-for-a-service-worker#35696506)

```javascript
if ('storage' in navigator && 'estimate' in navigator.storage) {
  navigator.storage.estimate().then(({usage, quota}) => {
    console.log(`Using ${usage} out of ${quota/1024/1024}M bytes.`);
  }).catch(error => {
    console.error('Loading storage estimate failed:');
    console.log(error.stack);
  });
} else {
  console.error('navigator.storage.estimate API unavailable.');
}
```

[![creativecommons image](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)