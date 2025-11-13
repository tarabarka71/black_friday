# pymongo-api

## Как запустить


```shell
docker compose up -d
```

Последовательно запустить скрипты:

```shell
./scripts/1.sh
```
```shell
./scripts/2.sh
```
```shell
./scripts/3.sh
```
```shell
./scripts/4.sh
```
```shell
./scripts/5.sh
```

## Как проверить

Откройте в браузере http://localhost:8080
Для проверки кеширования выполнить команду:
```shell
time curl -s http://localhost:8080/helloDoc/users
```
Первый запрос выполняется ~1сек, второй 0.01сек.
