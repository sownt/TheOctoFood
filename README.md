# TheOctoFood - Django Food Order Project
## Deployment Guides
Clone this repo
```
git clone https://github.com/sownt/TheOctoFood.git && cd TheOctoFood
```
### 1. Deploy with virtual environment
Create a virtual environment
```
python -m venv .
```
Activate it
```
Scripts\activate.bat    # Windows
source bin/activate     # Linux
```
Install required packages
```
pip install -r requirement.txt
```
Create `.env` file at /src/TheOctoFood/ to set environment variables
```
SECRET_KEY=
DATABASE_ENGINE=django.db.backends.mysql
DATABASE_NAME=theoctofood
DATABASE_USER=
DATABASE_PASSWORD=
DATABASE_HOST=
DATABASE_PORT=3306
LANGUAGE_CODE=en-us
TIME_ZONE=Asia/Ho_Chi_Minh
EMAIL_HOST=
EMAIL_HOST_USER=
EMAIL_HOST_PASSWORD=
EMAIL_PORT=
```
Migrate and run
```
python manage.py migrate && python manage.py runserver 0.0.0.0:8000
```
### 2. Depley with Docker compose
Create `.env` file at /src/TheOctoFood/ to set environment variables
```
SECRET_KEY=
DATABASE_ENGINE=django.db.backends.mysql
DATABASE_NAME=theoctofood
DATABASE_USER=
DATABASE_PASSWORD=
DATABASE_HOST=
DATABASE_PORT=3306
LANGUAGE_CODE=en-us
TIME_ZONE=Asia/Ho_Chi_Minh
EMAIL_HOST=
EMAIL_HOST_USER=
EMAIL_HOST_PASSWORD=
EMAIL_PORT=
```
Run
```
docker-compose up
```