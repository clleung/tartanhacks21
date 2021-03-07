import psycopg2
import sys
import datetime
from decimal import Decimal
from flask import Flask, render_template, Response, request

app=Flask(__name__)
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0

@app.route('/', methods=['GET','POST'])
def plot():
    # Read form input
    option1 = request.form.getlist('categories')
    option2 = request.form.get('options')
    if option1 is None:
        option1 = "None picked"
    
    output = get_data()
    return render_template('index.html')

def get_data():
    #Gets data from database
    tmpl = '''
        SELECT *
          FROM Person;
    '''
    cmd = cur.mogrify(tmpl)
    cur.execute(cmd)
    rows = cur.fetchall()

    p = "<table><tr><td>ID</td><td>First Name</td><td>Last Name</td></tr>"
    for row in rows:
        # if str(row[0]) in indices:
        p = p + "<tr><td>%s</td>"%row[0]
        p = p + "<td>%s</td>"%row[1]
        p = p + "<td>%s</td></tr>"%row[2]
    p = p + "</table>"
    return p

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

    