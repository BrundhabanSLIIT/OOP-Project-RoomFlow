package com.example.roomflow.backend.model;

public class Customer{
    private String customerId;
    private String customerName;
    private String contactNumber;

    public Customer() {
    }

    public Customer(String customerId, String customerName, String contactNumber){
        this.customerId = customerId;
        this.customerName = customerName;
        this.contactNumber = contactNumber;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }
}