# centos install script

## proxy

代理是比较重要的，自行判断当前环境是否需要配置代理。

如果需要配置代理，自行修改`proxy.sh`脚本中代理地址。

然后执行

```c
source proxy.sh
```

## color.sh

这个是脚本中要用到颜色，自行导入即可。范例: `:-r color.sh`

```bash
#!/bin/env bash
COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[0;33m'
COLOR_NC='\033[0m'

echo -e "${COLOR_GREEN}This is green text.${COLOR_NC}"
```
