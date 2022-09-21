#  Manjaro +i3安装配置教程，参考B站TheCW视频

1. 换源(清华镜像源)

   >  sudo nano /etc/pacman.conf
   >
   > ​	在最末位加上 :
   >
   > ​	[archlinuxcn]
   >
   > SigLevel = Never
   >
   > Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
   >
   > 保存退出
   >
   > 在输入 sudo pacman-mirrors -c China
   >
   > 最后输入 sudo pacman -Syyu / sudo pacman -Syy进行更新

2. 配置pacman颜色高亮

   > sudo -E vim /etc/pacman.conf
   >
   > 取消36行的color注释
   >
   > sudo pacman -Syy
   >
   > 删除软件
   >
   > sudo pacman -Rns 程序名
   >
   >  还可以下载两个包管理器下载pacman不能下载的软件
   >
   > Sudo pacman -S yay
   >
   > sudo pacman -S yaourt

3. 更换shell，从bash改为fish

   >  (1) 安装fish
   >
   > sudo pacman -S fish
   >
   > (2) 更改fish，使其替换bash 
   >
   > chsh -s /usr/bin/fish
   >
   > (3)  安装oh-my-fish
   >
   > curl -L https://get.oh-my.fish | fish
   >
   > (4) 如果下载出错，则需要更改hosts文件
   >
   >  sudo vim /etc/hosts
   >
   > 在最末位加入
   >
   > #Github Start
   >
   > 151.101.64.133 raw.githubusercontent.com
   >
   > #Github End
   >
   > (5) 更改fish主题配色等
   >
   > fish _config
   >
   >  (6)  配置oh-my-fish
   >
   > omf install ays

4. 使用alias保存终端快捷键

   > alias c clear
   >
   > funcsave  c
   >
   > alias ls “ls -la”
   >
   > funcsave l
   >
   > alias sudo “sudo -E”
   >
   > funcsave sudo

5. 配置i3

   >(1) 安装i3
   >
   >sudo pacman -S i3-manjaro
   >
   >(2) reboot重启，界面点击小齿轮选择i3登入
   >
   >(3) 进入i3，选择win键作为i3的super键，super +Enter打开终端
   >
   > (4) vim  /home/.Xresources
   >
   >​	在文件中输入Xft.dpi: 200
   >
   >​	sudo xrdb /home/Xresources
   >
   >后重启
   >
   > (5) i3常规操作
   >
   >super + 1/2/3/4/5.. 在不同桌面之间切换
   >
   >super + f 进入全屏
   >
   >super  + v 垂直分割窗口
   >
   >super + up/down/left/right 窗口之间切换 
   >
   >super + q 退出当前窗口
   >
   > (6) 更换终端
   >
   > sudo pacman -S alacritty
   >
   > sudo pacman -S dmenu （i3指令 : super + d）
   >
   >(7) 更改i3配置文件
   >
   >vim /home/.config/i3/config
   >
   >更改终端: bindsym $mod+return exec alacritty
   >
   >快速启动: bindsym $mod+c exec chromium
   >
   >自动启动: exec_always  程序名
   >
   >关闭窗口边框 :  new_window 1pixel
   >
   >更改其他默认键位。。。。。resize等
   >
   > 刷新i3  : super + shift + c
   >
   >vim /home/.config/alacritty/alacritty.yml
   >
   >更改point size : 10 

   6 . 美化

    >(1)  桌面背景
    >
    >sudo pacman -S feh
    >
    >sudo pacman -S variety
    >
    >(2) 终端半透明
    >
    >vim /home/.config/alacritty/alacritty.yml
    >
    > Background_opacity: 0.6 
    >
    >sudo pacman -S compton
    >
    >进入i3配置文件
    >
    >exec_always variety
    >
    >exec_always compton
    >
    >(3) 窗口留边框
    >
    >vim /home/.config/i3/config
    >
    >gaps inner 15

7. 安装中文输入法

   > sudo pacman -S fcitx fcitx-im fcitx-configtool
   >
   > sudo pacman -S fcitx-sougoupingyin
   >
   > Vim /home/.xprofile
   >
   > export GTK_IM_MODULE=fcitx
   >
   > Export QT_IM_MODULE=fcitx
   >
   > export XMODIFIERS=“@im=fcitx”

8. 常用软件

   >sudo pacman -S ranger
   >
   >sudo pacman -S tmux
   >
   >sudo pacman -S net ease-cloud-music
   >
   >sudo pacman -S deepen-screenshot
   >
   >sudo pacman -S google-chrome
   >
   >yay -S motrix 下载工具
   >
   >yay -S xdman
   >
   >安装cider播放器,联动apple music
   >sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
   >flatpak install flathub sh.cider.Cider
   >
   >yay -S clash-for-windows-bin 更改系统网络代理，将所有改为127.0.0.1，端口自定义，但要和clash中一致
   >
   >sudo pacman -S typora
   >
   >yay -S ttf-wps-fonts wps-office-mui-zh-cn wps-office-mime-cn wps-office-cn ttf-ms-fonts 安装wps
   >
   >sudo pacman -S vlc
   >
   >sudo pacman -S timeshift
   >
   >安装微信
   >sudo pacman -S yay base-devel
   >yay -S wechat-uos
   >
   >神器albert
   >yay -S albert


9. 蓝牙连接问题

   > (1) 安装blueman
   >
   > sudo pacman -S bluesman
   >
   > - `blueman-manager` 可以选择连接蓝牙设备
   >
   > - `blueman-adapters` 可以修改蓝牙名等本机蓝牙设置
   >
   >   但是，刚装好系统时，我尝试连接蓝牙耳机，一直提示错误：
   >
   >   > Bluetooth: “protocol not available”
   >
   >   查询后按照[这里](https://bbs.archlinux.org/viewtopic.php?id=222083)的解决方案解决了该问题：
   >
   >   1. 安装 pulseaudio-bluetooth: `sudo pacman -S pulseaudio-bluetooth`
   >   2. 编辑`/etc/bluetooth/main.conf`文件，在该文件`[General]`项后添加一行`Enable=Source,Sink,Media,Socket`
   >   3. 重启

10. 网络连接

    > 使用命令 nmtui

11. 安装百度网盘问题

    > yaourt -S debtap
    >
    > 去官网下载deb格式的客户端软件，解包成pacman格式
    >
    > sudo debate -u
    >
    > sudo debtap baidunetdisk.deb 
    >
    > 在用pacman安装
    >
    > sudo pacman -U baidunetdisk.pkg.tar.zst

11. 配置ranger

    > (1) 复制ranger配置文件
    >
    > ranger --copy-config=all
    >
    > 其中rc.conf是主要的快捷键控制插件
    >
    > (2) 设置全局变量禁用默认配置
    >
    > fish下： set -g -x RANGER_LOAD_DEFAULT FALSE
    >
    > (3) 安装nerdfontsgit clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
    > cd nerd-fonts 
    > ./install.sh
    > cd ..
    > rm -rf nerd-fonts(4) 安装插件
    >
    > 1、图标插件
    >
    > git clone https://github.com/cdump/ranger-devicons2       ~/.config/ranger/plugins/devicons2
    > 添加/更改default_linemode devicons2 到 ~/.config/ranger/rc.conf
    >
    > 2、预览文件(只要安装一个就可以)
    >
    > > 预览网页： sudo apt-get install lynx/elinks/w3m
    > >
    > > 高亮代码： sudo apt-get install highlight / pip install pygmentize
    > >
    > > 预览图片： sudo apt-get install caca-utils
    > >
    > > 在更改rc.conf中：set preview_images true
    > >
    > > ​							set preview_images_method ueberzug
    > >
    > > 压缩包：  sudo apt-get install atool / libarchive-tools / unrar / p7zip
    > >
    > > 预览pdf： sudo apt-get install poppler-utils / mupdf-tools
    > >
    > > 预览媒体： sudo apt-get install mediainfo / libimage-exiftool-perl
    > >
    > > 预览视频缩略图： sudo apt-get install ffmpegthumbnailer
    > >
    > > 再将scope.sh中下面注释部分img、pdf、fonts、preview全都还原
    > >
    > > 字体：  sudo apt-get install fontforge
    > >
    > > 种子：  sudo apt-get install transmission-cli
    >
    > 3. 安装主题
    >
    >    先将colorscheme文件夹拷贝到ranger中
    >
    >    再更改如此rc.conf 
    >
    >    set colorscheme jungle

