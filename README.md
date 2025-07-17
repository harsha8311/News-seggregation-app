# 🧠 Smart News Platform

This project is a full-stack, cloud-enabled news aggregation platform that delivers real-time news updates along with sentiment and topic analysis. Built using **Flask**, **Flutter**, and **Firebase**, it scrapes news from the web, analyzes the sentiment, classifies topics, and presents an intuitive UI for users.

---

## 🎯 Objective

To create an intelligent news app that aggregates articles from various sources, applies **sentiment analysis** and **topic classification**, and delivers a clean, real-time, cross-platform user experience. The system helps users get categorized and emotion-aware news on the go.

---

## 🛠️ Tech Stack

- **Flutter** – Frontend (Android/iOS/Web)
- **Flask (Python)** – Backend API
- **Firebase Realtime Database** – Cloud data storage
- **Firebase Auth** – Secure authentication
- **BeautifulSoup** – Web scraping
- **VADER** – Sentiment analysis
- **Naive Bayes** – Topic classification

---

## 🤖 ML/NLP Features

| Task                 | Description                                       |
|----------------------|---------------------------------------------------|
| Sentiment Analysis   | Used **VADER** to classify articles as Positive, Negative, or Neutral |
| Topic Classification | Applied **Naive Bayes** for identifying news categories |

---

## 🔄 Real-Time Features

- Real-time article updates with **Firebase**
- Live sentiment and topic tagging
- Secure user login and preferences using **Firebase Auth**

---

## 🧪 Project Workflow

### 1. Data Collection:
- Scraped headlines and articles using `requests` and `BeautifulSoup`

### 2. NLP Processing:
- Preprocessed text
- Performed sentiment classification (VADER)
- Classified topics (Naive Bayes)

### 3. API & UI:
- Exposed Flask REST APIs for frontend use
- Flutter UI built for responsiveness across devices

---

## 📈 Features Considered

- News headline and body
- Sentiment score
- Predicted topic
- Timestamp and source

---

## ⚙️ How to Run

### Backend (Flask):
```bash
cd backend/
pip install -r requirements.txt
python app.py
