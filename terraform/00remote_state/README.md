remote state
==================

https://www.terraform.io/docs/state/remote.html  
https://www.terraform.io/docs/backends/types/s3.html  


state情報をremoteに保存するし、それを参照することで作業環境の差異なく一元管理ができるようになる。複数人で作業する場合は有効である。  
backend typeは複数種類があるがs3を想定する。  
s3の作成をterraformで行うが、remote_stateのために作成するs3のstateはremoteを利用はできないので、このresourceのみはremote_stateの管理外となる。

