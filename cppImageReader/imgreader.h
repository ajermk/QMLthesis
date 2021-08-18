#ifndef IMGREADER_H
#define IMGREADER_H

#include <QObject>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QFileInfoList>
#include <QByteArray>
#include <QVariant>
#include <QDebug>

class imgReader : public QObject
{
    Q_OBJECT
    //properties to use in qml
    Q_PROPERTY(QString path READ getPath WRITE setPath)
    Q_PROPERTY(QStringList files READ getFiles)
public:
    explicit imgReader(QObject *parent = nullptr);
    QString getPath();
    void setPath(QString value);
    QStringList getFiles();


private:
    QDir dir; //default gets current directory

signals:

};

#endif // IMGREADER_H
