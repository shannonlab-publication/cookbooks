# cookbooks

## ミドルウェアのインストール
```bash
root@server# cd /var/chef/
root@server# git clone https://github.com/shannonlab-publication/cookbooks.git
root@server# chef-solo -o base
root@server# chef-solo -o Python-3.5.2
root@server# chef-solo -o httpd
root@server# chef-solo -o redis-2.8.17
```

## パスの追加
```bash
root@server# su - dev
dev@server$ vi .bash_profile
[変更前]PATH=$PATH:$HOME/bin
[変更後]PATH=/usr/local/Python-3.5.2/bin:$PATH:$HOME/bin
```


## 設定ファイルのパス

### httpd
`/etc/httpd/conf`

`/etc/httpd/conf.d`

### redis
`/usr/local/redis-2.8.17/conf/6379.conf`

## サービスの起動
### httpd

`dev@server$ sudo /etc/init.d/httpd start`

### redis

`dev@server$ sudo /etc/init.d/redis start`
