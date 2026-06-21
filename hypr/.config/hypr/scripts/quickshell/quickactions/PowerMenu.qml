import QtQuick
import QtQuick.Controls

Rectangle {
    id: powerMenu
    width: 160
    height: 220
    radius: 16
    color: Qt.rgba(mocha.base.r, mocha.base.g, mocha.base.b, 0.95)
    border.width: 1
    border.color: Qt.rgba(mocha.text.r, mocha.text.g, mocha.text.b, 0.1)

    signal closed()

    Column {
        anchors.centerIn: parent
        spacing: 8

        Repeater {
            model: [
                { icon: "⏻", label: "Apagar", cmd: "systemctl poweroff" },
                { icon: "↺", label: "Reiniciar", cmd: "systemctl reboot" },
                { icon: "⏾", label: "Suspender", cmd: "systemctl suspend" },
                { icon: "⇢", label: "Cerrar sesion", cmd: "hyprctl dispatch exit" }
            ]

            delegate: Rectangle {
                width: 140
                height: 40
                radius: 10
                color: btnMouse.containsMouse ? Qt.rgba(mocha.red.r, mocha.red.g, mocha.red.b, 0.2) : "transparent"
                Behavior on color { ColorAnimation { duration: 150 } }

                Row {
                    anchors.centerIn: parent
                    spacing: 10
                    Text {
                        text: modelData.icon
                        font.pixelSize: 18
                        color: mocha.red
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        text: modelData.label
                        font.family: "JetBrains Mono"
                        font.pixelSize: 13
                        color: mocha.text
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                MouseArea {
                    id: btnMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        powerMenu.closed()
                        Quickshell.execDetached(["bash", "-c", modelData.cmd])
                    }
                }
            }
        }
    }
}
