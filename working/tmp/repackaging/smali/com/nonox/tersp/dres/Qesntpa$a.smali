.class Lcom/nonox/tersp/dres/Qesntpa$a;
.super Landroid/os/Handler;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nonox/tersp/dres/Qesntpa;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nonox/tersp/dres/Qesntpa;


# direct methods
.method constructor <init>(Lcom/nonox/tersp/dres/Qesntpa;)V
    .locals 0
    .param p1, "this$0"    # Lcom/nonox/tersp/dres/Qesntpa;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/nonox/tersp/dres/Qesntpa$a;->a:Lcom/nonox/tersp/dres/Qesntpa;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "m"    # Landroid/os/Message;

    .prologue
    .line 239
    new-instance v0, Lcom/nonox/tersp/dres/Qesntpa$f;

    iget-object v1, p0, Lcom/nonox/tersp/dres/Qesntpa$a;->a:Lcom/nonox/tersp/dres/Qesntpa;

    invoke-direct {v0, v1}, Lcom/nonox/tersp/dres/Qesntpa$f;-><init>(Lcom/nonox/tersp/dres/Qesntpa;)V

    invoke-virtual {v0}, Lcom/nonox/tersp/dres/Qesntpa$f;->a()V

    .line 240
    return-void
.end method
