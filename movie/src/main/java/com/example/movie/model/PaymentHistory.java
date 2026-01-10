package com.example.movie.model;
import java.sql.Date;
import java.sql.Timestamp;

    public class PaymentHistory {
        private String planName;    //
        private double price;       //
        private Timestamp createdDate; //
        private String status;      //

        public PaymentHistory() {
        }

        public PaymentHistory(String planName, double price, Timestamp createdDate, String status) {
            this.planName = planName;
            this.price = price;
            this.createdDate = createdDate;
            this.status = status;
        }

        // Getter và Setter
        public String getPlanName() { return planName; }
        public void setPlanName(String planName) { this.planName = planName; }

        public double getPrice() { return price; }
        public void setPrice(double price) { this.price = price; }

        public Timestamp getCreatedDate() { return createdDate; }
        public void setCreatedDate(Timestamp createdDate) { this.createdDate = createdDate; }

        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
    }

