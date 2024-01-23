import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property int radius: 0 // daca radius = 0 -> btn rotund
    property color bgColor: "#cecece"
    property int drawRadius: radius > 0 ? radius : width/2

    Item {

        anchors.fill: parent

        Image {
            anchors.fill: parent
            sourceSize: Qt.size(width, height)
            source: "bauturi.jpg"
            asynchronous: true
        }

        Canvas {
            anchors.fill: parent
            antialiasing: true
            onPaint: {
                var ctx = getContext("2d")
                ctx.fillStyle = bgColor
                ctx.beginPath()
                ctx.rect(0, 0, width, height)
                ctx.fill()

                ctx.beginPath()
                ctx.globalCompositeOperation = 'source-out'
                ctx.roundedRect(0, 0, width, height, drawRadius, drawRadius)
                ctx.fill()
            }
        }
    }
}
