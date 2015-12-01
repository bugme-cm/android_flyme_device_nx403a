.class public final Landroid/suda/location/PhoneLocation;
.super Ljava/lang/Object;
.source "PhoneLocation.java"


# static fields
.field private static LIBPATH:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-string/jumbo v0, "suda-phoneloc-jni"

    sput-object v0, Landroid/suda/location/PhoneLocation;->LIBPATH:Ljava/lang/String;

    .line 30
    sget-object v0, Landroid/suda/location/PhoneLocation;->LIBPATH:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static declared-synchronized doGetLocationFromPhone(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 36
    const-class v1, Landroid/suda/location/PhoneLocation;

    monitor-enter v1

    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 37
    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    invoke-static {p0}, Landroid/suda/location/PhoneLocation;->getPhoneLocationJni(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getCityFromPhone(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, ""

    .line 77
    :cond_0
    :goto_0
    return-object v0

    .line 73
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/suda/location/PhoneLocation;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 74
    const-string/jumbo v0, "\u4eb2\u60c5\u53f7\u7801"

    .line 77
    .local v0, "phoneLocation":Ljava/lang/String;
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, ""

    goto :goto_0

    .line 75
    .end local v0    # "phoneLocation":Ljava/lang/String;
    :cond_2
    const-string v1, "(?:-| )"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroid/suda/location/PhoneLocation;->getPosFromPhone(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "phoneLocation":Ljava/lang/String;
    goto :goto_1
.end method

.method public static getCodeFromPhone(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/suda/location/PhoneLocation;->getPosFromPhone(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static native getPhoneLocationJni(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static getPosFromPhone(Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "i"    # I

    .prologue
    .line 41
    invoke-static {p0}, Landroid/suda/location/PhoneLocation;->doGetLocationFromPhone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "s":Ljava/lang/String;
    const/4 v1, 0x0

    .line 43
    .local v1, "ss":[Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 44
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 45
    array-length v2, v1

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    aget-object v2, v1, p1

    .line 47
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static isFamily(Ljava/lang/String;)Z
    .locals 8
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 53
    const/16 v6, 0xa

    new-array v2, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "760"

    aput-object v7, v2, v6

    const/4 v6, 0x1

    const-string v7, "761"

    aput-object v7, v2, v6

    const/4 v6, 0x2

    const-string v7, "762"

    aput-object v7, v2, v6

    const/4 v6, 0x3

    const-string v7, "763"

    aput-object v7, v2, v6

    const/4 v6, 0x4

    const-string v7, "764"

    aput-object v7, v2, v6

    const/4 v6, 0x5

    const-string v7, "765"

    aput-object v7, v2, v6

    const/4 v6, 0x6

    const-string v7, "766"

    aput-object v7, v2, v6

    const/4 v6, 0x7

    const-string v7, "767"

    aput-object v7, v2, v6

    const/16 v6, 0x8

    const-string v7, "768"

    aput-object v7, v2, v6

    const/16 v6, 0x9

    const-string v7, "769"

    aput-object v7, v2, v6

    .line 56
    .local v2, "familyArray":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 57
    .local v1, "bResult":Z
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .line 58
    .local v5, "temp":Ljava/lang/String;
    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 59
    const/4 v1, 0x1

    .line 63
    .end local v5    # "temp":Ljava/lang/String;
    :cond_0
    return v1

    .line 57
    .restart local v5    # "temp":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method
