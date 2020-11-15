#ifndef IMAGEPROCESSING_H
#define IMAGEPROCESSING_H

#include <QObject>

class ImageProcessing : public QObject
{
    Q_OBJECT
public:
    explicit ImageProcessing(QObject *parent = nullptr);

public slots:
    void processImage(const QString &path);
};

#endif // IMAGEPROCESSING_H
