.class public Lcom/nonox/tersp/dres/Qesntpa;
.super Landroid/app/Application;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nonox/tersp/dres/Qesntpa$e;,
        Lcom/nonox/tersp/dres/Qesntpa$d;,
        Lcom/nonox/tersp/dres/Qesntpa$c;,
        Lcom/nonox/tersp/dres/Qesntpa$f;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/util/zip/ZipFile;

.field public d:Z

.field public e:Ljava/lang/reflect/Field;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/reflect/Field;

.field public h:[Ljava/lang/Object;

.field public i:Ljava/lang/reflect/Method;

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/IOException;",
            ">;"
        }
    .end annotation
.end field

.field private k:Z

.field private l:Landroid/os/Handler;

.field public m:Z

.field public n:Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 76
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nonox/tersp/dres/Qesntpa;->j:Ljava/util/ArrayList;

    .line 68
    nop

    .line 69
    nop

    .line 70
    nop

    .line 80
    nop

    .line 81
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nonox/tersp/dres/Qesntpa;->k:Z

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 236
    new-instance v0, Lcom/nonox/tersp/dres/Qesntpa$a;

    invoke-direct {v0, p0}, Lcom/nonox/tersp/dres/Qesntpa$a;-><init>(Lcom/nonox/tersp/dres/Qesntpa;)V

    iput-object v0, p0, Lcom/nonox/tersp/dres/Qesntpa;->l:Landroid/os/Handler;

    return-void
.end method

.method private a()V
    .locals 23

    .prologue
    .line 425
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->m:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1

    .line 486
    :cond_0
    :goto_0
    return-void

    .line 428
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->a:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_0

    .line 432
    invoke-virtual/range {p0 .. p0}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    .line 434
    .local v5, "baseContext":Landroid/content/Context;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->a:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 435
    .local v7, "delegateClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/app/Application;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    .line 437
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-class v22, Landroid/content/Context;

    aput-object v22, v20, v21

    const-class v21, Landroid/app/Application;

    const-string v22, "attach"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 438
    .local v4, "attach":Ljava/lang/reflect/Method;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 439
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v5, v21, v22

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v4, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    const-string v20, "android.app.ContextImpl"

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 445
    .local v6, "contextImplClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v20, "mOuterContext"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v17

    .line 446
    .local v17, "mOuterContextField":Ljava/lang/reflect/Field;
    const/16 v20, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 450
    const-string v20, "mMainThread"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v16

    .line 451
    .local v16, "mMainThreadField":Ljava/lang/reflect/Field;
    const/16 v20, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 452
    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .line 455
    .local v15, "mMainThread":Ljava/lang/Object;
    const-string v20, "android.app.ActivityThread"

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 456
    .local v3, "activityThreadClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v20, "mInitialApplication"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v14

    .line 457
    .local v14, "mInitialApplicationField":Ljava/lang/reflect/Field;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 458
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v14, v15, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 460
    const-string v20, "mAllApplications"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 461
    .local v10, "mAllApplicationsField":Ljava/lang/reflect/Field;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 462
    invoke-virtual {v10, v15}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/ArrayList;

    .line 463
    .local v9, "mAllApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Application;>;"
    move-object/from16 v0, p0

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 464
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    const-string v20, "mPackageInfo"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v19

    .line 468
    .local v19, "mPackageInfoField":Ljava/lang/reflect/Field;
    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 469
    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .line 471
    .local v18, "mPackageInfo":Ljava/lang/Object;
    const-string v20, "android.app.LoadedApk"

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 472
    .local v8, "loadedApkClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v20, "mApplication"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 473
    .local v11, "mApplicationField":Ljava/lang/reflect/Field;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 474
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 477
    const-string v20, "mApplicationInfo"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    .line 478
    .local v13, "mApplicationInfoField":Ljava/lang/reflect/Field;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v13, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 479
    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/pm/ApplicationInfo;

    .line 480
    .local v12, "mApplicationInfo":Landroid/content/pm/ApplicationInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->a:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iput-object v0, v12, Landroid/content/pm/ApplicationInfo;->className:Ljava/lang/String;

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nonox/tersp/dres/Qesntpa;->l:Landroid/os/Handler;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    invoke-virtual/range {v20 .. v21}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 485
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/nonox/tersp/dres/Qesntpa;->m:Z

    goto/16 :goto_0
.end method

.method public static a(Ljava/io/File;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 623
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 624
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 625
    .local v1, "files":[Ljava/io/File;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 626
    .local v0, "f":Ljava/io/File;
    invoke-static {v0}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/io/File;)V

    .line 625
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 629
    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "files":[Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 631
    :cond_1
    return-void
.end method

.method public static a(Ljava/io/File;Ljava/io/File;Lcom/nonox/tersp/dres/Qesntpa$e;)V
    .locals 13
    .param p0, "xZip"    # Ljava/io/File;
    .param p1, "mDir"    # Ljava/io/File;
    .param p2, "mLister"    # Lcom/nonox/tersp/dres/Qesntpa$e;

    .prologue
    .line 641
    :try_start_0
    invoke-static {p1}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/io/File;)V

    .line 642
    new-instance v11, Ljava/util/zip/ZipFile;

    invoke-direct {v11, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 644
    .local v11, "zipFile":Ljava/util/zip/ZipFile;
    invoke-virtual {v11}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v2

    .line 647
    .local v2, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 648
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/zip/ZipEntry;

    .line 650
    .local v10, "zipEntry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    .line 652
    .local v9, "name":Ljava/lang/String;
    const-string v12, "META-INF/CERT.RSA"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    const-string v12, "META-INF/CERT.SF"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 653
    const-string v12, "META-INF/MANIFEST.MF"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 657
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v12

    if-nez v12, :cond_0

    .line 658
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 660
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_1

    .line 661
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->mkdirs()Z

    .line 663
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 664
    .local v4, "fileName":Ljava/lang/String;
    const-string v12, ".dex"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    const-string v12, "classes.dex"

    invoke-static {v4, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_2

    .line 665
    invoke-static {v11, v10, v3, p2}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;Ljava/io/File;Lcom/nonox/tersp/dres/Qesntpa$e;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 685
    .end local v2    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v9    # "name":Ljava/lang/String;
    .end local v10    # "zipEntry":Ljava/util/zip/ZipEntry;
    .end local v11    # "zipFile":Ljava/util/zip/ZipFile;
    :catch_0
    move-exception v1

    .line 686
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 688
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 668
    .restart local v2    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v3    # "file":Ljava/io/File;
    .restart local v4    # "fileName":Ljava/lang/String;
    .restart local v9    # "name":Ljava/lang/String;
    .restart local v10    # "zipEntry":Ljava/util/zip/ZipEntry;
    .restart local v11    # "zipFile":Ljava/util/zip/ZipFile;
    :cond_2
    :try_start_1
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 670
    .local v5, "fos":Ljava/io/FileOutputStream;
    new-instance v8, Lcom/nonox/tersp/dres/Qesntpa$d;

    invoke-direct {v8}, Lcom/nonox/tersp/dres/Qesntpa$d;-><init>()V

    .line 671
    .local v8, "myTools":Lcom/nonox/tersp/dres/Qesntpa$d;
    invoke-virtual {v8, v10, v11}, Lcom/nonox/tersp/dres/Qesntpa$d;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/InputStream;

    .line 673
    .local v6, "is":Ljava/io/InputStream;
    const/16 v12, 0x800

    new-array v0, v12, [B

    .line 675
    .local v0, "buffer":[B
    :goto_2
    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .local v7, "len":I
    const/4 v12, -0x1

    if-eq v7, v12, :cond_3

    .line 676
    const/4 v12, 0x0

    invoke-virtual {v5, v0, v12, v7}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_2

    .line 678
    :cond_3
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 679
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    goto/16 :goto_0

    .line 684
    .end local v0    # "buffer":[B
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v7    # "len":I
    .end local v8    # "myTools":Lcom/nonox/tersp/dres/Qesntpa$d;
    .end local v9    # "name":Ljava/lang/String;
    .end local v10    # "zipEntry":Ljava/util/zip/ZipEntry;
    :cond_4
    invoke-interface {p2, v11}, Lcom/nonox/tersp/dres/Qesntpa$e;->a(Ljava/util/zip/ZipFile;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private a(Ljava/util/List;Ljava/util/List;[II)V
    .locals 3
    .param p3, "nums"    # [I
    .param p4, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;>;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;[II)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Integer;>;>;"
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    move v0, p4

    .local v0, "i":I
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_1

    .line 143
    if-le v0, p4, :cond_0

    aget v1, p3, v0

    add-int/lit8 v2, v0, -0x1

    aget v2, p3, v2

    if-ne v1, v2, :cond_0

    .line 142
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 144
    :cond_0
    aget v1, p3, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/util/List;Ljava/util/List;[II)V

    .line 146
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_1

    .line 148
    :cond_1
    return-void
.end method

.method public static a(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;Ljava/io/File;Lcom/nonox/tersp/dres/Qesntpa$e;)V
    .locals 5
    .param p0, "zipFile"    # Ljava/util/zip/ZipFile;
    .param p1, "zipEntry"    # Ljava/util/zip/ZipEntry;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "fileLister"    # Lcom/nonox/tersp/dres/Qesntpa$e;

    .prologue
    .line 710
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 711
    .local v1, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {p0, p1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v2

    .line 712
    .local v2, "is":Ljava/io/InputStream;
    const/16 v4, 0x800

    new-array v0, v4, [B

    .line 714
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "len":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 715
    const/4 v4, 0x0

    invoke-virtual {v1, v0, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .end local v0    # "buffer":[B
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "len":I
    :catch_0
    move-exception v4

    .line 725
    :goto_1
    return-void

    .line 717
    .restart local v0    # "buffer":[B
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    .restart local v3    # "len":I
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 718
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 722
    invoke-interface {p3, p2}, Lcom/nonox/tersp/dres/Qesntpa$e;->a(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method

.method private c()V
    .locals 6

    .prologue
    .line 605
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 606
    invoke-virtual {p0}, Lcom/nonox/tersp/dres/Qesntpa;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 605
    const/16 v5, 0x80

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 607
    .local v0, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 608
    .local v2, "metaData":Landroid/os/Bundle;
    if-eqz v2, :cond_1

    .line 609
    const-string v3, "iapp"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 610
    const-string v3, "iapp"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/nonox/tersp/dres/Qesntpa;->a:Ljava/lang/String;

    .line 612
    :cond_0
    const-string v3, "app_version"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 613
    const-string v3, "app_version"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/nonox/tersp/dres/Qesntpa;->b:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 620
    .end local v0    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "metaData":Landroid/os/Bundle;
    :cond_1
    :goto_0
    return-void

    .line 617
    :catch_0
    move-exception v1

    .line 618
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private d()V
    .locals 10

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x6

    const/4 v5, 0x0

    .line 92
    iget-boolean v2, p0, Lcom/nonox/tersp/dres/Qesntpa;->k:Z

    if-eqz v2, :cond_0

    .line 93
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "great"

    const-string v4, "agret"

    invoke-virtual {p0, v3, v4}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Z)V

    .line 94
    const/16 v2, 0x12

    new-array v0, v2, [I

    aput v7, v0, v5

    aput v9, v0, v7

    aput v6, v0, v8

    const/4 v2, 0x7

    aput v2, v0, v9

    const/4 v2, 0x4

    const/16 v3, 0x9

    aput v3, v0, v2

    const/4 v2, 0x5

    const/16 v3, 0xc

    aput v3, v0, v2

    const/16 v2, 0x17

    aput v2, v0, v6

    const/4 v2, 0x7

    const/16 v3, 0x2d

    aput v3, v0, v2

    const/16 v2, 0x8

    const/16 v3, 0x38

    aput v3, v0, v2

    const/16 v2, 0x9

    const/16 v3, 0x59

    aput v3, v0, v2

    const/16 v2, 0xa

    aput v5, v0, v2

    const/16 v2, 0xb

    aput v5, v0, v2

    const/16 v2, 0xc

    aput v5, v0, v2

    const/16 v2, 0xd

    aput v5, v0, v2

    const/16 v2, 0xe

    aput v5, v0, v2

    const/16 v2, 0xf

    aput v5, v0, v2

    const/16 v2, 0x10

    aput v5, v0, v2

    const/16 v2, 0x11

    aput v5, v0, v2

    .line 95
    .local v0, "num1":[I
    new-array v1, v6, [I

    aput v8, v1, v5

    const/4 v2, 0x4

    aput v2, v1, v7

    const/16 v2, 0xa

    aput v2, v1, v8

    const/16 v2, 0x12

    aput v2, v1, v9

    const/4 v2, 0x4

    const/16 v3, 0x20

    aput v3, v1, v2

    const/4 v2, 0x5

    const/16 v3, 0x59

    aput v3, v1, v2

    .line 96
    .local v1, "num2":[I
    invoke-virtual {p0, v0, v6, v1, v6}, Lcom/nonox/tersp/dres/Qesntpa;->a([II[II)V

    .line 97
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 98
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0, v1}, Lcom/nonox/tersp/dres/Qesntpa;->a([I)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 100
    .end local v0    # "num1":[I
    .end local v1    # "num2":[I
    :cond_0
    return-void
.end method


# virtual methods
.method public a([I)Ljava/util/List;
    .locals 3
    .param p1, "nums"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 133
    invoke-static {p1}, Ljava/util/Arrays;->sort([I)V

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Integer;>;>;"
    const/4 v2, 0x0

    invoke-direct {p0, v1, v0, p1, v2}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/util/List;Ljava/util/List;[II)V

    .line 137
    return-object v1
.end method

.method public a(Ljava/util/List;Ljava/io/File;)V
    .locals 8
    .param p2, "versionDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "dexFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    const/4 v7, 0x0

    .line 370
    iget-object v2, p0, Lcom/nonox/tersp/dres/Qesntpa;->i:Ljava/lang/reflect/Method;

    iget-object v3, p0, Lcom/nonox/tersp/dres/Qesntpa;->f:Ljava/lang/Object;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v7

    const/4 v5, 0x1

    aput-object p2, v4, v5

    iget-object v5, p0, Lcom/nonox/tersp/dres/Qesntpa;->j:Ljava/util/ArrayList;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 372
    .local v0, "addElements":[Ljava/lang/Object;
    iget-object v2, p0, Lcom/nonox/tersp/dres/Qesntpa;->h:[Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    iget-object v3, p0, Lcom/nonox/tersp/dres/Qesntpa;->h:[Ljava/lang/Object;

    array-length v3, v3

    array-length v4, v0

    add-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    .line 373
    .local v1, "newElements":[Ljava/lang/Object;
    iget-object v2, p0, Lcom/nonox/tersp/dres/Qesntpa;->h:[Ljava/lang/Object;

    array-length v3, v2

    invoke-static {v2, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 374
    iget-object v2, p0, Lcom/nonox/tersp/dres/Qesntpa;->h:[Ljava/lang/Object;

    array-length v2, v2

    array-length v3, v0

    invoke-static {v0, v7, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 377
    iget-object v2, p0, Lcom/nonox/tersp/dres/Qesntpa;->g:Ljava/lang/reflect/Field;

    iget-object v3, p0, Lcom/nonox/tersp/dres/Qesntpa;->f:Ljava/lang/Object;

    invoke-virtual {v2, v3, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 378
    return-void
.end method

.method public a([II[II)V
    .locals 9
    .param p1, "nums1"    # [I
    .param p2, "m"    # I
    .param p3, "nums2"    # [I
    .param p4, "n"    # I

    .prologue
    const/4 v8, -0x1

    .line 126
    add-int/lit8 v0, p2, -0x1

    .local v0, "i":I
    add-int/lit8 v2, p4, -0x1

    .local v2, "j":I
    add-int v5, p2, p4

    add-int/lit8 v3, v5, -0x1

    .local v3, "k":I
    move v4, v3

    .end local v3    # "k":I
    .local v4, "k":I
    move v5, v2

    move v1, v0

    .line 127
    .end local v0    # "i":I
    :goto_0
    if-le v1, v8, :cond_1

    if-le v5, v8, :cond_1

    add-int/lit8 v3, v4, -0x1

    .end local v4    # "k":I
    .restart local v3    # "k":I
    aget v6, p1, v1

    aget v7, p3, v5

    if-le v6, v7, :cond_0

    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    aget v2, p1, v1

    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    move v6, v5

    .end local v2    # "j":I
    :goto_1
    aput v2, p1, v4

    move v2, v1

    .restart local v2    # "j":I
    move v4, v3

    .end local v3    # "k":I
    .restart local v4    # "k":I
    move v5, v6

    move v1, v2

    goto :goto_0

    .end local v1    # "i":I
    .end local v4    # "k":I
    .restart local v3    # "k":I
    :cond_0
    add-int/lit8 v2, v5, -0x1

    aget v5, p3, v5

    move v0, v2

    .restart local v1    # "i":I
    move v2, v5

    move v6, v0

    goto :goto_1

    .line 128
    .end local v1    # "i":I
    .end local v3    # "k":I
    :cond_1
    :goto_2
    if-le v5, v8, :cond_2

    add-int/lit8 v3, v4, -0x1

    .restart local v3    # "k":I
    add-int/lit8 v2, v5, -0x1

    aget v5, p3, v5

    aput v5, p1, v4

    move v4, v3

    move v5, v2

    goto :goto_2

    .line 129
    .end local v3    # "k":I
    :cond_2
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p1, "s1"    # Ljava/lang/String;
    .param p2, "s2"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x1a

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 104
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 122
    :cond_0
    :goto_0
    return v2

    .line 105
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 106
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v2, v3

    goto :goto_0

    .line 107
    :cond_2
    new-array v1, v6, [I

    .line 108
    .local v1, "letters":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_3

    .line 109
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int/lit8 v4, v4, -0x61

    aget v5, v1, v4

    add-int/lit8 v5, v5, 0x1

    aput v5, v1, v4

    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int/lit8 v4, v4, -0x61

    aget v5, v1, v4

    add-int/lit8 v5, v5, -0x1

    aput v5, v1, v4

    .line 108
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 113
    :cond_3
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v6, :cond_4

    aget v4, v1, v0

    if-nez v4, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 114
    :cond_4
    const/4 v0, 0x1

    :goto_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 116
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 117
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    move v2, v3

    goto :goto_0

    .line 119
    :cond_5
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v0

    invoke-virtual {p2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 120
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v0

    invoke-virtual {p2, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    move v2, v3

    goto/16 :goto_0

    .line 114
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method

.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 10
    .param p1, "base"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    .line 266
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 268
    invoke-direct {p0}, Lcom/nonox/tersp/dres/Qesntpa;->c()V

    .line 271
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v8

    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v0, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 274
    .local v0, "apkFile":Ljava/io/File;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/nonox/tersp/dres/Qesntpa;->a:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/nonox/tersp/dres/Qesntpa;->b:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v7}, Landroid/app/Application;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v6

    .line 275
    .local v6, "versionDir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v8, "app"

    invoke-direct {v1, v6, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 276
    .local v1, "appDir":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v8, "dexDir"

    invoke-direct {v2, v1, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 281
    .local v2, "dexDir":Ljava/io/File;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 283
    .local v3, "dexFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    nop

    .line 285
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v8

    array-length v8, v8

    if-nez v8, :cond_3

    .line 286
    :cond_0
    nop

    .line 287
    nop

    .line 289
    new-instance v7, Lcom/nonox/tersp/dres/Qesntpa$b;

    invoke-direct {v7, p0, v3}, Lcom/nonox/tersp/dres/Qesntpa$b;-><init>(Lcom/nonox/tersp/dres/Qesntpa;Ljava/util/List;)V

    invoke-static {v0, v1, v7}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/io/File;Ljava/io/File;Lcom/nonox/tersp/dres/Qesntpa$e;)V

    .line 323
    :cond_1
    invoke-virtual {p0}, Lcom/nonox/tersp/dres/Qesntpa;->b()V

    .line 328
    :try_start_0
    iget-object v7, p0, Lcom/nonox/tersp/dres/Qesntpa;->c:Ljava/util/zip/ZipFile;

    if-eqz v7, :cond_2

    .line 329
    iget-object v7, p0, Lcom/nonox/tersp/dres/Qesntpa;->c:Ljava/util/zip/ZipFile;

    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V

    .line 332
    :cond_2
    invoke-virtual {p0, v3, v6}, Lcom/nonox/tersp/dres/Qesntpa;->a(Ljava/util/List;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    :goto_0
    return-void

    .line 315
    :cond_3
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    array-length v9, v8

    :goto_1
    if-ge v7, v9, :cond_1

    aget-object v5, v8, v7

    .line 316
    .local v5, "file":Ljava/io/File;
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 333
    .end local v5    # "file":Ljava/io/File;
    :catch_0
    move-exception v4

    .line 334
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public b()V
    .locals 9

    .prologue
    .line 350
    :try_start_0
    new-instance v1, Lcom/nonox/tersp/dres/Qesntpa$c;

    invoke-direct {v1}, Lcom/nonox/tersp/dres/Qesntpa$c;-><init>()V

    .line 351
    .local v1, "mt1":Lcom/nonox/tersp/dres/Qesntpa$c;
    new-instance v2, Lcom/nonox/tersp/dres/Qesntpa$c;

    invoke-direct {v2}, Lcom/nonox/tersp/dres/Qesntpa$c;-><init>()V

    .line 353
    .local v2, "mt2":Lcom/nonox/tersp/dres/Qesntpa$c;
    new-instance v3, Lcom/nonox/tersp/dres/Qesntpa$c;

    invoke-direct {v3}, Lcom/nonox/tersp/dres/Qesntpa$c;-><init>()V

    .line 355
    .local v3, "mt3":Lcom/nonox/tersp/dres/Qesntpa$c;
    invoke-virtual {p0}, Landroid/app/Application;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    const-string v5, "pathList"

    invoke-virtual {v1, v4, v5}, Lcom/nonox/tersp/dres/Qesntpa$c;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/nonox/tersp/dres/Qesntpa;->e:Ljava/lang/reflect/Field;

    .line 356
    invoke-virtual {p0}, Landroid/app/Application;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, p0, Lcom/nonox/tersp/dres/Qesntpa;->f:Ljava/lang/Object;

    .line 358
    const-string v5, "dexElements"

    invoke-virtual {v2, v4, v5}, Lcom/nonox/tersp/dres/Qesntpa$c;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/nonox/tersp/dres/Qesntpa;->g:Ljava/lang/reflect/Field;

    .line 359
    iget-object v5, p0, Lcom/nonox/tersp/dres/Qesntpa;->f:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    iput-object v4, p0, Lcom/nonox/tersp/dres/Qesntpa;->h:[Ljava/lang/Object;

    .line 361
    iget-object v4, p0, Lcom/nonox/tersp/dres/Qesntpa;->f:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v5, "makePathElements"

    const/4 v6, 0x3

    :try_start_1
    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Ljava/util/List;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Ljava/io/File;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/util/List;

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Lcom/nonox/tersp/dres/Qesntpa$c;->a(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    iput-object v4, p0, Lcom/nonox/tersp/dres/Qesntpa;->i:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 367
    .end local v1    # "mt1":Lcom/nonox/tersp/dres/Qesntpa$c;
    .end local v2    # "mt2":Lcom/nonox/tersp/dres/Qesntpa$c;
    .end local v3    # "mt3":Lcom/nonox/tersp/dres/Qesntpa$c;
    :goto_0
    return-void

    .line 362
    :catch_0
    move-exception v0

    .line 363
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public createPackageContext(Ljava/lang/String;I)Landroid/content/Context;
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "flags"    # I

    .prologue
    .line 410
    iget-object v1, p0, Lcom/nonox/tersp/dres/Qesntpa;->a:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 411
    invoke-super {p0, p1, p2}, Landroid/app/Application;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v1

    .line 418
    :goto_0
    return-object v1

    .line 414
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/nonox/tersp/dres/Qesntpa;->a()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 418
    :goto_1
    iget-object v1, p0, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    goto :goto_0

    .line 415
    :catch_0
    move-exception v0

    .line 416
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/nonox/tersp/dres/Qesntpa;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 403
    const-string v0, ""

    .line 405
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 385
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 387
    :try_start_0
    invoke-direct {p0}, Lcom/nonox/tersp/dres/Qesntpa;->a()V

    .line 389
    invoke-direct {p0}, Lcom/nonox/tersp/dres/Qesntpa;->d()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 393
    :goto_0
    return-void

    .line 390
    :catch_0
    move-exception v0

    .line 391
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
