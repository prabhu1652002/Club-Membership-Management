import pandas as pd
import streamlit as st
from database import view_all_data, view_only_cutomerID, delete_data,get_attributes
import mysql.connector
from datetime import datetime

import pandas as pd


mydb = mysql.connector.connect(
    host="localhost",
    port=8111,
    user="root",
    # password="password",
    database="club_members"
)
c = mydb.cursor(dictionary=True)

def loginlogout():
    col1, col2 = st.columns(2)
    with col1:
        cust_idin=st.text_input("Enter your ID Number to login:")
        
        if st.button("Login"):
            # try:
            c.execute(f"INSERT INTO LOGREG VALUES({cust_idin},now())")
            mydb.commit()
            st.success(f"Logged in {cust_idin}")
            # except:
                # st.warning("Logout before logging in.")
    with col2:
        cust_idout=st.text_input("Enter your ID Number to logout:")

        if st.button("Logout"):
            c.execute(f"delete from LOGREG where customer_id={cust_idout}")
            mydb.commit()
            st.success(f"Logged out {cust_idin}")

    