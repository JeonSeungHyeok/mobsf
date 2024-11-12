.class Lcom/nonox/tersp/dres/Qesntpa$f;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nonox/tersp/dres/Qesntpa;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "f"
.end annotation


# instance fields
.field final synthetic a:Lcom/nonox/tersp/dres/Qesntpa;


# direct methods
.method constructor <init>(Lcom/nonox/tersp/dres/Qesntpa;)V
    .locals 0
    .param p1, "this$0"    # Lcom/nonox/tersp/dres/Qesntpa;

    .prologue
    .line 243
    iput-object p1, p0, Lcom/nonox/tersp/dres/Qesntpa$f;->a:Lcom/nonox/tersp/dres/Qesntpa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .prologue
    .line 246
    iget-object v3, p0, Lcom/nonox/tersp/dres/Qesntpa$f;->a:Lcom/nonox/tersp/dres/Qesntpa;

    iget-object v3, v3, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 248
    .local v0, "clazz":Ljava/lang/Class;
    const-string v3, "onCreate"

    const/4 v4, 0x0

    :try_start_0
    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 249
    .local v2, "method":Ljava/lang/reflect/Method;
    iget-object v3, p0, Lcom/nonox/tersp/dres/Qesntpa$f;->a:Lcom/nonox/tersp/dres/Qesntpa;

    iget-object v3, v3, Lcom/nonox/tersp/dres/Qesntpa;->n:Landroid/app/Application;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    nop

    .line 253
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 250
    :catch_0
    move-exception v1

    .line 251
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
