import streamlit as st
from database import add_data


def create():
    
    col1, col2 = st.columns(2)
    with col1:
        customer_id = st.text_input("ID:")
        customer_fname = st.text_input("FirstName:")
        customer_phone = st.text_input("Phone No:")
    with col2:
        customer_sex = st.selectbox("Gender", ["Male", "Female", "Other"])
        customer_lname = st.text_input("LastName:")
        customer_age = st.text_input("Age:")
    
    customer_addr = st.text_input("Address:")

    st.subheader("Available Plans:")
    st.text("1:1 month(5000 INR)")
    st.text("2:6 months(25000 INR)")
    st.text("3:12 months(50000 INR)")

    customer_membershiplan = st.selectbox("Choose Plan:", [1,2,3])
    customer_club = st.selectbox("Choose Club:", ["Royal Orchid", "Palm Meadows", "Signature Club","Clark's Exotica"])
    st.text(" ")
    if st.button("Add Customer"):
        
        add_data(customer_fname,customer_lname,customer_id,customer_age,customer_addr,customer_membershiplan,customer_phone,customer_sex,customer_club)

        
