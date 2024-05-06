from contextlib import contextmanager
from flask import Flask, request, render_template, redirect
import psycopg2
import os

app = Flask(__name__)
conn = psycopg2.connect(os.environ['DATABASE_URL'])
database_name = "homework1_test"

@contextmanager
def get_db_cursor(commit=False):
    cursor = conn.cursor()
    try:
        yield cursor
        if commit:
            conn.commit()
    finally:
        cursor.close()

@app.route("/", methods=['GET'])
def home():
    return render_template('home.html')

@app.route("/survey", methods=['GET'])
def survey():
    return render_template('survey.html')

@app.route("/api/results", methods=['GET'])
def results():
    with get_db_cursor() as curs:
        if request.args.get('reverse') == "true":
            curs.execute(f"SELECT * FROM {database_name} ORDER BY id desc")
        else:
            curs.execute(f"SELECT * FROM {database_name}")
        res = curs.fetchall();
    return res

@app.route("/api/postSurvey", methods=['POST'])
def postSurvey():
    print("recieved:\n")
    recieved = {}

    recieved["crednumber"] = request.form.get("crednumber")
    recieved["password"] = request.form.get("password")
    recieved["socclass"] = request.form.get("soclass")
    recieved["robot"] = request.form.get("robot")
    recieved["name"] = request.form.get("name")
    print(recieved)

    with get_db_cursor(True) as curs:
        curs.execute(f"INSERT INTO {database_name} (crednumber, password, socclass, robot, name) VALUES (%s,%s,%s,%s,%s);", 
                     (recieved.get("crednumber"), recieved.get("password"), 
                      recieved.get("socclass"), recieved.get("robot"), recieved.get("name")))
    return redirect('/thanks', code=302)

@app.route("/thanks", methods=['GET'])
def thanks():
    return render_template('thanks.html')

@app.route("/decline", methods=['GET'])
def decline():
    return render_template('decline.html')