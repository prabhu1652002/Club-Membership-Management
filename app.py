# Importing pakages
import streamlit as st
import mysql.connector

from create import create
# from database import create_table
from delete import delete
from read import read
from update import update
from query import QueryBox
from login import loginlogout
mydb = mysql.connector.connect(
    host="localhost",
    port=8111,
    user="root",
    # password="password"
)
c = mydb.cursor(dictionary=True)

# c.execute("CREATE DATABASE ebike")


def add_bg_from_url():
    st.markdown(
         f"""
         <style>
         .stApp {{
             background-image: url("https://www.pixelstalk.net/wp-content/uploads/2016/03/Dark-Wallpaper-Desktop-Background-1B6-768x432.jpg");
             background-attachment: fixed;
             background-size: cover
         }}
         </style>
         """,
         unsafe_allow_html=True
     )

def main():
    add_bg_from_url() 
    st.title("Club membership Management system")
    
    menu = ["Login","Add", "View", "Edit", "Remove","Custom Query"]
    choice = st.sidebar.selectbox("Menu", menu)

    # create_table()
    if choice == "Login":
        st.subheader("Enter login details:")
        loginlogout()
    if choice == "Add":
        st.subheader("Add new customer details:")
        create()
    elif choice == "View":
        st.subheader("View created tasks")
        read()
    elif choice == "Edit":
        st.subheader("Update created tasks")
        update()
    elif choice == "Remove":
        st.subheader("Delete created tasks")
        delete()
    elif choice == "Custom Query":
        st.subheader("Enter valid query to be executed")
        QueryBox()


if __name__ == '__main__':
    main()
