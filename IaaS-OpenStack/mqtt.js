const client = new Paho.MQTT.Client("mqtt.eclipse.org", Number(443), "myClientId" + (new Date).getTime()),
  myTopic = "test";
client.onConnectionLost = onConnectionLost, client.onMessageArrived = onMessageArrived, client.connect({
  onSuccess: onConnect
});
let count = 0;

function onConnect() {
  console.log("onConnect"), client.subscribe(myTopic), setInterval(() => {
    publish(myTopic, `The count is now ${count++}`)
  }, 1e3)
}

function onConnectionLost(n) {
  0 !== n.errorCode && console.log("onConnectionLost:" + n.errorMessage), client.connect({
    onSuccess: onConnect
  })
}
const publish = (n, e) => {
  console.log("desint :", n, "msggg", e);
  let o = new Paho.MQTT.Message(e);
  o.destinationName = n, client.send(o)
};

function onMessageArrived(n) {
  let e = document.createElement("div");
  e.innerHTML = n.payloadString, document.body.appendChild(e)
}
