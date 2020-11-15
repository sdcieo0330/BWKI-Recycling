import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.12
import ImageProcessing 1.0

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Recycle or Reuse")

    ApplicationWindow {
        id: cameraImage
        visible: false
        height: 420
        width: 640
        Image {
            anchors.top: parent.top
            anchors.left: parent.left
            height: 360
            fillMode: Image.PreserveAspectFit
            id: photoPreview
        }
        RoundButton {
            anchors.top: photoPreview.bottom
            anchors.verticalCenter: parent.verticalCenter
            anchors.topMargin: 2
            id: closeButton
            text: "Close"
            onClicked: cameraImage.hide()
        }
    }

    ImageProcessing {
        id: imageProcessing
    }

    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceAuto

        captureMode: Camera.CaptureStillImage

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
                cameraImage.show()
                imageProcessing.processImage(preview)
                console.log(preview)
            }
        }
        objectName: "qmlCamera"
    }

    VideoOutput {
        id: cameraPreview
        source: camera
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: captureButton.top
        fillMode: VideoOutput.PreserveAspectFit
        focus: visible
    }

    RoundButton {
        id: captureButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        icon.name: "find"
        onClicked: camera.imageCapture.capture()
    }
}
