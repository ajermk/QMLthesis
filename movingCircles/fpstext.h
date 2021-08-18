#ifndef FPSTEXT_H
#define FPSTEXT_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QQuickItem>
#include <QVector>
#include <QPainter>
#include <QDateTime>
#include <QTimer>

class FPSText: public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int fps READ fps NOTIFY fpsChanged)
public:
    FPSText(QQuickItem *parent = 0);
    ~FPSText();
    void paint(QPainter *);
    Q_INVOKABLE int fps()const;

signals:
    void fpsChanged(int);
private slots:
    void timeout();
private:
    void recalculateFPS();
    int _currentFPS;
    int _cacheCount;
    QVector<qint64> _times;
};


#endif // FPSTEXT_H
