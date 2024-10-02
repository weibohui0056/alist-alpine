# Alist Alpine一键安装脚本

此脚本可在任意基于 Alpine 的x86架构的 VPS 上安装 **Alist**，只需一行命令即可自动完成所有步骤，包括下载依赖、配置 **supervisor** 并启动 **Alist** 服务。

## 特性
- **一键安装**：只需一行命令，即可全自动完成安装过程。
- **Supervisor 集成**：确保 **Alist** 作为后台服务运行，并在故障时自动重启。
- **为 Alpine 优化**：专为 Alpine 系统设计，保证安装过程轻量快捷。

## 前提条件
- 一个基于 Alpine 的x86架构的 VPS（或任何使用 `apk` 包管理器的系统）。
- 需要安装 `wget` （通常默认已安装）。

## 安装方法

要通过此脚本安装 **Alist**，请在 VPS 终端中运行以下命令：

```bash
wget -qO- https://raw.githubusercontent.com/weibohui0056/alist-alpine/refs/heads/main/alpine-alist.sh | sh
