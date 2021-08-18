#include "imgreader.h"

imgReader::imgReader(QObject *parent) : QObject(parent)
{

}

QString imgReader::getPath()
{
    // uses qdir method
    return dir.path();
}

void imgReader::setPath(QString value)
{
    // uses qdir method
    dir.setPath(value);
}

QStringList imgReader::getFiles()
{
    dir.setNameFilters(QStringList()<<"*.png"<<"*.jpeg"<<"*.jpg");
    QFileInfoList list = dir.entryInfoList();
    //qInfo() << list;

    //build filename list
    QStringList files;

    foreach(QFileInfo f, list) {
        files.append(f.fileName());
    }

    return files;
}
