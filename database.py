# pip install mysql-connector-python
import mysql.connector
import streamlit as st

mydb = mysql.connector.connect(
    host="localhost",
    port=8111,
    user="root",
    # password="password",
    database="club_members"
)
c = mydb.cursor()
# dhfdjahdhfaohfda hjfhjahkjh jfhajh
def add_data(customer_fname,customer_lname,customer_id,customer_age,customer_addr,customer_membershiplan,customer_phone,customer_sex,customer_club):
    if customer_fname!="" and customer_addr!="" and customer_age!="" and customer_lname!=0 and customer_id!=0 and customer_phone!=0 :
        c.execute('INSERT INTO customer_details VALUES (%s,%s,%s,'
                '%s,%s,%s,%s,now())',
                (customer_id,customer_fname,customer_lname,customer_addr,customer_club,customer_membershiplan,customer_phone))
        mydb.commit()
        st.success("Successfully added Customer: {}".format(customer_fname+customer_lname))
    else:
        st.warning("Please enter all values")


def view_all_data(tablename):
    c.execute(f'SELECT * FROM {tablename}')
    data = c.fetchall()
    return data

def execquery(query):
    try:
        c.execute(query)
        data = c.fetchall()
        st.success("Successfully executed query")
        return data
        
    except:
        # st.warning(error.message)
        st.warning("Invalid Query")

def get_attributes(table):
    c.execute(f'select * from {table}')
    res = c.fetchall()
    attributes = c.column_names
    return attributes


def view_only_cutomerID():
    c.execute('SELECT customer_id FROM customer_details')
    data = c.fetchall()
    return data


def get_customer(customer_id):
    c.execute('SELECT * FROM customer_details WHERE customer_id="{}"'.format(customer_id))
    data = c.fetchall()
    return data


def edit_customer_data(new_customer_id,new_customer_fname,new_customer_lname,new_customer_address,new_customer_club,new_customer_membershiplan,new_customer_phone, customer_id,customer_fname,customer_lname,customer_address,customer_club,customer_membershiplan,customer_phone):
    c.execute("UPDATE customer_details SET  customer_id=%s, customer_fname=%s, customer_lname=%s, customer_addr=%s,customer_club=%s,customer_membershiplan=%s, phone_no=%s WHERE customer_id=%s and customer_fname=%s and customer_lname=%s and customer_addr=%s and customer_club=%s and customer_membershiplan=%s and phone_no=%s", (new_customer_id,new_customer_fname,new_customer_lname,new_customer_address,new_customer_club,new_customer_membershiplan,new_customer_phone,customer_id,customer_fname,customer_lname,customer_address,customer_club,customer_membershiplan,customer_phone))
    mydb.commit()
    data = c.fetchall()
    return data


def delete_data(customer_id):
    c.execute('DELETE FROM customer_details WHERE customer_id="{}"'.format(customer_id))
    mydb.commit()
