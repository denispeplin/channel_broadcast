import socket from "./socket"

$(function () {
    // Now that you are connected, you can join channels with a topic:
    let channel = socket.channel("room:lobby", {})

    channel.join()
        .receive("ok", resp => { console.log("Joined successfully", resp) })
        .receive("error", resp => { console.log("Unable to join", resp) })

    channel.on("change", resp => {
        console.log("Change:", resp);
    })
})
