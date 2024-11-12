.class Lcom/nonox/tersp/dres/Qesntpa$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/nonox/tersp/dres/Qesntpa$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nonox/tersp/dres/Qesntpa;->attachBaseContext(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Lcom/nonox/tersp/dres/Qesntpa;


# direct methods
.method constructor <init>(Lcom/nonox/tersp/dres/Qesntpa;Ljava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Lcom/nonox/tersp/dres/Qesntpa;

    .prologue
    .line 289
    iput-object p1, p0, Lcom/nonox/tersp/dres/Qesntpa$b;->b:Lcom/nonox/tersp/dres/Qesntpa;

    iput-object p2, p0, Lcom/nonox/tersp/dres/Qesntpa$b;->a:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 305
    invoke-virtual {p0, p1}, Lcom/nonox/tersp/dres/Qesntpa$b;->b(Ljava/io/File;)V

    .line 306
    return-void
.end method

.method public a(Ljava/util/zip/ZipFile;)V
    .locals 2
    .param p1, "zipFile"    # Ljava/util/zip/ZipFile;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/nonox/tersp/dres/Qesntpa$b;->b:Lcom/nonox/tersp/dres/Qesntpa;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/nonox/tersp/dres/Qesntpa;->d:Z

    .line 311
    iput-object p1, v0, Lcom/nonox/tersp/dres/Qesntpa;->c:Ljava/util/zip/ZipFile;

    .line 312
    return-void
.end method

.method b(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 292
    :try_start_0
    new-instance v1, Lcom/nonox/tersp/dres/Qesntpa$c;

    invoke-direct {v1}, Lcom/nonox/tersp/dres/Qesntpa$c;-><init>()V

    .line 294
    .local v1, "tools":Lcom/nonox/tersp/dres/Qesntpa$c;
    invoke-static {p1}, Lcom/nonox/tersp/dres/Qesntpa$c;->a(Ljava/io/File;)[B

    move-result-object v0

    .line 296
    .local v0, "bytes":[B
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/nonox/tersp/dres/Bernt;->decrypt([BLjava/lang/String;)V

    .line 297
    iget-object v2, p0, Lcom/nonox/tersp/dres/Qesntpa$b;->a:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 299
    nop

    .line 300
    .end local v0    # "bytes":[B
    .end local v1    # "tools":Lcom/nonox/tersp/dres/Qesntpa$c;
    :goto_0
    return-void

    :catch_0
    move-exception v2

    goto :goto_0
.end method
