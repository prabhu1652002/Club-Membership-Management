import streamlit as st
import mysql.connector

import pandas as pd
mydb = mysql.connector.connect(
    host="localhost",
    port=8111,
    user="root",
    # password="password",
    database="club_members"
)
c = mydb.cursor(dictionary=True)

def query_executor(raw_code):
	c.execute(raw_code)
	data = c.fetchall()
    # st.success("Successfully executed query")
	return data
def QueryBox():
    col1, col2 = st.columns(2)

    with col1:
        with st.form(key='query_form'):
            raw_code = st.text_input("SQL Code Here")
            submit_code = st.form_submit_button("Execute")

    with col2:
        if submit_code:
            st.info("Query Submitted")
            st.code(raw_code)

    if submit_code:
        query_results = query_executor(raw_code)
        st.success("Successfully executed query")

        # with st.beta_expander("Results"):
        #     st.write(query_results)

        with st.expander("Result Table"):
            query_df = pd.DataFrame(query_results)
            st.dataframe(query_df)
