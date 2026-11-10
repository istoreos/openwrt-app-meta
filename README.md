# OpenWRT应用程序元数据

## 目录结构

* `applications`
    * `app-meta-*`
        * `Makefile` - 描述文件，参考下文约定
        * `logo.png` - 图标文件，目前只支持png。注意上传图标分辨率不要超过 256x256，文件大小不要超过 50KB（尝试 https://tinypng.com/ 压缩）
        * `config.sh` - [自动配置脚本](#自动配置脚本)
* `fake-top` - 辅助文件，无需关注
* `Makefile` - 辅助文件，无需关注
* `meta.mk` - 辅助文件，无需关注

## Makefile书写约定

1. `META_TITLE:=` 使用官方名称，如果有中文就用中文
2. `META_DESCRIPTION:=` 中文描述
3. `META_AUTHOR:=` 是作者名称，如果是非个人作者则填组织或者公司名称
4. `META_DEPENDS:=` 的第一个应该是能代表这个APP的主包，方便作为版本更新的依据，不要将其他插件可能依赖的包加到这里，以免卸载时将其他插件也卸载了，如果需要添加额外的包，参考下面的[#依赖额外的包](#依赖额外的包)
5. `META_ARCH:=` 用来填写支持的处理器架构，如果是架构无关的应用或者OpenWRT官方仓库支持的软件包则不需要这一行。如果有多个架构用空格隔开，例如`x86_64 aarch64`。目前可能的取值有`x86_64`，`x86`，`aarch64`，`arm`
6. `PKG_VERSION:=` 版本号，尽量跟主包保持一致
7. `PKG_RELEASE:=` 元数据修正版本，必须是数字，可以使用 `1`，`2`，`3` 或者日期如 `20240314`。在版本号 `PKG_VERSION` 未变更的情况下可以通过提升 `PKG_RELEASE` 来产生更新。
8. `META_WEBSITE:=` 官网链接（注意如果链接包含#，需要转义成\\#）
9. `META_TUTORIAL:=` 教程链接（注意如果链接包含#，需要转义成\\#）
10. `META_AUTOCONF:=` 用来配合[自动配置脚本](#自动配置脚本)，这里填写支持的自动配置参数，如果不支持自动配置请勿包含这一行。如果有多个配置参数用空格隔开，例如`path enable`。目前可能的取值有`path`（配置/数据路径），`enable`（安装完立即启动）
11. `META_UCI:=` 插件的主要UCI配置文件名，用来检查插件是否已经被手动/自动配置过。填写文件名即可，例如`aria2`。目前仅用于判断是否需要自动配置，如果不支持自动配置无需包含这一行

### 国际化
1. `META_TITLE.en:=` 英文名称，如果跟`META_TITLE`一样就不用填
2. `META_DESCRIPTION.en:=` 英文描述

## 依赖额外的包
由于 iStore 卸载插件的时候会将`META_DEPENDS`列表里的软件包都卸载，所以不能将其他插件共同依赖的软件包加到列表里。一般情况下，插件的主包就已经依赖需要的软件包了，不用再写到`META_DEPENDS`中。如果某些软件包没被主包依赖，又希望安装，那么参考下面的步骤：

1. 编辑`dummy/Makefile`，添加一行`$(eval $(call DummyPackage,插件名-deps,+额外依赖,,0.00))`，例如`serverchan`添加额外的`+iputils-arping +curl +jq`依赖：
    ```Makefile
    $(eval $(call DummyPackage,serverchan-deps,+iputils-arping +curl +jq,,0.00))
    ```
2. 在之前的`Makefile`的`META_DEPENDS:=`位置添加`+插件名-deps`，例如`serverchan`：
    ```Makefile
    META_DEPENDS:=+luci-app-serverchan +serverchan-deps
    ```

**注意：如果插件依赖 Docker ，请使用`META_DEPENDS:=+docker-deps`**

## 自动配置脚本
自动配置插件的脚本，由iStore或其他插件在此插件安装完以后根据用户选择调用。调用时会传入以下环境变量：

| 变量 | 说明 | 必须 |
| --- | --- | --- |
| ISTORE_CONF_DIR | 配置文件保存路径，例如`/mnt/nvme/Configs` | 是 |
| ISTORE_CACHE_DIR | 缓存/临时文件保存路径，例如`/mnt/nvme/Caches` | 是 |
| ISTORE_PUBLIC_DIR | 公共文件夹，例如`/mnt/nvme/Public` | 是 |
| ISTORE_DL_DIR | 下载文件保存路径，例如`/mnt/nvme/Public/Downloads` | 是 |
| ISTORE_DONT_START | 自动配置以后不启用插件，取值1或空 | 否 |


# 在线提交流程

**以下操作都在github上进行**

## 准备工作

1. Fork 本项目，如果之前Fork过，那先删掉自己的项目重新Fork

## 修改元数据

1. 切换到 `main` 分支
2. 同步上游仓库：点击 `Fetch upstream`，再点击 `Fetch and merge` 即可，这一步如有疑问请参考[官方文档](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks/syncing-a-fork#syncing-a-fork-from-the-web-ui) 
3. 创建PR用的临时分支：切换到 `main` 分支，点击分支下拉菜单，在输入框输入新分支的名称（也就是不存在的分支名称），例如 `add_app_jellyfin` ，搜索结果会变成 `Create branch: *** from 'main'` ，点这个搜索结果，稍等会自动创建并切换到新分支
4. 在新分支中进行更改，完成以后提交PR
5. 等PR合并以后，可以在 `branches` 页面删除临时分支，也可以保留临时分支，但是不要再进行变更和PR

## 应用注册归属

本仓库只提供软件中心元数据、软件中心图标和依赖。应用清单与注册链接由对应运行包或已有 LuCI 包持有，统一安装到 `/usr/share/linkease/apps.d`，不在 `app-meta-*` 的 root 中重复安装。

统一规范位于工作区 `istoreos-app-hub/docs/architecture/linkease-app-registration.md`。迁移后的 DDNSTO 由 luci-app-ddnsto 持有清单和应用图标；FastNet 由 fastnet 运行包持有。元包保留原有 `META_DEPENDS:=+包名` 普通依赖，不新增最低版本约束，不修改共享 meta.mk 或 CI。

先发布实际插件的新版本，用户更新相关插件后，由插件自身完成注册迁移。只升级元包不代表设备上的全部插件已迁移；宿主切换到只读新注册目录前，应在目标设备上完成相关插件更新。
