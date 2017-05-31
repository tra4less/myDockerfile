# [Flask](http://flask.pocoo.org/) (with Python 2.7 or 3.6) runing with [Guncorn](http://gunicorn.org/)

[![](https://images.microbadger.com/badges/image/n0trace/gunicorn-flask.svg)](https://microbadger.com/images/n0trace/gunicorn-flask "Get your own image badge on microbadger.com")


## Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/gunicorn-flask.svg)](https://microbadger.com/images/n0trace/gunicorn-flask "Get your own version badge on microbadger.com") flask running on python 3.5
* [![](https://images.microbadger.com/badges/version/n0trace/gunicorn-flask.svg)](https://microbadger.com/images/n0trace/gunicorn-flask "Get your own version badge on microbadger.com") flask running on python 2.7

---
This image is used to run flask applications. To start a container use

```
docker run --name flaskapp --restart=always \
	-p 8000:8000 \
	-v /path/to/app/:/app \
	-d n0trace/gunicorn-flask
```

`-v /path/to/app/:/app` - specifies the path to the folder containing a file named app.py, which should be your main application

`-p 8000:8000` - the image exposes port 8000, in this example it is mapped to port 8000 on the host

---
## Installing additional python or flask packages
This image comes with a basic set of python packages and the basic flask and python-pip installation.

If you need any non-default python or flask packages, the container will install them on its first run using python pip and a requirements.txt file. Save a requirements.txt file in the root folder of your app, which is mounted to the /app folder of the container. The format of the file is described in the [pip documentation](https://pip.readthedocs.org/en/1.1/requirements.html#requirements-file-format). After that you can create a new container with the above docker command. The entrypoint script will take care of the package installation listed in the requirements file.

If an additional package is needed during runtime of the container it can be installed with following command.

```
docker exec YOUR_CONTAINER_ID/NAME /bin/bash -c "pip install package-name"
```
