from flask import Flask, render_template, Response, request

app=Flask(__name__)
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0

@app.route('/', methods=['GET','POST'])
def plot():
    # Read form input
    option1 = request.form.get('options')
    option2 = request.form.getlist('categories')
    if option1 is None:
        option1 = "None picked"
    return render_template('home.html', option1 = option1, option2 = option2)

# No caching at all for API endpoints.
@app.after_request
def add_header(response):
    response.headers['X-UA-Compatible'] = 'IE=Edge,chrome=1'
    response.headers['Cache-Control'] = 'no-cache, no-store, public, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    return response

if __name__ == "__main__":
    import webbrowser
    webbrowser.open("http://127.0.0.1:5000/")
    app.run(debug=False)