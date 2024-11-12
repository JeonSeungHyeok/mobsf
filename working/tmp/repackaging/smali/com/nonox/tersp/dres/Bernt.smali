.class public Lcom/nonox/tersp/dres/Bernt;
.super Ljava/lang/Object;
.source ""


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    nop

    .line 15
    invoke-static {}, Lcom/nonox/tersp/dres/Bernt;->a()V

    .line 16
    const-string v0, "bbes"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public static a()V
    .locals 0

    .prologue
    .line 8
    nop

    .line 9
    return-void
.end method

.method public static native decrypt([BLjava/lang/String;)V
.end method
