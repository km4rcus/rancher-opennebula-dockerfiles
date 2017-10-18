# ** WORK IN PROGRESS **

Dockerfiles to build images for deploying **OpenNebula Frontend** components as a **Rancher Stack** ( [link OpenNebula Catalog!](http://github.com/km4rcus/opennebula-catalog))

Change specific values of %%REPO%%/%%TAG%% and %%OS%% in `render_template.sh` *(debian and centos Dockerfiles will be added soon)*

Generate `docker-compose.yml` by running
```bash
./render_template.sh docker-compose.template.yml`
```

For building OpenNebula docker images
```bash
docker-compose build
```
