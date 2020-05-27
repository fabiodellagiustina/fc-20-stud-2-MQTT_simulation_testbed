const client = new Paho.MQTT.Client("172.24.4.101", Number(9001), "myClientId" + (new Date).getTime());
client.onConnectionLost = onConnectionLost, client.onMessageArrived = onMessageArrived, client.connect({
  onSuccess: onConnect
});

function onConnect() {
  console.log("onConnect"), client.subscribe("#")
}

function onConnectionLost(n) {
  0 !== n.errorCode && console.log("onConnectionLost:" + n.errorMessage), client.connect({
    onSuccess: onConnect
  })
}

function onMessageArrived(n) {
  let e = document.createElement("div");
  e.innerHTML = n.payloadString, document.body.appendChild(e)
}
