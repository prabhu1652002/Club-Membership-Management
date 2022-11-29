import pandas as pd
import streamlit as st
# import plotly.express as px
from database import get_attributes
import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    port=8111,
    user="root",
    database='club_members'
    # password="password"
)
c=mydb.cursor(dictionary=True)
def view_all_data(tablename):
    c.execute(f'SELECT * FROM {tablename}')

    data = c.fetchall()
    mydb.commit()
    return data
def read():
    result1=view_all_data("customer_details")
    result2=view_all_data("employee_details")
    result3=view_all_data("club")
    result4=view_all_data("club_membership")
    result5=view_all_data("amenity")
    
    if st.button("Generate Customer Details"):
        # st.write(result)
        with st.expander("View Customer Details"):
            df = pd.DataFrame(result1)
            st.dataframe(df)

    if st.button("Generate Employee Details"):
        
        # st.write(result)
        with st.expander("View Employee Details"):
            df = pd.DataFrame(result2)
            st.dataframe(df)

    if st.button("Generate Club Details"):
        
        # st.write(result)
        with st.expander("View Club Details"):
            df = pd.DataFrame(result3)
            st.dataframe(df)

    if st.button("Generate Club membership Details"):
        
        # st.write(result)
        with st.expander("View Club Membership"):
            df = pd.DataFrame(result4)
            st.dataframe(df)

    if st.button("Show Amenity Details"):
    
        with st.expander("View Amenity Details"):
            df = pd.DataFrame(result5)
            st.dataframe(df)

    