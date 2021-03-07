import psycopg2
import sys
import datetime
from decimal import Decimal
from flask import Flask, render_template, Response, request, redirect

app=Flask(__name__)
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0

@app.route('/', methods=['GET','POST'])
@app.route('/index.html', methods=['GET','POST'])
def index():
    # option1 = request.form.getlist('categories')
    return render_template('index.html')

@app.route('/login.html', methods=['GET','POST'])
def login():
    return render_template('login.html')

@app.route('/info.html', methods=['GET','POST'])
def info():
    first_name = request.form.get('first_name')
    last_name = request.form.get('last_name')
    # email = request.form.get('email')
    # password = request.form.get('password')
    email = "filler@gmail.com"
    password = "password"
    birthday = request.form.get('birthday')
    street_1 = request.form.get('street_1')
    street_2 = request.form.get('street_2')
    city = request.form.get('city')
    state = request.form.get('state')
    zip = request.form.get('zip')
    insert_data(first_name, last_name, email, password, birthday, street_1, street_2, city, state, zip)
    return render_template('info.html')

def new_person_id():
    id_tmpl = '''
        SELECT person_id
          FROM Person
         ORDER BY person_id DESC
         LIMIT 1;
    '''
    cmd = cur.mogrify(id_tmpl)
    cur.execute(cmd)
    ids = cur.fetchone()
    for id in ids:
        return id+1

def insert_data(first_name, last_name, email, password, birthday, street_1, street_2, city, state, zip):
    #Gets data from database
    if first_name:
        insert_tmpl = '''
            INSERT INTO Person(person_id, first_name, last_name, email, password, birthday, street_1, street_2, city, state, zip)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        '''
        new_id = new_person_id()
        cmd = cur.mogrify(insert_tmpl,(new_id, first_name, last_name, email, password, birthday, street_1, street_2, city, state, zip))
        cur.execute(cmd)

# No caching at all for API endpoints.
@app.after_request
def add_header(response):
    response.headers['X-UA-Compatible'] = 'IE=Edge,chrome=1'
    response.headers['Cache-Control'] = 'no-cache, no-store, public, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    return response

if __name__ == "__main__":
    try:
        conn = psycopg2.connect(dbname="postgres", user="postgres", password="DyingHackers", host="104.198.202.2", port="5432", sslmode="verify-ca", sslrootcert="server-ca.pem", sslcert="client-cert.pem", sslkey="client-key.pem")
        conn.autocommit = True
        cur = conn.cursor()
    except psycopg2.Error as e:
        print("Unable to open connection: %s" % (e,))

    import webbrowser
    webbrowser.open("http://127.0.0.1:5000/")
    app.run(debug=False)

    