### Supported tags and respective Dockerfile links

* **3.0-superclassic, latest** [Dockerfile](https://github.com/vvhq/docker-firebird/blob/master/Dockerfile)
* **3.0-super** [3.0-super/Dockerfile](https://github.com/vvhq/docker-firebird/blob/3.0-super/Dockerfile)
* **2.5-superclassic** [2.5-superclassic/Dockerfile](https://github.com/vvhq/docker-firebird/blob/2.5-superclassic/Dockerfile)
* **2.5-super** [2.5-super/Dockerfile](https://github.com/vvhq/docker-firebird/blob/2.5-super/Dockerfile)

### Volumes

* **Firebird 3.0**
 - /var/lib/firebird/3.0/data
 - /var/lib/firebird/3.0/backup
 - /var/log/firebird
* **Firebird 2.5**
 - /var/lib/firebird/2.5/data
 - /var/lib/firebird/2.5/backup
 - /var/log/firebird

### Exposed Ports

* 3050

### Environment variables

* FIREBIRD_PASSWORD *(optional)*

### Default Firebird credentials

* **Username:** SYSDBA
* **Password:** masterkey

### Set a SYDBA password

The default password for **SYDBA** is **masterkey**. You may pass the environment variable **FIREBIRD_PASSWORD** to set the default password.

### Samples

#### Simple (Firebird latest)

```bash
docker run -d --name firebird -p 3050:3050 vvhq/firebird:latest
```

#### Complex (Firebird 3.0)

```bash
docker run -d \
  --name firebird3.0 \
  -e FIREBIRD_PASSWORD='YOUR_SYSDBA_PASSWORD' \
  -p 3050:3050 \
  -v /my-docker-volumes/data/:/var/lib/firebird/3.0/data/ \
  -v /my-docker-volumes/backup/:/var/lib/firebird/3.0/backup/ \
  -v /my-docker-volumes/log/:/var/log/firebird/ \
  vvhq/firebird:3.0-superclassic
```

#### Complex (Firebird 2.5)

```bash
docker run -d \
  --name firebird2.5 \
  -e FIREBIRD_PASSWORD='YOUR_SYSDBA_PASSWORD' \
  -p 3050:3050 \
  -v /my-docker-volumes/data/:/var/lib/firebird/2.5/data/ \
  -v /my-docker-volumes/backup/:/var/lib/firebird/2.5/backup/ \
  -v /my-docker-volumes/log/:/var/log/firebird/ \
  vvhq/firebird:2.5-superclassic
```
