import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtMultimedia 5.12

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Recycle or Reuse")

    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceAuto

        exposure {
//            exposureCompensation: -1.0
            exposureMode: CameraExposure.ExposurePortrait
        }

        captureMode: Camera.CaptureVideo
    }

    VideoOutput {
        id: cameraPreview
        source: camera
        anchors.fill: parent
        focus: visible
    }
}
