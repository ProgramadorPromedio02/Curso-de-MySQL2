import mysql.connector

def print_user(user):

    config = {
        "host": "127.0.0.1",
        "port": "3306",
        "database": "hello_mysql",
        "user": "root",
        "password": "123456789"
    }

    connection = mysql.connector. connect(**config)
    cursor = connection.cursor()

    query = "SELECT * FROM users WHERE name=%s;"
    cursor.execute(query, (user,))
    result = cursor.fetchall()

    for row in result:
        print(row)

    cursor.close()
    connection.close()

# Ejecución de un programador medio
# print_user("Brais")

# Ataque malicioso por un SQL INJECTION de un hacker(Experto en ciberseguridad)
# print_user("'; UPDATE users SET age = '15' WHERE user_id = 1; --")
