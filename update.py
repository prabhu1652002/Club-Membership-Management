import datetime

import pandas as pd
import streamlit as st
from database import view_all_data, view_only_cutomerID, get_customer, edit_customer_data,get_attributes


def update():
    result = view_all_data("customer_details")
    attr =get_attributes("customer_details")
    # st.write(result)
    df = pd.DataFrame(result, columns=attr)
    with st.expander("Current Customers"):
        st.dataframe(df)
    list_of_customerID = [i[0] for i in view_only_cutomerID()]
    selected_cutomersID = st.selectbox("Customer to Edit", list_of_customerID)
    selected_result = get_customer(selected_cutomersID)
    # st.write(selected_result)

    if selected_result:

        customer_id = selected_result[0][0]
        customer_fname = selected_result[0][1]
        customer_lname = selected_result[0][2]
        customer_address = selected_result[0][3]
        customer_club = selected_result[0][4]
        customer_membershiplan = selected_result[0][5]
        customer_phone = selected_result[0][6]

        # Layout of Create

        
        new_customer_id = st.text_input("ID:", customer_id)
        new_customer_fname = st.text_input("FName:", customer_fname)
        new_customer_lname = st.text_input("LName:", customer_lname)
    
        new_customer_club = st.selectbox("Change Club to:", ["Royal Orchid", "Palm Meadows", "Signature Club","Clark's Exotica"])
        new_customer_phone = st.text_input("Edit Phone No:",customer_phone)
        
        st.subheader("Available Plans:")
        st.text("1:1 month(5000 INR)")
        st.text("2:6 months(25000 INR)")
        st.text("3:12 months(50000 INR)")

        new_customer_membershiplan = st.selectbox("Choose Plan:", [1,2,3])
        new_customer_address = st.text_input("Edit Address:", customer_address)
        
        if st.button("Update Customer Details"):
            edit_customer_data(new_customer_id,new_customer_fname,new_customer_lname,new_customer_address,new_customer_club,new_customer_membershiplan,new_customer_phone, customer_id,customer_fname,customer_lname,customer_address,customer_club,customer_membershiplan,customer_phone)
            st.success("Successfully updated")

    result2 = view_all_data("customer_details")
    df2 = pd.DataFrame(result2, columns=attr)
    with st.expander("Updated data"):
        st.dataframe(df2)
