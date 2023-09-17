from flask import Flask, request, jsonify, session
from flask_cors import CORS
import time
import json
from db import Database

app = Flask(__name__)
FLASK_DEBUG = 1

CORS(app, resource={r'/*': {'origin': 'http://127.0.0.1:8080/', 'supports_credentials': 'true'}})


@app.route('/sample', methods=['GET'])
def sample():
    temp = []
    db_conn = Database()
    cursor = db_conn.getcursor()

    sql = "SELECT * from languages"
    cursor.execute(sql)
    # print("++++++++++++++++")
    if cursor.rowcount > 0 :
        temp =  [ id['name'] for id in cursor.fetchall() ]

    return temp

@app.route('/getTagSuggestions', methods=['GET'])
def getTagSuggestions():
    db_con = Database()
    cursor = db_con.getcursor()
    args = request.args
    key = args["tagText"] + '%'
    # print("-----------")

    sql = "SELECT t.id,t.name as value FROM languages t WHERE t.name LIKE %s ORDER BY LENGTH(t.name) LIMIT 25"
    params = (key,)
    cursor.execute(sql, params)

    suggestions = cursor.fetchall()

    db_con.closeconn()
    return jsonify(suggestions)


@app.route('/getToolNames', methods=['POST'])
def getToolNames():
    db_con = Database()
    cursor = db_con.getcursor()
    # project_id = request.form["testProjectID"] tech_option
    tags = json.loads(request.form["selectedTags"])
    tech_option = json.loads(request.form["tech_option"])
    
    lang_id = [ id['id'] for id in tags]
    
    tech_ids  = [ id['id'] for id in tech_option if id['value']]
    join = "%s," * (len(tech_ids) - 1) + "%s"

    val1 = tech_ids
    sql1 = "SELECT DISTINCT tools_id FROM relation where tech_id in ("+ join +")"
    cursor.execute(sql1, val1)
    result1 = cursor.fetchall()
    tool_ids = [ id['tools_id'] for id in result1]

    tech_info = {
        1: [1,2],
        2: [3,4,17,1,6,5,13], 
        3: [16,1], 
        4: [22,23,24,25,26], 
        5: [21, 12,1,2,15, 8,4,5,20,19,7,13], 
        6: [9,1,2,5,7,13,14], 
        7: [21,12,9,18,6,1,2,15,5,7,19,14,], 
        8: [9,1,13,8,5,7], 
        9: [1,2,9,7,5], 
        10: [1,10,6,11,33,31,29], 
        11: [1,7,8],
        12: [2],
        13: [6,18,8,5,2], 
        14: [9,21,2,5,7,13], 
        15: [13,1,8,5,20,7,9], 
        16: [1], 
        17: [1,2,14,7],
        18: [2,7], 
        19: [2,1,7], 
        20: [1,39], 
        21: [1,7,13,32],
        22: [1,9,12,21,2,14,7,34,37,5,15,13,6,18,19,31,37],
        23: [1,7,8,13,5,32],  
        24: [21,9,12,18,34],
        25: [6,5,2],
        26: [1,13], 
        27: [6,18,2,5,38], 
        28: [32,3,6], 
        29: [6,2,5,18,13], 
        30: [2,34], 
        31: [28,32,3,6,2], 
        32: [12,21], 
        33: [1,12,21,32], 
        34: [13],
        35: [32],
        36: [9,12,21,1,7,2,17,15,5,13],
        37: [1,40],
        38: [12,21,2,7,1,15,5],
        39: [9,12,21,1,7,17],
        40: [32,1,5],
        41: [1,2,7,13,9],
        42: [2,15,1,14],
        43: [6,1,5,2,13,5,28],
        44: [41,2]
    }

    res = []
    t1 = {}
    for id in tool_ids:
        print(id)
        count = 0
        for i in lang_id:
            if i in tech_info[id]:
                count = count + 1
        if count > 1:
            res.append(id)
    result = []
    if len(res) > 0:
    
        join = "%s," * (len(res) - 1) + "%s"
        val = res
        sql = "SELECT * FROM tools where id in ("+ join +")"
        cursor.execute(sql, val)
        result = cursor.fetchall()
    
    print(result)
    db_con.closeconn()
    return jsonify(result)


@app.route('/sample2', methods=['GET'])
def sample2():
    temp = []
    db_conn = Database()
    cursor = db_conn.getcursor()
    name = request.args.get('name')

    print(name)
    ts = time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime())
    val = (name, ts,)
    sql = "INSERT INTO sample (name, time) values (%s, %s)"
    cursor.execute(sql, val)
    # print("++++++++++++++++")
    # if cursor.rowcount > 0 :
    #     temp =  [ id['name'] for id in cursor.fetchall() ]

    return "done"

if __name__ == "__main__":
    CORS(app, resources={r'/*': {'origin': 'http://127.0.0.1:8080/', 'supports_credentials': 'true'}})
    app.run(debug=True, host="localhost", port="5000", threaded=True, processes=1)
