import pandas as pd
import streamlit as st
from database import view_all_data, view_only_cutomerID, delete_data,get_attributes


def delete():
    table1="customer_details";
    result = view_all_data(table1)
    attr=get_attributes(table1)
    df = pd.DataFrame(result, columns=attr)
    with st.expander("Current data"):
        st.dataframe(df)

    list_of_customers = [i[0] for i in view_only_cutomerID()]
    selected_customerID = st.selectbox("Task to Delete", list_of_customers)
    st.warning("Do you want to delete ::{}".format(selected_customerID))
    if st.button("Delete Customer"):
        delete_data(selected_customerID)
        st.success("Customer has been deleted successfully")
    new_result = view_all_data(table1)
    df2 = pd.DataFrame(new_result, columns=attr)
    with st.expander("Updated data"):
        st.dataframe(df2)