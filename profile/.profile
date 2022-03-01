# add ~/.local/bin to PATH
export PATH=$PATH:$HOME/.local/bin


# specify editor
export EDITOR="nvim"


# golang
export GOROOT=$HOME/applications/go
export GOPATH=$HOME/source/go

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


# rust
source "$HOME/.cargo/env"


# java
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH

# flutter
export PATH=$PATH:$HOME/applications/flutter/bin
export CHROME_EXECUTABLE=/usr/bin/microsoft-edge-stable

# android
export ANDROID_SDK_ROOT=$HOME/applications/android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator

# google cloud
export CLOUDSDK_PYTHON="/usr/bin/python2"
