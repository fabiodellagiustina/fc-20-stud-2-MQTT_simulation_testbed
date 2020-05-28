const broker1 = new Paho.MQTT.Client("172.24.4.101", Number(9001), "webserver" + (new Date).getTime());
const broker2 = new Paho.MQTT.Client("172.24.4.102", Number(9001), "webserver" + (new Date).getTime());

broker1.onConnectionLost = onConnectionLostBroker1, broker1.onMessageArrived = onMessageArrived, broker1.connect({
  onSuccess: onConnectBroker1
});

function onConnectBroker1() {
  console.log("onConnectBroker1"), broker1.subscribe("#")
}

function onConnectionLostBroker1(n) {
  0 !== n.errorCode && console.log("onConnectionLostBroker1:" + n.errorMessage), broker1.connect({
    onSuccess: onConnectBroker1
  })
}

broker2.onConnectionLost = onConnectionLostBroker2, broker2.onMessageArrived = onMessageArrived, broker2.connect({
  onSuccess: onConnectBroker2
});

function onConnectBroker2() {
  console.log("onConnectBroker2"), broker2.subscribe("#")
}

function onConnectionLostBroker2(n) {
  0 !== n.errorCode && console.log("onConnectionLostBroker2:" + n.errorMessage), broker2.connect({
    onSuccess: onConnectBroker2
  })
}

function onMessageArrived(n) {
  let e = document.createElement("div");
  e.innerHTML = n.payloadString, document.body.appendChild(e)
}
