# 🧠 Quote Data 
---

Scrape quotes from **quotes.toscrape.com**, analyze patterns across **authors** and **tags**, and present insights with clean visuals and SQL. This repository serves as an end-to-end pipeline for web scraping and data exploration.

---

## ✨ Highlights

- 🔎 **Scraping**: Paginated crawl of quotes, authors, tags
- 🧹 **Clean dataset**: Saved to CSV for reproducibility
- 📊 **EDA & Visuals**: Explore top authors, tag trends, text lengths
- 🧮 **SQL Insights**: Quick, reusable queries
- 🖼️ **Presentation**: Slide deck summarizing findings

---

## 🗂️ Project Structure

```
├── Quotes_web_scrapping.ipynb              # Scrape quotes, authors, tags
├── quotes.csv                              # Exported dataset
├── Quotedata_sql_insights.sql              # Handy SQL queries
├── Quotes_eda_visualization.ipynb          # Visual analytics
└── Quotes Presentation.pptx                # Summary slides
```
---

## 🧰 Tech Stack

- **Python**: requests, BeautifulSoup4, pandas, numpy
- **Viz**: matplotlib, seaborn, plotly (optional)
- **SQL**: SQLite / any SQL client for the provided queries
- **Environment**: Jupyter Notebooks

---

Run in order:
1) `Quotes_web_scrapping.ipynb`  
2) `Quotes_eda_visualization.ipynb`  
(Optional) Explore `Quotes SQL Insights.sql` in your SQL client.  
Review `Quotes Presentation.pptx` for a better summary.

---

## 📦 Data Schema (quotes.csv)

| column       | type    | description                         |
|--------------|---------|-------------------------------------|
| `text`       | string  | Quote content                       |
| `author`     | string  | Quote author                         |
| `tags`       | string  | Comma‑separated tags                 |
| `length`     | int     | Character length (derived feature)   |

---

## 🔍 Example Analyses (Notebook)

- **Top Authors** by number of quotes  
- **Tag Popularity** and co‑occurrence  
- **Quote Length** distributions (by tag/author)  
- **Word Clouds** or frequent n‑grams (optional)  

---

## 🗃️ Example SQL Queries

```sql
-- 1) Most prolific authors
SELECT author, COUNT(*) AS total_quotes
FROM quotes
GROUP BY author
ORDER BY total_quotes DESC;

-- 2) Longest quotes (by length)
SELECT author, text, length
FROM quotes
ORDER BY length DESC
LIMIT 10;

-- 3) Tag frequency (if tags are normalized)
SELECT t.tag, COUNT(*) AS uses
FROM quote_tags qt
JOIN tags t ON t.id = qt.tag_id
GROUP BY t.tag
ORDER BY uses DESC;
```

> If tags are stored as a comma‑separated string in one column, consider normalizing into a `tags` table first.

---

## 🧪 Reproducibility Tips

- Keep raw vs processed data separated
- Use consistent user‑agent & polite delays when scraping
- Parameterize page limits for quick reruns
- Document any manual fixes in the scraping notebook

---

## 🚀 Roadmap

- [ ] Add **Scrapy** spider for scalability
- [ ] Add **Sentiment Analysis** on quotes
- [ ] Build **Streamlit** mini‑dashboard
- [ ] Normalize tags into relational tables
- [ ] Unit tests for the scraper

---
