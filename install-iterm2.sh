#!/bin/bash
echo 正在安装homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 安装ohmyzsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo 刷新环境变量
source ~/.zshrc

echo 将homebrew替换为国内源
# 替换 Homebrew
git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
# 替换 Homebrew Core
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
# 替换 Homebrew Cask
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
# 替换 Homebrew-bottles
# 对于 zsh 用户：
echo "export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles" >> ~/.zshrc

echo 刷新环境变量
source ~/.zshrc

# 安装iterm2
echo 安装iterm2
brew cask install iterm2

# 安装starship
echo 安装starship
brew install starship
echo "eval \"\$(starship init zsh)\"" >> ~/.zshrc
echo 刷新环境变量
source ~/.zshrc

# 安装lrzsz
echo 安装lrzsz
brew install lrzsz

#安装字体
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
#brew cask install font-jetbrainsmono-nerd-font

echo 安装ohmyzsh插件git-open
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
echo 安装ohmyzsh插件zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo 安装ohmyzsh插件zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


echo 开始下载zmodem脚本
mkdir -p ～/.iterm2/zmodem
cd ～/.iterm2/zmodem
curl -fsSLO https://raw.githubusercontent.com/KingFalse/ohmyiterm2/master/iterm2-recv-zmodem.sh
curl -fsSLO https://raw.githubusercontent.com/KingFalse/ohmyiterm2/master/iterm2-send-zmodem.sh
chmod -R +x ～/.iterm2

echo 安装iTerm2 Utilities
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash


# 修改配置文件
echo 开始下载iterm2配置文件
IVER=`defaults read /Applications/iTerm.app/Contents/Info.plist CFBundleShortVersionString`
curl -fsSL -o ~/Library/Preferences/com.googlecode.iterm2.plist https://raw.githubusercontent.com/KingFalse/ohmyiterm2/master/com.googlecode.iterm2-$IVER.plist



echo "==========================="
echo "==========================="
echo "==========================="
echo "==========================="
echo "==========================="
echo "==========================="
echo "==========================="
echo "==========================="