# 🧠 Smart News Platform

A full-stack, cloud-enabled news aggregation app that delivers real-time, intelligent news updates with sentiment and topic analysis. Built with **Flask**, **Flutter**, and **Firebase**, this project combines web scraping, machine learning, and modern UI/UX for an intuitive user experience.

---

## 🚀 Features

- 🔍 **News Aggregation**: Scrapes news headlines and content from various trusted sources using **BeautifulSoup**.
- 💬 **Sentiment Analysis**: Uses **VADER** to classify news tone as positive, neutral, or negative.
- 🗂️ **Topic Classification**: Classifies articles into categories using a **Naive Bayes** classifier.
- 🌐 **RESTful API**: Backend developed with **Flask** and secured with authentication.
- 🔄 **Real-Time Updates**: Integrated with **Firebase Realtime Database** for live news sync.
- 🔐 **User Authentication**: Firebase-based secure sign-up and login.
- 📱 **Cross-Platform UI**: Built using **Flutter** for responsive design across Android, iOS, and web.
- 🧩 **Modular & Scalable Architecture**: Clean separation of concerns with asynchronous API calls and well-structured code.

---

## 🛠️ Tech Stack

| Layer           | Technology                     |
|----------------|---------------------------------|
| Frontend        | Flutter                         |
| Backend         | Flask (Python)                  |
| Database        | Firebase Realtime Database      |
| Authentication  | Firebase Auth                   |
| Web Scraping    | BeautifulSoup                   |
| Sentiment       | VADER Sentiment Analysis        |
| Classification  | Naive Bayes (Scikit-learn)      |
| Hosting         | Firebase Cloud                  |



## 🧪 How It Works

1. **Scraper** fetches live news data from online sources.
2. Each article is passed through:
   - **Sentiment analyzer** (VADER)
   - **Topic classifier** (Naive Bayes)
3. Processed news is stored in **Firebase**.
4. **Flutter frontend** displays news in real-time with categories and sentiment labels.
5. Users can **sign in**, **filter by topic or sentiment**, and **get live updates**.

---

## 📦 Installation & Setup


### 🔧 Backend (Flask)

```bash
git clone https://github.com/your-username/smart-news-platform.git
cd smart-news-platform/backend
pip install -r requirements.txt
python app.py
