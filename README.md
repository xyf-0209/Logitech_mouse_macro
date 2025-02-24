<div align="center">

 **罗技G系列鼠标宏lua脚本** 

------

<p align="center">
  <a href="#更新记录">更新记录</a> •
  <a href="#概述">概述</a> •
  <a href="#下载与安装">下载与安装</a> •
  <a href="#注意事项">注意事项</a> •
  <a href="#特别说明">特别说明</a> •
</p>

</div>


## 更新记录

- 8月 2023: 基于作者的思路，对其脚本进行了一些优化包括：修改了随机种子、修改了开关按键、优化了部分流程。


## 概述

**注意: 罗技鼠标的键位编号图可自行至商家处索要**

本脚本的主要功能：通过`右ctrl+鼠标右键`快捷键实现宏的开启或关闭（默认为开启状态）。在宏开启状态下可按鼠标的4号键位调用炼狱的模拟压枪方法，若需设置其他键位可自行调整`sprayControlKey`的值。


## 下载与安装

**注意: 测试使用的是`Logitech G HUB 2023.6.430723`版本，建议将软件更新至此或以上版本。**

### 下载

#### 手动下载

页面右侧Releases处选择CF_Macro下载。

#### 使用Git

从github克隆仓库:

```shell
git clone https://github.com/xyf-0209/Logitech_mouse_macro.git
```

### 安装

菜单栏选择游戏与应用程序 -> 选择桌面 -> 配置文件 -> 编写脚本（详情右边） -> 创建新LUA脚本 -> 菜单栏选择脚本 -> 导入 -> 选择CF_Macro.lua文件 -> 菜单栏选择脚本 -> 
保存并运行 -> 确认激活LUA脚本处是你导入的lua脚本

## 注意事项

1.  需要以管理员模式运行`Logitech G HUB`。
2.  不要开启板载内存模式，该模式目前已无法写入宏操作。
3.  请勿用于排位与人机。

## 联系我
1. 邮箱：yifanxu@petalmail.com
2. [个人网站](https://www.xuyifan.top/)

## 特别说明

1.  本脚本基于[Afool4U](https://github.com/Afool4U)发布的[Logi_purgatory_macro](https://github.com/Afool4U/Logi_purgatory_macro#%E7%96%91%E9%9A%BE%E6%9D%82%E7%97%87)
